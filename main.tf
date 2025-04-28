resource "aws_instance" "MyEc2Instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "TerraformKey"
  subnet_id              = "subnet-01224d04bf2330624"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-088afdcc86f830d92"]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              EOF

  tags = {
    Name = "MyEc2Instance"
  }

provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      #private_key = file("path/to/your/private-key.pem")
      host        = self.public_ip
      timeout     = "5m"  # Increase timeout to 5 minutes
    }

    inline = [
      "echo Hello, World!"
    ]
  }
}
