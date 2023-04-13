terraform {                       #O bloco required_providers deve estar aninhado dentro do bloco terraform
  required_providers {            #Qual versão do provedor usar nessa configuração e de onde procurá-la
    aws = {                       #Especifica o nome da fonte, seu identificador exclusivo dentro deste módulo
      source  = "hashicorp/aws"   #O endereço de origem global do provedor que você deseja usar
      version = "~> 4.0"          #Uma restrição de versão especificando com qual subconjunto de versões de provedor disponíveis o módulo é compatível.
    }
  }
}

provider "aws" {            #Um provider block  é usado para especificar uma configuração de provedor
  region = var.regiao       #A região onde as operações da AWS ocorrerão
}