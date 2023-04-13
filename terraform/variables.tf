# variáveis para serem utilizadas nas configurações da AWS

variable "username" {     # username do usuário na AWS
  default = "nidio"
}

variable "regiao" {       # região onde fica hospedado o que vai ser utilizado
  default = "ca-central-1"
}

variable "ami" {          # código da instância
  default = "ami-0abc4c35ba4c005ca"
}

variable "tipoinstancia" {  # tipo da instância
  default = "t2.micro"
}

variable "subrede_pub" {    # código da subrede
  default = "subnet-09320b92f427c327f"
}

variable "bloco_vpc" {      # IPs utilizados na VPC
  default = "10.0.0.0/16"
}

variable "bloco_internet" { # IPs para conexão na Internet
  default = "0.0.0.0/0"
}

variable "vpc_id" {         # código da VPC
  default = "vpc-08f5bcd720d50c4f3"
}