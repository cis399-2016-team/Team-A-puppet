class php {
	package { "php5":
		ensure => installed;
	}
	
        file { "/var/www/html/login.php":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/php/login.php",
                require => File["/var/www/html"],
        }

        file { "/var/www/html/verify.php":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/php/verify.php",
                require => File["/var/www/html"],
        }

        file { "/var/www/html/createUser.php":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/php/createUser.php",
                require => File["/var/www/html"],
        }

	file {"/var/www/html/phpass-0.3":
		ensure => 'directory',
		mode => 644,
		recurse => true,
		owner => root,
		group => root,
		require => File["/var/www/html"],
	}

	 file { "/var/www/html/phpass-0.3/PasswordHash.php":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/php/phpass-0.3/PasswordHash.php",
                require => File["/var/www/html/phpass-0.3"],
        }

	 file { "/var/www/html/phpass-0.3/test.php":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/php/phpass-0.3/test.php",
                require => File["/var/www/html/phpass-0.3"],
	}

	file {"/var/www/html/phpass-0.3/c":
		ensure => 'directory',
		mode => 644,
		recurse => true,
		owner => root,
		group => root,
		require => File["/var/www/html/phpass-0.3"],
	}

	 file { "/var/www/html/phpass-0.3/c/crypt_private.c":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/php/phpass-0.3/c/crypt_private.c",
                require => File["/var/www/html/phpass-0.3/c"],
        }

	 file { "/var/www/html/phpass-0.3/c/Makefile":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/php/phpass-0.3/c/Makefile",
                require => File["/var/www/html/phpass-0.3/c"],
	}
}
