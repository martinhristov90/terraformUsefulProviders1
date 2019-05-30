variable "animal" {}

data "template_file" "setup" {

  template = "${file("setup.sh")}"
  vars = {
    animal = "${var.animal}"
  }
}
output "template" {
    value = "${data.template_file.setup.rendered}"
}