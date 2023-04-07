# HTTPS SSL :note:
**HTTPS (HyperText Transfer Protocol Secure)** is a protocol used to secure communication over the internet. It provides secure encryption of data between a web server and a client (such as a web browser) to protect against eavesdropping, tampering, and other types of attacks.

**SSL (Secure Sockets Layer)** is the predecessor of the TLS (Transport Layer Security) protocol, which is used to encrypt and authenticate HTTPS connections. The two main roles of SSL/TLS are:
- **Encryption**: 
    SSL/TLS encrypts the data that is transmitted between the web server and the client, so that it cannot be intercepted and read by unauthorized third parties. Encryption ensures that sensitive information such as login credentials, credit card numbers, and other private data is protected.

- **Authentication**: 
    SSL/TLS provides authentication of the web server to the client, to ensure that the client is communicating with the intended server and not an impostor. This is done through the use of digital certificates, which are issued by trusted certificate authorities and contain information about the identity of the web server.

**SSL termination** refers to the process of decrypting HTTPS traffic at a load balancer or proxy server, and forwarding the decrypted traffic to the web server. This allows the web server to handle unencrypted traffic, which can improve performance and reduce the load on the server. SSL termination can also provide additional security benefits, such as the ability to inspect and filter traffic for potential threats.

Here's an example code snippet in Python that demonstrates how to establish an HTTPS connection using the `requests` library:
```
import requests

url = "https://www.example.com"
response = requests.get(url)

print(response.content)
```
This code sends an HTTPS GET request to the URL `https://www.example.com`using the `requests` library, and prints the content of the response. The `requests` library automatically handles SSL/TLS encryption and certificate validation, so that the connection is secure and authenticated.

To set up SSL on a web server, an SSL certificate needs to be obtained and the server needs to be configured to use it. One way to obtain an SSL certificate is to use `certbot`, a tool for automating SSL certificate installation and renewal. Here's how to use `certbot` to obtain and install an SSL certificate on a web server. To install `certbot` on the web server:
```
sudo apt-get update
sudo apt-get install certbot
```
Obtain an SSL certificate for your domain using `certbot`:
```
sudo certbot certonly --standalone -d example.com -d www.example.com
```
This command will run a standalone `certbot` server that will listen on port 80 and obtain an SSL certificate for the domains `example.com` and `www.example.com`. Once the certificate is obtained, it will be stored in `/etc/letsencrypt/live/example.com/`.

To terminate SSL on Haproxy, Haproxy needs to be configured, this is done adding the following lines to your Haproxy configuration file:
```
frontend https-in
    bind *:443 ssl crt /etc/letsencrypt/live/example.com/fullchain.pem
    default_backend webservers
```
This configuration specifies that incoming HTTPS traffic on port 443 should be terminated on the Haproxy server and forwarded to the `webservers` backend, which consists of the two web servers (`web01` and `web02`) configured in the previous example. The `ssl` option tells Haproxy to use SSL and the `crt` option specifies the path to the SSL certificate.

To set up a `www` subdomain and configure Haproxy to redirect traffic to it, follow these steps:
  - Create a DNS record for the www subdomain that points to the IP address of the Haproxy server.
  - Add a new frontend section to the Haproxy configuration file that listens on port 80 and handles traffic to the www subdomain.
  - In the new frontend section, add a redirect directive to redirect traffic to the HTTPS version of the subdomain, and a use_backend directive to forward traffic to the webservers backend.
Here's an example configuration for Haproxy to accept traffic to the www subdomain:
```
frontend http-in
    bind *:80
    redirect scheme https if !{ ssl_fc }
    use_backend www-backend if { hdr(host) -i www.example.com }

frontend https-in
    bind *:443 ssl crt /path/to/ssl/certificate.pem
    default_backend webservers

backend webservers
    balance roundrobin
    server web01 192.168.0.2:80 check
    server web02 192.168.0.3:80 check

backend www-backend
    balance roundrobin
    server web01 192.168.0.2:80 check
    server web02 192.168.0.3:80 check
```
Note that in the new http-in frontend section, we are using the hdr directive to match incoming traffic to the www.example.com hostname, and the use_backend directive to forward traffic to the www-backend backend. In the www-backend backend section, we are configuring the same set of web servers as the webservers backend to handle traffic to the www subdomain.

Looking at another code:
```
frontend www-in
    bind *:80
    mode http
    option forwardfor
    acl is_www hdr(host) -i www.example.com
    use_backend www-backend if is_www
```
This frontend section specifies that incoming HTTP requests on port 80 should be accepted for the `www` subdomain, and sets up an ACL (access control list) to match requests that contain the `Host` header with the `value www.example.com`.

Next, you can add a new backend section that specifies how requests matching the `www` ACL should be forwarded to the `web-01` and `web-02` servers:
```
backend www-backend
    balance roundrobin
    server web01 192.168.0.2:80 check
    server web02 192.168.0.3:80 check
```
This backend section uses the same `roundrobin` load balancing algorithm as before, and specifies the IP addresses and port numbers of the `web-01` and `web-02` servers.

Once the configuration file is updated, you can restart the HAProxy service to apply the changes. Requests to the `www` subdomain should now be redirected to the `web-01` and `web-02` servers in a round-robin fashion.

Note that this is just a basic example, and there are many other configuration options and load balancing algorithms available. The exact configuration will depend on the specific requirements of your web stack.

## Task Description:
* [0-world_wide_web](./0-world_wide_web)
    - Bash script that displays information about subdomains on my configured servers.
    - Usage: `./1-world_wide_web <domain> <subdomain>`
    - Output: `The subdomain [SUB_DOMAIN] is a [RECORD_TYPE] record and points to [DESTINATION]`
    - If no `subdomain` parameter is passed, displays information about the
    subdomains `www`, `lb-01`, `web-01` and `web-02`, in that order.

* [2-haproxy_ssl_termination](./2-haproxy_ssl_termination)
    - HAproxy configuration file that accepts encrypted SSL traffic for the subdomain using `certbot`, `www.` on TCP port 443.

* [3-redirect_http_to_https](./3-redirect_http_to_https)
    - HAproxy configuration file that redirects HTTP traffic to HTTPS.
