class webcontent {
	file { "/var/www/html":
		ensure  => directory,
		owner   => root,
		group   => root,
		recurse => true,
		purge   => true,
		source  => "https://github.com/cis399-2016-team/Team-A/webcontent",
	}
} 
