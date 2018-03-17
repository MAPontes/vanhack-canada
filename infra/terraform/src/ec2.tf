resource "aws_instance" "web" {

  ami = "ami-66506c1c"
  instance_type = "t2.micro"

  tags = {
    Name = "TesteTerra"
  }

}
