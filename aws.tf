# aws.tf
variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

provider "aws" {
  region     = "us-east-1"
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
}

resource "aws_key_pair" "test1_key" {
  key_name   = "test1_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDamaW6X3IWAIpg57VLWO/GAIdyn03SFOrsoS9p+AgI/5vGsXaYFhZGCcQqv1lMn23E1OJBFgRHlLVP569gDfshma908XFb8N+1VPzVo7e2mqE35gy/yLK+6LpWWgPxuJbdE0TxtnMvWwhXV02ei+pgDyys58tZcnV/nzhVXxWCMsODI2nAj5Hqwf7jFRaqLOVWd6q51whmCkwUjtFsm1Nfd/azS90aJXKPPdfTZq2+AsokN8TCoomybXNy7cmtKaIOARY3KE8ePX5mc2OZSkszsAzRAh+Dm3DWMfodvVyK+Ryb7DPe3BGZ6HdT41pmx4dGrf3ACHujHFqHL8gmx1E/ root@ubuntu"
}

resource "aws_instance" "web" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.test1_key.key_name}"

  tags {
    Name = "test instance"
  }
}
