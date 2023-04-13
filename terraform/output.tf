# exporta as configurações estruturas dos recursos implementados na nuvem da aws
# deixa todos as informações disponíveis para o cli e para todas as partes do projeto

# configurações do ip público do kubernetes1, com descrição e valores
output "ip_publico_k8s1" { # exporta os 
    description = "IPs publico kubernetes1"
  value = aws_eip.k8s1.public_ip
}

# configurações do ip privado do kubernetes1,com descrição e valores
output "ip_privado_k8s1" {
    description = "IPs privado kubernetes1"
  value = aws_instance.kubernetes.*.private_ip
}

# configurações do ip público do kubernetes2, com descrição e valores
output "ip_publico_k8s2" {
    description = "IPs publico kubernetes2"
  value = aws_eip.k8s2.public_ip
}

# configurações do ip público do Kubernetes3, com descrição e valores
output "ip_pprivado_k8s2" {
    description = "IPs privado kubernetes1"
  value = aws_instance.kubernetes.*.private_ip
}

#configurações do ip publico do Kubernetes3, valores e descrição do mesmo
output "ip_publico_k8s3" {
    description = "IPs publico kubernetes3"
  value = aws_eip.k8s3.public_ip
}

#configurações do ips privados do Kubernetes3, valores e descrição do mesmo
output "ip_privado_k8s3" {
    description = "IPs privado kubernetes1"
  value = aws_instance.kubernetes.*.private_ip
}

# configurações do ip publico do Ansible, valores e descrição do mesmo
output "ip_publico_ansible" {
    description = "IPs publico ansible"
  value = aws_eip.ansible.public_ip
}