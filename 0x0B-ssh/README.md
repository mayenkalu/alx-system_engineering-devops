# SSH :page_with_curl: :key:
A **server** is a computer program or device that provides functionality to other programs or devices, called "clients". Servers can provide a wide range of services, including file storage and sharing, web hosting, email, messaging, and more.
Servers usually live in data centers or server rooms, where they are kept in a controlled environment with proper power and cooling to ensure maximum uptime.

**SSH** (Secure Shell) is a cryptographic network protocol used for secure remote access to a computer or server. It provides secure authentication and encrypted communications over an unsecured network.

**To create an SSH RSA key pair**:
```
ssh-keygen -t rsa
```
This will generate a public/private key pair, which can be used to authenticate your identity when connecting to a remote host.

**To connect to a remote host using an SSH RSA key pair**:
```
ssh -i /path/to/private/key user@host
```
This will initiate an SSH session to the remote host, using the private key for authentication.

The advantage of using `#!/usr/bin/env` bash instead of `/bin/bash` in a bash script is that it allows the script to be executed by any interpreter in the user's path, rather than being limited to a specific location. This can help ensure portability and avoid issues with different systems having different paths to the interpreter.

The `curl` command is a tool used in command-line interfaces to transfer data to or from a server, using one of the supported protocols such as HTTP, FTP, SMTP, etc. `curl` allows users to send HTTP requests and receive responses from the server, and it can be used for testing web applications, debugging network issues, and automating various tasks. The `curl` command can also handle cookies, authentication, SSL, and other protocols and features.

## Task Description:
1. [0-use_a_private_key](./0-use_a_private_key)
	- Bash script that uses `ssh` to connect to my server ussing `~/.ssh/school`

2. [1-create_ssh_key_pair](./1-create_ssh_key_pair)
	- Bash script that creates an RSA key pair.
	- Name of the created private key must be school.
	- Number of bits in the created key to be created 4096.
	- The created key must be protected by the passphrase betty.

3. [2-ssh_config](./2-ssh_config)
	- SSH configuration file configured to use the private key `~/.sshschool` and to refuse authentication using a password.
	- The ssh config file is located at '/etc/ssh/ssh_config'.
	- Here different options of config can be changed. 
		* # PasswordAuthentication no
		* # IdentityFile ~/.ssh/school

4. [100-puupet_ssh_config.pp](./100-puupet_ssh_config.pp)
	- Puppet manifest that configures changes to our configuration file
	- Your SSH client configuration must be configured to use the private key `~/.ssh/school`.
	- Your SSH client configuration must be configured to refuse to authenticate using a password.