resource sakuracloud_note "install_docker_script" {
    name = "${var.name}"
    content = "${file("${path.module}/install_docker.sh")}"
}
