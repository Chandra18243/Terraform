resource "aws_instance" "one" {
  ami               = var.ami_id
  instance_type     = var.itype
  key_name          = var.kname
  availability_zone = var.azone

  tags = {
    Name        = var.iname
    Environment = var.ename
  }
}

#testing commit
