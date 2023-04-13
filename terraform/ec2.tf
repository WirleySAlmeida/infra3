resource "aws_instance" "kubernetes" {        # Cria três instâncias na AWS com o nome de "kubernetes"
  count                  = 3                  # Número de instâncias criadas
  instance_type          = var.tipoinstancia  # Tipo de instância
  ami                    = var.ami            # código da imagem
  subnet_id              = var.subrede_pub    # subrede
  vpc_security_group_ids = ["${aws_security_group.acesso_total_local.id}", "${aws_security_group.acesso_web.id}"] # grupos de segurança na AWS

  tags = {  # rótulo para identificação da instância
    "Name" = "kubernetes-${var.username}-${count.index}"
  }
  key_name = aws_key_pair.terraform-chave.key_name    # chave pública para fazer login nas instâncias

}

resource "aws_instance" "ansibleserver" {     # instância do Ansible na AWS
  instance_type          = var.tipoinstancia
  ami                    = var.ami
  subnet_id              = var.subrede_pub
  vpc_security_group_ids = ["${aws_security_group.acesso_total_local.id}", "${aws_security_group.ssh_publico.id}"]

  tags = {
    "Name" = "ansible-${var.username}"
  }
  key_name = aws_key_pair.terraform-chave.key_name

  # lista de comandos a serem executados dentro da instância
  user_data = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install software-properties-common -y
        sudo add-apt-repository --yes --update ppa:ansible/ansible -y
        sudo apt-get install ansible -y
    EOF
}



