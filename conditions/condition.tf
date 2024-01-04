resource "aws_instance" "web" {
  ami           = var.ami-id
  instance_type = var.instance_name == "MongoDB" ? "t3.small"  :  "t2.micro"
  #vpc_security_group_ids = [aws_security_group.roboshop.id]

  tags = {
    Name = "terraform"
  }
}        