class ssh {
#	@@sshkey { "${fqdn}_dsa": type => dsa, key => $sshdsakey }
	@@sshkey { "${fqdn}": type => rsa, key => $sshrsakey }
	Sshkey <<| |>>
}
