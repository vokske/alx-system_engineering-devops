# Install Nginx Web server with Puppet

# Install Nginx
package {'nginx':
	ensure => installed,
}

# Create a custom index page
file {'/var/www/html/index.html':
	ensure => file,
	content => "Hello World!\n",
	require => Package['nginx'],
}

# Ensure nginx listens on port 80 and configure 301 redirect
file {'/etc/nginx/sites-available/default':
	ensure => file,
	content => "
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;
	index index.html;

	server_name _;

	location / {
		try_files \$uri \$uri/ =404;
	}

	location /redict_me {
		return 301 https://www.haproxy.com/documentation/haproxy-configuration-tutorials/core-concepts/acls/;
	}
}
",
	require => Package['nginx'],
	notify => Service['nginx'],
}

# Ensure Nginx is running
service {'nginx':
	ensure => running,
	enable => true,
	require => Package['nginx'],
}
