# Puppet manifest to set up the client SSH config file to enable conncetion
# to a remote server without using password authentication.

file_line { 'identity_file':
  path => 'etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/id_rsa_vagr_pub',
}

file_line { 'password_auth':
  path => 'etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
}

file_line { 'add_host':
  path => 'etc/ssh/ssh_config',
  line => 'Host 192.168.43.145',
}
