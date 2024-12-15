# Install the 'flask' package from pip3
# Ensure Python3 and pip3 packages are installed first

package { 'python3':
    ensure => 'installed',
}

package { 'python3-pip':
    ensure => 'installed',
}

package { 'install_flask':
    ensure   => '2.1.0',
    name     => 'flask',
    provider => 'pip3',
}

# Ensure dependencies are installed before the Flask package
Package['python3'] -> Package['python3-pip'] -> Package['install_flask']