# Configuration Management :page_with_curl: :spanner: :knob:
**Configuration management** refers to the practice of automating and standardizing the setup, deployment, and maintenance of IT infrastructure. It involves tools and processes to manage the state of the infrastructure, ensuring consistency and preventing configuration drift.

**Puppet** is a popular configuration management tool that enables you to manage your infrastructure as code. Puppet uses a declarative language, which allows you to describe the desired state of your infrastructure, rather than the steps required to get there.

One of the most commonly used **Puppet resource types** is the `file type`. The file type is used to create, modify, and manage files and directories on your system. Can be used to set permissions, ownership, and content of files using Puppet's file type.
To create a file with Puppet, we can use the file resource type. For example, to create a file called "example.txt" in the "/tmp" directory with the content "Hello, World!":
```
file { '/tmp/example.txt':
  content => 'Hello, World!',
}
```
To install a package, we can use the package resource type. For example, to install the "nginx" package:
```
package { 'nginx':
  ensure => installed,
}
```
To execute a command, we can use the exec resource type. For example, to run the command "echo 'Hello, World!'":
```
exec { 'echo Hello, World!':
  command => 'echo "Hello, World!"',
}
```
The process of creating files, installing packages, and executing commands on multiple systems, making it easier to manage and maintain large infrastructure can be automated by writing Puppet manifest files.

**Puppet's declarative language** allows you to model your infrastructure in a high-level, human-readable format. Rather than writing scripts to manage each individual resource, you can use Puppet's language to define the desired state of your infrastructure. Puppet will then handle the details of making your infrastructure match that desired state.

**Puppet lint** is a tool that checks your Puppet code for syntax errors, style violations, and best practices. It can help you catch errors and ensure that your code is consistent and easy to read. Puppet lint can be run on the command line or integrated with your code editor.

**Puppet emacs mode** is an Emacs plugin that provides syntax highlighting and code navigation for Puppet manifests. It can help you write and edit Puppet code more efficiently, by providing shortcuts for common tasks like inserting new resources or moving between resources.


## Task Description:
1. [0-create_a_file.pp](./0-create_a_file.pp)
  - Puppet manifest file that creates a file `holberton` in the `/tmp` directory.
    * File permissions: `0744`.
    * File group: `www-data`.
    * File owner: `www-data`.
    * File content: `I love Puppet`.

2. [1-install_a_package.pp](./1-install_a_package.pp)
  - Puppet manifest file that installs flask from pip3.
    * Must be version 2.1.0.

3. [2-execute_a_command.pp](./2-execute_a_command.pp)
  - Puppet manifest file that kills the process `killmenow`.
    * Must use the exec Puppet resource.
    * Must use pkill.
