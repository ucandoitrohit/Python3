// resource "aws_key_pair" "key-name" {
//  key_name   = "ssh-key-pair-for-instance"
// public_key = "ssh-rsa CCCCAAB3NzaC1yc2EAAAADAgdfgdfHHYTsdfTYHKHJKHjkhQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
//}

#create a ssh key on aws
resource "aws_key_pair" "ssh-key-pair-for-instance" {
  key_name   = "ssh-key-pair-for-instance"
  public_key = file("${path.module}/id_rsa.pub")
}
