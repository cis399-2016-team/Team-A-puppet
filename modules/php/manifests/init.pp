class php {
	package {
		"php5": ensure => installed;
	}

	service { "php5":
		enable => true,
		ensure => running,
	}
}
