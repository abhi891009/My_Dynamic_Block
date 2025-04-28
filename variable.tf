variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-084568db4383264d4"
}

variable "commands" {
  type = list(string)
  default = [
    "sudo apt-get update",
    "sudo apt-get install -y nginx"
  ]
}
