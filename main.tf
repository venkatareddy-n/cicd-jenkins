# jenkins master ec2 server creation for jenkins practice
module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "DevOps"
  instance_type          = "t3.micro" #2CPU, 4GB RAM to get smooth jenkins
  vpc_security_group_ids = ["sg-0ed6caf2f2672304d"] #Security Group ID
  subnet_id = "subnet-068ee5424c98a6572" #Subnet ID
  ami = data.aws_ami.ami_info.id
  user_data = file("jenkins.sh")
  tags = {
    Name = "Docker-Server"
  }

  # Define the root volume size and type
  root_block_device = [
    {
      volume_size = 40      # Size of the root volume in GB
      volume_type = "gp3"    # General Purpose SSD (you can change it if needed)
      delete_on_termination = true  # Automatically delete the volume when the instance is terminated
    }
  ]
}

# jenkins Agent ec2 server creation for jenkins practice

# module "jenkins_agent" {
#   source  = "terraform-aws-modules/ec2-instance/aws"

#   name = "Jenkins-Agent"

#   instance_type          = "t3.small"
#   vpc_security_group_ids = ["sg-0ce851e2131cc0a28"] #Security Group ID
#   subnet_id = "subnet-095d830ec8a28bee9" #Subnet ID
#   ami = data.aws_ami.ami_info.id
#   user_data = file("jenkins-agent.sh")
#   tags = {
#     Name = "jenkins-agent"
#   }

#   root_block_device = [
#     {
#       volume_size = 50       # Size of the root volume in GB
#       volume_type = "gp3"    # General Purpose SSD (you can change it if needed)
#       delete_on_termination = true  # Automatically delete the volume when the instance is terminated
#     }
#   ]
# }

# module "records" {
#   source  = "terraform-aws-modules/route53/aws//modules/records"
#   version = "~> 2.0"

#   zone_name = var.zone_name

#   records = [
#     {
#       name    = "jenkins"
#       type    = "A"
#       ttl     = 1
#       records = [
#         module.jenkins.public_ip
#       ]
#       allow_overwrite = true
#     },
#     {
#       name    = "jenkins-agent"
#       type    = "A"
#       ttl     = 1
#       records = [
#         module.jenkins_agent.private_ip
#       ]
#       allow_overwrite = true
#     }
#   ]

# }