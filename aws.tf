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
  public_key = "<publickey>"
}

resource "aws_instance" "web" {
  ami           = "ami-0080e4c5bc078760e"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.test1_key.key_name}"

  tags {
    Name = "test instance"
  }
}
