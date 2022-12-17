
#create a instance
resource "aws_instance" "web" {
  ami                    = "${var.image_id}"
  instance_type          = "${var.instance_type}"
  key_name               = aws_key_pair.ssh-key-pair-for-instance.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  tags = {
    Name = "First-Instance"
  }
}

// terraform provider
// terraform init
// terraform plan
// teraform apply --auto-approve
