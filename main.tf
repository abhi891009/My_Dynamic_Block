resource "null_resource" "Null_Resource" {
  count = length(var.commands)

  provisioner "local-exec" {
    command = var.commands[count.index]
  }
}
