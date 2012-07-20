class kvm::install {
        package { "kvm":
                ensure => present,
        }
}
