resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.roboshop.id]

  tags = {
    Name = "terraform"
  }
}    

resource "aws_security_group" "roboshop" {
  name        = var.sg-name
  description = var.sg-descreption
 # vpc_id      = aws_vpc.main.id

  ingress {
    description      = "allow all ports"
    from_port        = var.inbound-from-port
    to_port          = var.outbound-from-port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_blocks
   # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = "0"
    to_port          = "0"
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "roboshop-sg"
  }
} 



  
