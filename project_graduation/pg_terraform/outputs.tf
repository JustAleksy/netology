output "jenkins_master_ip" {
  description = "IP-адрес Jenkins Master"
  value       = yandex_compute_instance.jenkins_instances["jenkins-master"].network_interface[0].ip_address
}

output "jenkins_agent_ip" {
  description = "IP-адрес Jenkins Agent"
  value       = yandex_compute_instance.jenkins_instances["jenkins-agent"].network_interface[0].ip_address
}

output "jump_host_public_ip" {
  description = "Публичный IP Jump Host"
  value       = yandex_compute_instance.jump_host.network_interface[0].nat_ip_address
}

output "k8s_master_ips" {
  description = "IP-адреса Kubernetes мастер-нод"
  value       = yandex_compute_instance.k8s_master_nodes[*].network_interface[0].ip_address
}

output "k8s_worker_ips" {
  description = "IP-адреса Kubernetes воркер-нод"
  value       = yandex_compute_instance.k8s_worker_nodes[*].network_interface[0].ip_address
}

output "bucket_name" {
  description = "Имя созданного бакета для хранения Terraform state"
  value       = yandex_storage_bucket.tf_state_bucket.bucket
}

output "kms_key_id" {
  description = "ID KMS ключа для шифрования"
  value       = yandex_kms_symmetric_key.tf_state_key.id
}