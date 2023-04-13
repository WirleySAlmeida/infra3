resource "aws_eip" "k8s1" {   # cria um recurso AWS Elastic IP com o nome "k8s1".
  instance = aws_instance.kubernetes[0].id    # Associa esse EIP à primeira instância criada na etapa anterior, especificando sua ID na "aws_instance" com o nome "kubernetes" e o índice 0
  vpc      = true             # Especifica que esse EIP será alocado em uma VPC.
}

resource "aws_eip" "k8s2" {
  instance = aws_instance.kubernetes[1].id
  vpc      = true
}
resource "aws_eip" "k8s3" {
  instance = aws_instance.kubernetes[2].id
  vpc      = true
}

resource "aws_eip" "ansible" {      # Cria um quarto recurso AWS EIP com o nome "ansible".
  instance = aws_instance.ansibleserver.id    # Associa esse EIP à instância criada na etapa anterior com o nome "ansibleserver", especificando sua ID através do atributo "id" na "aws_instance".
  vpc      = true
}



# Cria um segundo recurso AWS EIP com o nome "k8s2".
# Associa esse EIP à primeira instância criada na etapa anterior, especificando sua ID na "aws_instance" com o nome "kubernetes" e o índice 1
# Especifica que esse EIP será alocado em uma VPC.
# cria um terceiro recurso AWS EIP com o nome "k8s3".
# Associa esse EIP à primeira instância criada na etapa anterior, especificando sua ID na "aws_instance" com o nome "kubernetes" e o índice 2
# Especifica que esse EIP será alocado em uma VPC.


# Especifica que esse EIP será alocado em uma VPC.