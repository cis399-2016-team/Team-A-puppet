class php {
	package { "php5":
		ensure => installed,
	}
	
	package { "libsodium-dev"
		ensure => installed,
	}
}
