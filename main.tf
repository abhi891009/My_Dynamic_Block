resource "aws_instance" "MyEc2Instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      =  "TerraformKey"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              EOF

  tags = {
    Name = "MyEc2Instance"
  }

  provisioner "remote-exec" {
    inline = var.commands

    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
    }
  }
}
