resource "aws_instance" "terraform" {
  ami = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0bc3abb98ade19938"
  
 
}