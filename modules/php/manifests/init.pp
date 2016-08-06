class php {
	package {
		"php": ensure => installed;
	}

	service { "php":
		enable => true,
		ensure => running,
	}
}
