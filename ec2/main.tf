resource "aws_instance" "ec2" {
  ami           = var.ami
  subnet_id     = var.subnet_id
  instance_type = var.instance_type
  tags = {
    Name = var.ec2_tag
  }
}
