resource "aws_instance" "ec2" {
  ami           = var.ami
  subnet_id     = var.subnet_id
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type = var.instance_type
  user_data = var.user_data
  tags = {
    Name = var.instance_tag
  }
}
