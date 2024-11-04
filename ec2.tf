resource "aws_instance" "db" {
    ami = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = ["sg-0ce45017043631db4"]
    instance_type = "t3.micro"

    # provisioners will run when you are creating resources
    # They will not run once the resources are created
    provisioner "local-exec" {
        command = "echo ${self.private_ip} > private_ips.txt" #self is aws_instance.web
    }

}