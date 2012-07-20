class profile::install {
	Package {
		ensure => present,
	}

	package {
		"augeas":
		name   => ["augeas", "augeas-devel", "augeas-libs"];

		"vim":
		name   => ["vim-enhanced", "vim-common"];

		"zsh":
	}
}
