# Load Balancer :page_with_curl: 
**A load balancer** is a networking device that distributes incoming network traffic across multiple servers. The main purpose of a load balancer is to improve the performance, reliability, and scalability of web applications by evenly distributing the load among backend servers. There are different types of load balancers, such as hardware-based load balancers, software-based load balancers, and cloud-based load balancers.

Here's a simple example of how to implement a load balancer using Python and the Flask web framework:
```
from flask import Flask
from flask import request
import random

app = Flask(__name__)

# List of backend servers
servers = ['http://localhost:5000', 'http://localhost:5001', 'http://localhost:5002']

@app.route('/')
def index():
    # Pick a random backend server
    server = random.choice(servers)
    # Forward the request to the backend server
    return requests.get(server).text

if __name__ == '__main__':
    app.run(port=80)
```
In this example, the load balancer listens on port 80 and routes incoming requests to a randomly selected backend server.

**Web stack debugging** is the process of identifying and fixing errors or issues that occur in a web application's stack, which includes the web server, application server, database server, and other components. Debugging web applications can be challenging, as issues can arise from various sources, such as incorrect configurations, misconfigured software, or faulty code.

Here are some tips for debugging web stack issues:
  1. **Check the error logs**: Most web servers and application servers maintain error logs that can help identify the cause of a problem. Check the logs for any error messages or stack traces.
    
  2. **Use debugging tools**: There are several tools available for debugging web applications, such as debuggers, profilers, and monitoring tools. These tools can help identify performance bottlenecks, memory leaks, and other issues.

  3. **Test the components individually**: Sometimes, the issue may be caused by a specific component in the web stack. Testing each component individually can help identify the source of the problem.

  4. **Review the code**: If all else fails, review the code for any syntax errors, logical errors, or security vulnerabilities. Code reviews can help catch issues early and improve the overall quality of the code.

Load balancers can be configured in a web stack, following these steps:
**Setting up a second web server cluster**: To set up a second web server cluster, you can create a new server instance (e.g. `web-02`) that is identical to the first server instance (`web-01`). This can be done by cloning the first server and configuring it with the same software and settings as the first server.

**Setting up a load balancer**: To set up a load balancer, you can create a new server instance (e.g. `lb-01`) and install a load balancing software such as Haproxy. Once the software is installed, you can configure it to distribute traffic between the two web servers (`web-01` and `web-02`) using a round-robin algorithm.

Here's an example configuration file for Haproxy:
```
global
    daemon
    maxconn 256

defaults
    mode http
    timeout connect 5000ms
    timeout client 50000ms
    timeout server 50000ms

frontend http-in
    bind *:80
    default_backend webservers

backend webservers
    balance roundrobin
    server web01 192.168.0.2:80 check
    server web02 192.168.0.3:80 check
```
This configuration file specifies that incoming HTTP traffic on port 80 should be distributed to the `webservers` backend, which consists of the two web servers (`web01` and `web02`) configured with their IP addresses and port numbers. The `balance roundrobin` option tells Haproxy to distribute traffic using a round-robin algorithm.

Once the configuration file is saved, you can start the Haproxy service and verify that it is working by accessing the load balancer's IP address in a web browser. You should see that the requests are being distributed between the two web servers.

Note that this is just a basic example, and there are many other configuration options and load balancing algorithms available. The exact configuration will depend on the specific requirements of your web stack.

## Task Description
* [0-custom_http_response_header](./0-custom_http_response-header): Bash
  script that installs and configures Nginx on a server with a custom HTTP
  response header.
    * The name of the HTTP header is `X-Served-By`.
    * The value of the HTTP header is the hostname of the server.
    * Other server configurations identical to previous server configurations in project 0x0C-web_server.

* [1-install_load_balancer](./1-install_load_balancer): Bash script that
  installs and configures HAproxy version 1.5 on a server.
    * Enables management via the init script.
    * Requests are distributed using a round-robin algorithm.

* [100-puppet_custom_http_response_header.pp](./100-puppet_custom_http_response_header.pp): Just like the first task, Puppet manifest
   that configures a brand new server :
    * The name of the HTTP header is `X-Served-By`.
    * The value of the HTTP header is the hostname of the server.