caution {
  # managed_credentials = "credentials.pgp"
  # machine_type = "c5.xlarge"
  # build_machine_type = "c5.xlarge"
}
enclave "default" {
  build {
    app_sources = [
      "git@codeberg.org:caution/demo-hello-world-enclave.git"
    ]
  }

  network {
    ingress {
      cidr_ipv4 = "0.0.0.0/0"
      port = 8083
      ip_protocol = "tcp"
    }
  }

  http {
    port = 8083
  }

  unit "default" {
    command = "/usr/local/bin/hello"
  }
}
