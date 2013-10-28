@test "openssh is installed" {
  which sshd
}

@test "password authentication disabled" {
  cat /etc/ssh/sshd_config | grep "password_authentication no"
}

@test "root login disabled" {
  cat /etc/ssh/sshd_config | grep "permit_root_login no"
}
