class groups { 
	group { "admin":
		ensure => present,
		gid => 500,
	}
}
