
# Terraform GCP Modules

This project contains Terraform configurations to deploy a Google Cloud Platform (GCP) infrastructure, including a compute instance running Nginx and a firewall rule to allow HTTP/HTTPS traffic.

## Project Structure

- `main.tf`: Main configuration file that defines the provider and includes the compute module.
  - **Provider Configuration**: Specifies the GCP provider and its credentials.
  - **Data Sources**: Fetches external data, like the startup script from a URL.
  - **Module Calls**: References and configures the compute instance module.

- `modules/compute/`: Contains the submodule for the compute instance and related resources.
  - `firewall.tf`: Defines firewall rules for the compute instance.
    - **Firewall Rules**: Specifies the allowed traffic (ports 80 and 443) and source IP ranges.
  - `main.tf`: Defines the compute instance and attached disk.
    - **Compute Instance**: Configures the VM, including its machine type, zone, tags, boot disk, network interface, and metadata.
    - **Disk Attachment**: Manages additional persistent disks and their attachment to the compute instance.
  - `outputs.tf`: Outputs the public IP of the compute instance.
    - **Instance IP Output**: Exposes the public IP address for easy access.
  - `variables.tf`: Declares variables used in the compute module.
    - **Variable Declarations**: Lists the required input variables with descriptions and default values if applicable.

- `outputs.tf`: Defines outputs for the root module.
  - **Root Module Outputs**: Includes outputs from submodules to be accessed at the top level.
- `scripts/setup_nginx.sh`: Startup script to install and configure Nginx on the compute instance.
  - **Nginx Setup Script**: Bash script that updates the package list, installs Nginx, creates a simple HTML page, and starts the Nginx service.
- `variables.tf`: Declares variables for the root module.
  - **Root Variables**: Defines the variables used in the root module, including project settings and credentials.

## Requirements

- A [Terraform Cloud](https://www.terraform.io/cloud) account
- A GCP account with the necessary permissions to create resources
- Optional- Google Cloud SDK installed and configured

## Variables

The following variables need to be set, either in `terraform.tfvars` or via Terraform Cloud:

- `project_id`: The Google Cloud project ID.
- `region`: The region to deploy resources in.
- `zone`: The zone to deploy resources in. Default: `us-central1-a`
- `image`: The image to use for the boot disk. Default: `projects/debian-cloud/global/images/family/debian-11`
- `startup_script_url`: URL to the startup script. Default: `https://raw.githubusercontent.com/YavorMarkov/terraform-gcp-modules/main/scripts/setup_nginx.sh`
- `my_ip`: Your public IP address for restricted access.
- `GOOGLE_CREDENTIALS`: The JSON credentials file for Google Cloud. (Sensitive)
- `startup_script`: Content of the startup script.

## Usage

1. **Initialize Terraform:**

    ```bash
    terraform init
    ```

2. **Plan the Infrastructure:**

    ```bash
    terraform plan
    ```

3. **Apply the Configuration:**

    ```bash
    terraform apply
    ```

4. **Access the Instance:**

    Once applied, Terraform will output the public IP address of the compute instance. You can use this IP to access the Nginx welcome page.

## Outputs

- `instance_ip`: The public IP address of the compute instance.

## Troubleshooting

If you cannot access the Nginx page:

1. **Check Firewall Rules:**
   Ensure your IP address is correctly set and allowed through the firewall.

2. **Verify Nginx Installation:**
   SSH into the instance and check if Nginx is installed and running:

    ```bash
    gcloud compute ssh <instance-name> --zone=<zone>
    sudo systemctl status nginx
    ```

3. **Check Startup Script Logs:**
   Verify if the startup script executed successfully:

    ```bash
    sudo journalctl -u google-startup-scripts.service
    ```

4. **Ensure Metadata Configuration:**
   Ensure the instance metadata is correctly set with the startup script content.

## License

This project is licensed under the MIT License.
