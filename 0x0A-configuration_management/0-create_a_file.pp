# Creates a file in '/tmp'
file { 'create_file':
    ensure  => file,
    path    => '/tmp/school',
    mode    => '0744',
    owner   => 'www-data',
    group   => 'www-data',
    content => 'I love Puppet',
    }