class apache-agent2 {
	package {
		"apache2": ensure => installed;
	}

	file { "/etc/apache2/apache2.conf":
		mode => 644,
		owner => root,
		group => root,
		source => "puppet:///modules/apache-agent2/apache2.conf",
		require => Package["apache2"],
	}

	file { "/var/www/html":
		ensure => directory,
		recurse => true,
		owner => root,
		group => root,
	}

	file { "/var/www/html/foo.html":
		mode => 644,
		owner => root,
		group => root,
		source => "puppet:///modules/apache-agent2/foo.html",
		require => File["/var/www/html"],
	}

	file { "/etc/apache2/sites-available/default-ssl.conf":
		mode => 644,
		owner => root,
		group => root,
		source => "puppet:///modules/apache-agent2/default-ssl.conf",
		require => Package["apache2"],
	}

	file { "/var/www/html/BirdSim.jar": 
		mode => 644,
		owner => root,
		group => root,
		source => "puppet:///modules/apache-agent2/BirdSim.jar",
		require => File["/var/www/html"],
	}

	file { "/var/www/html/BirdSim.php":
		mode => 644,
		owner => root,
		group => root,
		source => "puppet:///modules/apache-agent2/BirdSim.php",
		require => File["/var/www/html"],
	}

	file { "/var/www/html/resources.tar":
		mode => 644,
		owner => root,
		group => root,
		source => "puppet:///modules/apache-agent2/resources.tar",
		require => File["/var/www/html"],
		before => Exec["untar"],
	}

	exec { "untar": 
		path => "/usr/bin",		
		command => "sudo tar -xvf /var/www/html/resources.tar",
	}

	service { "apache2":
		enable => true,
		ensure => running,
		require => [Package["apache2"], 
			File["/etc/apache2/apache2.conf"],],
		subscribe => [File["/etc/apache2/apache2.conf"],
			File["/etc/apache2/sites-available/default-ssl.conf"],],
	}
}
