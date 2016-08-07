class php {
	package { "php5":
		require => Exec['apt-update'],
		ensure => installed,
	}
}
