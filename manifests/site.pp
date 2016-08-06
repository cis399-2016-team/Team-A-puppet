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
		include php
}

node ip-10-0-3-42 {
		include sshd
		include apache
		include php

		include user-stevev
		include user-chenders
		include user-sethplunkett
		include user-bheng
		include user-jbrodnax
		include user-elicaluya
		include user-costello
		include user-eewing
		include user-panda
		include user-lovett2
		include user-jstuemke
		include user-acgarvin
		include user-pishpash
		include user-clwaring
}
