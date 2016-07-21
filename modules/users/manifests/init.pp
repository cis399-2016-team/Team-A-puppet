class users {
	user { "test":
		ensure => present,
		comment => "test",
		uid => 500,
		gid => 500,
		home => "/home/test",
		shell => "/bin/bash",

	}
}

