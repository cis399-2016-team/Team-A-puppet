node ip-10-0-3-232 {
		include sshd
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user    => root,
		minute  => "*/5",
	}
}

node ip-10-0-3-70 {
		include sshd
		include apache
}

node ip-10-0-3-42 {
		include sshd
		include apache
		include user-stevev
		include user-chenders
}
