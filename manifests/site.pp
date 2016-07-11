node ip-10-0-3-232 {
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user    => root,
		minute  => "*/5",
	}
}

node ip-10-0-3-70 {
		include sshd
}
