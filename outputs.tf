output "instance_ip" {
    description = "The public IP of the instance"
    value       = module.compute_instance.instance_ip
}
