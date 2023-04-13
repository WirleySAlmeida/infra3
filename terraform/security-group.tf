resource "aws_security_group" "acesso_total_local" {  # comando para criação de um security group para acesso ao SSH pela VPC
  vpc_id      = var.vpc_id                            # id da VPC referenciada
  description = "liberacao de SSH para rede da VPC"   # descrição do security group
  ingress {                                           # intervalo de portas de entrada
    from_port   = 0                                   # porta de início
    to_port     = 0                                   # porta de fim
    protocol    = "-1"                                # tipo de protocolo utilizado
    cidr_blocks = [var.bloco_vpc]                     # bloco de IPs para aplicação do security group
  }
  egress {                                            # intervalo de portas de saída
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.bloco_internet]
  }

  tags = {                                            # rótulo para identificação do security group
    "Name" = "${var.username}-acesso_total_local"
  }
}

resource "aws_security_group" "ssh_publico" {         # comando para criação de um security group para acesso público de SSH
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.bloco_internet]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.bloco_internet]
  }
  tags = {
    "Name" = "${var.username}-ssh_publico"
  }
}

resource "aws_security_group" "acesso_web" {          # comando para criação de um security group para acesso à internet por HTTP
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.bloco_internet]
  }
  tags = {
    "Name" = "${var.username}-acesso_web"
  }

}