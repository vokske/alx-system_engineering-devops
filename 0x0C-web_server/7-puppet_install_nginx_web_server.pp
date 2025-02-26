# Configure Nginx Web server with Puppet

# Install Nginx
package {'nginx':
	ensure => installed,
}

# Create a custom index page
file {'/var/www/html/index.html':
	ensure => file,
	content => "Hello World!\n",
	owner => 'root',
	group => 'root',
	mode => '0644',
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

	location /redirect_me {
		return 301 https://www.google.com/;
	}
}
",
	owner => 'root',
	group => 'root',
	mode => '0644',
	require => Package['nginx'],
	notify => Service['nginx'],
}

# Ensure Nginx is running
service {'nginx':
	ensure => running,
	enable => true,
	require => Package['nginx'],
}
