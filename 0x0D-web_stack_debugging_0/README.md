# Web Stack Debugging :page_with_curl: :screw_driver:
**Debugging web stacks** is an essential skill for a Full-Stack Software Engineer. In this project, the focus was on debugging broken or bugged web stacks that were isolated in containers using Docker. The ultimate goal was to create a Bash script that could bring the web stack to a working state once executed. However, before writing the script, the task was to manually identify and fix the issues.

Debugging web stacks requires a good understanding of the different components involved, such as the web server, database, and application code. It also involves the ability to identify and troubleshoot issues that may arise, such as configuration errors, networking problems, or bugs in the code.

This project provided an opportunity to practice debugging skills by working with a variety of web stacks and identifying and fixing the issues that were preventing them from working correctly. With practice, a Full-Stack Software Engineer can become a master at debugging web stacks and be better equipped to solve complex issues that may arise in real-world scenarios.

**Docker** is a containerization technology that allows developers to package applications and their dependencies into self-contained units called containers. Containers provide an isolated environment for applications to run, ensuring that they can be run consistently across different computing environments.

**Apache**, on the other hand, is a widely-used open-source web server software that powers many websites and web applications. It is commonly used in conjunction with other software, such as PHP or Python, to create dynamic web pages and applications.

When used together, Docker containers can be used to package and distribute Apache along with its dependencies, such as PHP or Python, as a single, portable unit. This makes it easier for developers to deploy and run Apache-based web applications across different computing environments, without having to worry about compatibility issues or configuration errors. Additionally, Docker's containerization technology provides an extra layer of security and isolation, ensuring that Apache-based applications can run securely and reliably in any environment.

## Task files description:
In this debugging project, Apache is needed to run on the container and to return a page containing `Hello Holberton` when querying the root of it.
Example:
```
vagrant@vagrant:~$ docker run -p 8080:80 -d -it holbertonschool/265-0
47ca3994a4910bbc29d1d8925b1c70e1bdd799f5442040365a7cb9a0db218021
vagrant@vagrant:~$ docker ps
CONTAINER ID        IMAGE                   COMMAND             CREATED             STATUS              PORTS                  NAMES
47ca3994a491        holbertonschool/265-0   "/bin/bash"         3 seconds ago       Up 2 seconds        0.0.0.0:8080->80/tcp   vigilant_tesla
vagrant@vagrant:~$ curl 0:8080
curl: (52) Empty reply from server
vagrant@vagrant:~$
```
Here we can see that after starting my Docker container, I curl the port 8080 mapped to the Docker container port 80, it does not return a page but an error message. Note that you might also get the error message curl: (52) Empty reply from server.

```
vagrant@vagrant:~$ curl 0:8080
Hello Holberton
vagrant@vagrant:~$
```
After connecting to the container and fixing whatever needed to be fixed (here is your mission), you can see that curling port 80 return a page that contains Hello Holberton. Paste the command(s) you used to fix the issue in your answer file.

1. [0-give_me_a_page](./0-give_me_a_page)
    - A file containing the command used to fix the issue.