# Web Server :page_with_curl: :globe:
A **web server** is a software that manages the requests sent by clients and sends responses back. It processes the HTTP requests and serves static or dynamic content such as HTML pages, images, videos, or any other resources that are hosted on it.

The **web works** through a client-server model. A client, such as a web browser, sends a request to a web server for a particular resource. The web server processes the request and sends the appropriate response back to the client.

**Nginx** is a popular open-source web server that can also act as a reverse proxy, load balancer, and HTTP cache. It is designed to handle high traffic websites efficiently.

Nginx configuration files are located in the /etc/nginx directory. The main configuration file is nginx.conf. **To configure Nginx**, the configuration file is edited and then the configuration is reloaded by running the command: `sudo nginx -s reload`.

**A child process** is a process that is created by another process, known as the parent process. Web servers usually have a parent process and multiple child processes. The child processes handle the requests and the parent process manages them.

**A root domain** is the top-level domain name of a website, such as example.com. **A subdomain** is a domain that is part of a larger domain, such as blog.example.com.

The main **HTTP requests** are GET, POST, PUT, DELETE, HEAD, CONNECT, OPTIONS, and TRACE. These requests are used to retrieve or modify data on a web server.

**HTTP redirection** is the process of redirecting a client's request to a different URL. This can be useful for moving a web page to a new location, or for redirecting clients from an old URL to a new one.

The **Not Found HTTP response code** (404) is returned by a web server when a requested resource is not found on the server.

**Log files on Linux** are usually located in the /var/log directory. These files contain information about system events, errors, and other important messages.

**RFC 7231** (HTTP/1.1) defines the HTTP/1.1 protocol, including the syntax and semantics of HTTP requests and responses.

**RFC 7540** (HTTP/2): defines the HTTP/2 protocol, which is a newer version of the HTTP protocol that offers improved performance and security.

**SCP** (Secure Copy) is a command-line tool used for securely copying files between remote hosts.

**Curl** is a command-line tool used for transferring data between servers. It supports a variety of protocols, including HTTP, FTP, and SMTP.

**DNS** (Domain Name System) is a system used to translate human-readable domain names into IP addresses that can be understood by computers.

The **main role of DNS** is to provide a hierarchical naming system for the internet. It allows users to access websites and other resources using human-readable domain names.

There are several **DNS record types**, such as `A`, `CNAME`, `TXT`, and `MX`. 
  * `A` record maps a domain name to an IP address.
  * `CNAME` record maps a domain name to another domain name.
  * `TXT` record contains arbitrary text data.
  * `MX` record specifies the mail server for a domain.

**TTL**, or Time-to-Live, is a value in seconds that indicates how long a DNS resolver or caching server should cache a DNS query. This helps reduce the load on authoritative DNS servers and improve the performance of the DNS system by allowing DNS resolvers to serve subsequent requests from their local cache.

## Task Description
1. [0-transfer_file](./0-transfer_file)
  * Bash script that transfers a file from client to a server.
  * Accepts four arguments:
    * The path of the file to be transferred.
    * The IP of the server to transfer the file to.
    * The username that `scp` connects with.
    * The path of the SSH privtae key that `scp` uses.
  * Display Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY if less than 3 parameters passed
  * `scp` transfers the file to the user home directory `~/`.

2. [1-install_nginx_web_server](./1-install_nginx_web_server)
  * Bash script that configures a new Ubuntu machine with Nginx.
  * Nginx listens on port 80.
  * When querying Nginx at its root `/` with a `curl` GET request, it returns a page containing the string `Hello World`.

3. [2-setup_a_domain_name](./2-setup_a_domain_name)
  * A text file containing the domain name set up for the server at .TECH DOMAIN.

4. [3-redirection](./3-redirection)
  * Bash script that configures a new Ubuntu machine with Nginx.
  * Setup is identical to [1-install_nginx_web_server](./1-install_nginx_web_server)
  plus:
    * The location `/redirect_me` returns a `301 Moved Permanently` redirection to another page.

5. [4-not_found_page_404](./4-not_found_page_404)
  * Bash script that configures a new Ubuntu machine with Nginx.
  * Setup is identical to [1-install_nginx_web_server](./1-install_nginx_web_server)
  plus:
    * Features a custom 404 page containing the string `Ceci n'est pas une page`.

6. [7-puppet_install_nginx_web_server.pp](./7-puppet_install_nginx_web_server.pp)
  * Puppet manifest that configures a new Ubuntu machine with Nginx.
  * Nginx listens on port 80.
  * When querying Nginx at its root `/` with a `curl` GET request,
  it returns a page containing the string `Hello World`.
  * The redirection must be a “301 Moved Permanently”.