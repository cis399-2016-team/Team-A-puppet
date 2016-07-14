class apache {
	package {
		"apache2": ensure => installed;
	}

	file { "/etc/apache2/apache2.conf":
		mode => 700,
		owner => "root",
		group => "root",
		source => "puppet:///modules/apache/apache2.conf",
		require => Package["apache2"],
	}

	service { "apache2":
		enable => true,
		ensure => running,
		require => [Package["apache2"], 
			File["/etc/apache2/apache2.conf"],],
	}
}
