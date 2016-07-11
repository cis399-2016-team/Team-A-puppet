class sshd {
	package {
		"openssh-server": ensure => installed;
	}

	file {"/etc/ssh/sshd_config":	
		mode => 600,
		owner => "root",
		group => "root",
		source => "/etc/puppet/files/sshd_config",
		require => Package["openssh-server"],
	}

	service {"ssh":
		enable => true,
		ensure => running,
		require => [Package["openssh-server"], 
			File["/etc/ssh/sshd_config"],],
	}
	
	ssh_authorized_key {"zhibin-key-pair":
		user => "ubuntu",
		key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCxOAgiL2z7qRQ1cIHfmy8t/9nqEevGtAwiyHlFh0psj0Wfa0qAdkJVPafy8Nkhs+QXbkfPEl0tPR0I7fiFW4KP/ZWvOBDU2Bm1IHyn8NnO/mK2IY1B2qARjyfC0QiwE4pOlEJ/nUxTa3kpqrkI/lcMwGbxvptLYqgF10LecemY9vzd6MWhYTtfCgFPYThLHwihER/oFk3rnpIAO/roUYdc44ipnZt6bGtgJ4i1lcmLaQYMUT8E3PFjF3rGEprocyMMrl7pE7iqnIe/LSery9QKcJRARWmQ2JoITiwtHJ1loeT/IQPUayzbaM1oAmkUClx4TN96RBO1ZfPLz5TmyMDl",
	}

	ssh_authorized_key {"micah-key-pair":
		user => "ubuntu",
		key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCD3UJqrNj0QDly6MHV2tYfK+m12mq/jmCPfUAcaq1rh3vWl2hRUtC+Zk+AQQt7TMmByXO+fM8V6KfEYpSBygSf1yd2T/tvYtLmJ/70DbaiWoIbA5G2eOQlQE1W3YSvgwZ+FZC67jgC8iaU3Oon7n4PDHxWhElukFWFXfYy5nq4aNAgF6tlX/ETkXMjqRIEFbr2vD+HjTH3x0Svh2Sp5J2v1Vyn6dokIsk29zveN9tF3ZaSgwVUVGcwW167uAOKwDebQnfoXjHgYSRnUPEvptJoaHeeMSSvpwxrhOA8MeFSLG88nHffox7URq5oRoGxNsxux2lZUvpG9eD0/3i1aJ7f",
	}
}
