resource "aws_instance" "linux" {
  ami           = "ami-0a0f1259dd1c90938"
  instance_type = "t2.micro"
  key_name      = "new_key_pair"

  tags = {
    Name = "HelloWorld-${count.index}"
  }
  count = 1
}
