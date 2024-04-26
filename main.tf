resource "aws_instance" "jenkins_ec2_instance" {
    ami           = "ami-04e5276ebb8451442" 
    instance_type = "t2.micro"
    tags = {
    Name = "MyJenkinsInstance"
  }
  
}