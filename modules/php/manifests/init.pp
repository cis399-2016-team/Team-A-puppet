class php {
	package { "php5":
		ensure => installed,
	}
	
	package { "libsodium-dev":
		ensure => installed,
	}

        file { "/var/www/html/login.html":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/apache/login.html",
                require => File["/var/www/html"],
        }

        file { "/var/www/html/verify.php":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/apache/verify.php",
                require => File["/var/www/html"],
        }

	file { "/var/www/html/connectionData.php":
                mode => 644,
                owner => root,
                group => root,
                source => "puppet:///modules/apache/connectionData.php",
                require => File["/var/www/html"],
        }

}
