provider "aws" {
  region     = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

/*
Instance Create
  Genreate SSH key 
    ssh-keygen -t rsa 
      id_rsa
      id_rsa.pub
SSH Key cretion
sAssign Key to Instance

Create a Security Group
Assign Security Group to Instance

Install ngnix 
create index file

*/