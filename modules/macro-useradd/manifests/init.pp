define macro-useradd ($name, $uid, $groups, $sshkeytype, $sshkey) {

	$username = $title

	user { "$username":
		comment => "$name",
		home => "/home/$username",
		shell => "/bin/bash",
		uid => $uid,
		gid => $uid,
		managehome => "true",
		groups => $groups,
	}

	group { "$username":
		gid => $uid,
	}

	ssh_authorized_key { "keypair-for-$username":
		user => "$username",
		ensure => present,
		type => "$sshkeytype",
		key => "$sshkey",
		name => "$username",
	}
}
