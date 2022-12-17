resource "aws_instance" "web" {
  ami           = "ami-0e472ba40eb589f49"
  instance_type = "t2.micro"

  tags = {
    Name = "First-Instance"
  }
}

// terraform provider
// terraform init
