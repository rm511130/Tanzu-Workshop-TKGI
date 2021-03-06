# README2 Version

#### [https://tinyurl.com/tkgi4caresource](https://tinyurl.com/tkgi4caresource)

![](./images//vmware-logo.png)

# VMware Tanzu Workshop 
----------------------------------------------------------
## [Tanzu Workshop Agenda](https://drive.google.com/open?id=1pzVmFNv7hlpOGGuU-C5YopBR9VIRz6FU)
(12:30PM to 4:00PM on 05/14/2020)

- Introduction
     - Workshop Orientation
     - VMware Tanzu Portfolio of Products 
- Platform Architecture 
     - Installation Overview
     - Operations Manager
     - Tile Installation
     - Client Tools
- Demo & Hands-on TKGI Labs on the cloud
     - Operator Experience
     - Developer Experience
     - Observability & Management Tools
     - Contrasting with Tanzu Application Service
- Next Steps & Feedback
-----------------------------------------------------
## Technical Pre-Requisites
- You should be able to access:

    - https://zoom.us/test
    - https://chess.cfapps.io
    - [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI)

### If using a Windows PC
- You will need to use [PuTTY](./PuTTY_and_SSH.md) to access a Ubuntu VM (public IP address) using a `.ppk` private-key file.
- To download [`fuse.ppk`](./fuse.ppk) you can install and use [wget](http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-setup.exe) in a PowerShell window.
```
help wget
cd ~\Downloads
wget https://raw.githubusercontent.com/rm511130/Tanzu-Workshop-TKGI/master/fuse.ppk -Outfile fuse.ppk
```
- If you rather not install [wget](http://gnuwin32.sourceforge.net/packages/wget.htm), you can simply click on [`fuse.ppk`](./fuse.ppk) then cut-&-paste its contents to a local file in your Windows machine. The file must be named `fuse.ppk` and set to read-only mode.
- If you need help installing or using PuTTY with [fuse.ppk](./fuse.ppk) check these [detailed instructions](./PuTTY_and_SSH.md).
- If you successfully tested the access to the `ubuntu@user1.pks4u.com` VM, you are ready for the workshop.

### If using a Mac 
- You will need to SSH into a Ubuntu VM (public IP address) using a private-key `.pem` file
- Using a Terminal Window, execute the following commands to download `fuse.pem` and set the downloaded file to read-only mode:
```
cd ~/Downloads
wget https://raw.githubusercontent.com/rm511130/Tanzu-Workshop-TKGI/master/fuse.pem
chmod 400 ~/Downloads/fuse.pem
```
- You can now test whether SSH is working with the `fuse.pem` private key using the following command:
```
ssh -i ~/Downloads/fuse.pem ubuntu@user1.pks4u.com
```
- Please `exit` from the Ubuntu VM if your test was successful. You are ready for the workshop.

### If using Google Chrome or Firefox as your Browser

- Throughout this workshop you will be frequently asked to cut & paste commands from this github page to your terminal window.
- Consequently, the [CodeCopy](https://github.com/zenorocha/codecopy#install) browser extension for Firefox & Google Chrome can be a valuable add-on to have. 
- If installing add-ons does not infringing on corporate security policies, please go ahead and install CodeCopy.


-----------------------------------------------------
## A Brief Introduction - VMware Tanzu

<!-- - [VMware Tanzu](https://drive.google.com/open?id=1idNKL_eTxKu5pEc6Z7GwLaJ_W5zaBmOxFecH96gI3ds) &nbsp;&nbsp;&nbsp; by Account Manager -->

<!-- - [Three Types of Code & Shared KPIs](https://drive.google.com/open?id=12yG6cpR6NP12IjATRhrdq3-65ZUBb6ZaZjgS94wZrsk) &nbsp;&nbsp;&nbsp; by Matt Popovich - Senior Solution Engineer -->

- [VMware Tanzu Customer Success Manager](https://drive.google.com/file/d/1L15cVbpE6_4gYhoLfpNPvOPg6L321qDD/view) &nbsp;&nbsp;&nbsp; by Lynn Strickmeyer - CSM

- [VMware Customer Stories](https://tanzu.vmware.com/customers)

- ["Simply put, we're here to help you build, run, manage, connect and protect any cloud environment", Pat Gelsinger, CEP VMWare](https://www.youtube.com/watch?v=6uQu3ZKJ28o)

- Enterprises rely on software and scalable environments to improve business outcomes.
- A critical factor is the *velocity* of:
    - how ideas are converted to new features, new apps, and new services.
    - how you can expand your infrastructure to make use of private/public/hybrid clouds.
- The ever-accelerating pace of change generates a daunting backlog of work for IT leaders.
- Operations are under pressure to reduce technology spend while addressing security vulnerabilities where perimeters encompass mobile, public and private infrastructure. 
- Applications and the underlying infrastructure need to be self-monitoring and self-healing, while remaining highly available.
- The competing mandates - velocity, security, scalability, stability and operational efficiency - force enterprises to re-evaluate how they develop, architect, and operate software. 

VMware is your trusted partner to help address all of these challenges.

![](./images/tanzu.png)


-----------------------------------------------------
## Guidelines & Conventions for this Workshop 

_- TKG / TKG Plus / TKGI are product names aligned to how VMware names all its products in compute, networking and other areas. The ‘i’ in ‘TKGI‘ stands for ‘integrated‘, given the integrated operating system lifecycle management and software defined networking components that are core to the product value. TKGI used to be called PKS (Pivotal Kubernetes Service), so throughout this workshop you will see reminants of the PKS name. For example: the PKS CLI (Command Line Interface)._

- This self-paced workshop includes presentations, videos, demos and hands-on labs. 
- The labs are interdependent and must be executed in order.
- Please use the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) to claim a userID for this workshop. For example, Ralph Meira is user1.
- Update the same [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) as you progress through the Labs, by placing an "X" in the appropriate column.
- Each workshop participant will be assigned a Ubuntu VM previously set up for the execution of hands-on Labs. Your Laptop or Desktop will only be used for two purposes: 
     - SSH'ing or PuTTY'ing into the Ubuntu VM 
     - Browsing web pages
- When carrying out hands-on labs, you will be asked to cut-&-paste the commands shown `in boxes like this one` from this github page to your Ubuntu VM Terminal Window. However, when issuing commands, please make sure to alter the userID to match the one you have claimed, e.g.:
  - `ssh -i fuse.pem ubuntu@user3.pks4u.com` is for `user3` 
  - `ssh -i fuse.pem ubuntu@user15.pks4u.com` is for `user15` 
- In order to simplify the cut-&-paste-&-replace steps described above, once you are operating on your Ubuntu VM Terminal, we will define environment variables that will hold your specific login name as claimed in the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI). In this way, the cut-&-paste steps will not require you to edit the command line before pressing `return`.

- Throughout this document, when it's time for hands-on labs, you will see the following icon:
     
![](./images/lab.png)

- The following icon will show up once or twice during the hands-on labs. It's to remind you to pay special attention to the syntax of the commands you are being asked to execute. The commands will need to match the UserID you claimed for yourself in the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI).
     
![](./images/peril.png)

-----------------------------------------------------
## Architecture, Installation & Set-up 

- A Map of the Tanzu Portfolio of products:

![](./images/TanzuStack.png)

- The diagram below shows the general layout of the VMs, K8s Clusters and Platforms that we will be using during this workshop.

![](./images/BigDiagram.png)

- The videos in this section are great for brushing up on your understanding of the technologies we will be working with during this workshop. 

- If you are comfortable with Containers, Docker and Kubernetes, then please move ahead to Lab-1.

   - [Containers vs. VMs 101 in 8 minutes](https://www.youtube.com/watch?v=L1ie8negCjc)

   - [Containers - Deep Dive in 18 minutes](https://www.youtube.com/watch?v=EnJ7qX9fkcU)

   - [Kubernetes 101 in 5 minutes](https://www.youtube.com/watch?v=PH-2FfFD2PU)

   - [PKS on vSphere, AWS, Azure, and/or GCP](https://docs.pivotal.io/pks/1-6/installing.html)


![](./images/k8s_and_pks.png)

-----------------------------------------------------

### LAB-1: SSH into your Linux Workshop VM environment & Test the Command Line Interface tools

- Let's start by logging into the Workshop environment from your machine (Mac, PC, Laptop, Desktop, Terminal, VDI). You will need to use the following private key: 
   - [fuse.pem](./fuse.pem) if using a Mac.
   - [fuse.ppk](./fuse.ppk) if using a Windows PC.

- Note that the examples shown below apply to `user1`. If, for example, you are `user11`, your Ubuntu VM will be at `user11.pks4u.com`.

![](./images/lab.png)

- In the pre-requisites section of this workshop, you were asked to use `ssh` or `PuTTY` to access the Ubuntu VM that has been assigned to your [UserID](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI). Please go ahead and create a Terminal Session into your VM. The example shown below applies to `user1` if he or she had downloaded the `fuse.pem` key to a Mac. If you need, the `PuTTY` instructions for Windows PC users can be found [here](./PuTTY_and_SSH.md).

```
ssh -i ~/Downloads/fuse.pem ubuntu@user1.pks4u.com 
```

- Once logged in, you can ignore any messages that ask you to perform a `do-release-upgrade`. 

- Please check whether the greeting information matches your UserID. For example, `user22` should see something like this:

```
my_number is 22
openjdk version "11.0.7" 2020-04-14
OpenJDK Runtime Environment (build 11.0.7+10-post-Ubuntu-2ubuntu218.04)
OpenJDK 64-Bit Server VM (build 11.0.7+10-post-Ubuntu-2ubuntu218.04, mixed mode, sharing)
Your UserID is user22
Your DevopsID is devops22
Your Namespace in the Shared-Cluster is namespace22
Your role in the Shared-Cluster is vmware-role22
```

- If you believe your greeting information to be wrong, please alert the workshop organizers. 

- If all is well, please proceed by executing the following commands. These commands will validate that your VM has all the necessary CLIs and frameworks for this workshop.

```
pks --version
kubectl version -o json 2>/dev/null
cf --version
git version
docker --version
go version
jq --version
python3 --version
helm version
java -version
mvn -version
gfsh version
dotnet --version
```

- If any of the commands shown above did not work or produced and error, please alert the workshop organizers.

- Congratulations, you have completed LAB-1.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-2: Running a simple GoLang and a Spring/Java Program Locally (on your Ubuntu VM)

- During this Lab, we will experiment with [GoLang](https://golang.org/), [Spring/Java](https://spring.io/) and [.NET Core](https://dotnet.microsoft.com/learn/dotnet/what-is-dotnet) program examples.
- We will first run these examples of code "natively" on your Ubuntu VM.
- You will then create Docker Images of these programs and, once again, run them locally using the Docker Engine that has been pre-installed on your Ubuntu VM. 
- If you are a Developer, the steps in this Lab should be very easy and familiar to you. 
- If you are an Infrastructure person, the steps in this Lab will help you understand what developers do locally on their machines to run their code. 

#
#### LAB-2A 
![](./images/golang-tiny.png) ![](./images/lab.png)

- Using your Ubuntu VM, you are going to take this [Factorial GoLang Program](https://github.com/rm511130/fact/blob/master/fact.go) and run it locally.

- Execute the following commands:

```
cd ~ 
git clone https://github.com/rm511130/fact  
cd ~/fact  
go run fact.go 
```

- It may take a few seconds, but you should see a log message indicating that your code is `using port 3000`.

- Leave the code running and use a browser to access the following URL. Remember to use the proper FQDN that corresponds to your UserID: e.g. `user20` should use `http://user20.pks4u.com`.
```
http://user1.pks4u.com:3000/1500
``` 

- Did it work? 
  - Take a look at the [code](https://github.com/rm511130/fact/blob/master/fact.go). 
  - Did you find in the code the additional endpoints that you can call? Try them out:
     - `http://user1.pks4u.com:3000/version` 
     - `http://user1.pks4u.com:3000/header`
  - Did you see the logs on the Terminal Window of your VM?

- Use `CTRL-C` on your Ubuntu VM to cancel out of the `go run fact.go` command.

- Let's proceed with a Java/Spring example.


#
#### LAB-2B 
![](./images/java-spring-tiny.png) ![](./images/lab.png)   

- Execute the following commands:

```
cd ~ 
git clone https://github.com/rm511130/spring-petclinic.git
cd spring-petclinic
```
```
./mvnw -Dmaven.test.skip=true package
```
```
./mvnw spring-boot:run
```

- Once you see in your logs that `Tomcat started on port(s): 8080` you can proceed to test your `Pet Clinic` program.

- To test, open a browser to access the following URL. Remember to use the proper FQDN that corresponds to your UserID: e.g. `user11` should use `http://user11.pks4u.com:8080`.

```
http://user1.pks4u.com:8080
```
- If the `Pet Clinic` App is running you have a good Spring/Java example to work with.

- You can use `CRTL-C` on your Ubuntu VM to cancel out of the `spring-boot Pet Clinic` program.

#
#### LAB-2C 
![](./images/dotnet.png) ![](./images/lab.png)   

- Execute the following commands:

```
cd ~; rm -rf dotnet
git clone https://github.com/rm511130/dotnet.git 
cd ~/dotnet
dotnet new global
dotnet new mvc
```
- Let's make a couple of edits to personalize the Welcome Message and to make sure our code is listening on port `5001` by running the following script:

```
source ./tweaking_Index.cshtml_and_Program.cs.sh
```

- Let's run our `.Net Core Welcome` program using the following command:

```
dotnet run
```

- Once you see in `Content root path: /home/ubuntu/dotnet` in your logs on the termional screen, you can proceed to test your `.NET Core Welcome` MVC program.

- To test, open a browser to access the following URL. Remember to use the proper FQDN that corresponds to your UserID: e.g. `user11` should use `http://user11.pks4u.com:5001`.

```
http://user1.pks4u.com:5001
```
- If you see a `Welcome` page, your .NET App is running and you have a good .NET Core example to work with.

- You can use `CRTL-C` on your Ubuntu VM to cancel out of the `.NET Core Welcome` program.

**Let's recap:** 
- Your Linux VM is able to run GoLang, Spring/Java and .NET Core programs.
- Your Linux VM has a public IP address and a FQDN (Fully Qualified Domain Name) that lets your friends access and test your Apps. You can also test your code locally using localhost or 127.0.0.1 when ssh'ed into your Linux VM.
- The code examples you executed provided an http interface which you accessed from a browser.
- A developer typically starts by writing his/her code locally. It's when he/she pushes the code to a server that differences in configuration and dependencies can lead to the famous _"...but it worked on my machine..."_ comments. In the following hands-on labs, we will see how Container Images can help in this area.

#
#### LAB-2D
![](./images/golang-tiny.png)    ![](./images/docker-tiny.png)    ![](./images/lab.png)

- Using your Ubuntu VM let's take a look at the `Dockerfile` in the `~/fact` directory. 

```
cat ~/fact/Dockerfile
```

- The `FROM golang:onbuild` automatically copies the package source, fetches the application dependencies, builds the program, and configures it to run on startup.

- Execute the following commands to start with a clean Docker environment:

```
if [ "$(docker ps -aq -f status=running)" ]; then docker stop $(docker ps -a -q); fi; # stops any running containers
docker system prune -a -f                                                             # deletes old container images
docker images; docker ps -a                                                           # check if anything was left behind
```
- Now let's build a Docker Image of your GoLang factorial program:

```
cd ~/fact
docker build -t fact .        # the dot is important 
```

- Execute the following command to run the `Fact` docker image locally on your Ubuntu VM using `port 3000`:

```
docker run -d --publish 3000:3000 --name fact --rm fact
```

- Using `curl` on your Ubuntu VM, or if you'd like, using a browser, access the following URL to test your `Fact` program. You will need to replace `$user` by your correct UserID if using a browser.

```
curl http://$user.pks4u.com:3000/5; echo
```

- During the `docker build` phase, did you notice how many layers were used to create the Docker Image of your GoLang factorial program? Execute the following commands, one-by-one, to learn more about your Docker Image. Pay attention to the layers and how recent they are:

```
docker image inspect fact
```
```
docker history fact
```

- Note that some layers are `<missing>` their Image-IDs. This is a known backward incompatibility [problem](https://github.com/moby/moby/issues/20131#issuecomment-182294926) introduced by the Docker 1.10 content addressability migration project.

```
docker ps
```

- Now let's start an interactive bash shell on your container:

```
docker exec -it fact bash
```
 - You should see a prompt that looks something like this: `root@627ac94efaa7:/go/src/app#`
 - Let's keep working inside your container.
 - Execute the following commands:
 
 ```
 curl http://127.0.0.1:3000/5; echo
 ```
 ```
 cat /etc/*release
 ```
 ```
 whoami
 exit
 ```
 - What release of the [OS](https://www.debian.org/releases/) was used? 
 - What was the answer to the `whoami` command?
 
#
#### LAB-2E
![](./images/java-spring-tiny.png)    ![](./images/docker-tiny.png)    ![](./images/lab.png)

- Now let's create a Docker Image from the Petclinic Jar file you created during Lab-2B. 
- Execute the following commands to take a look at the `Dockerfile` we will be using:

```
cd ~/spring-petclinic
cat Dockerfile
```

- Let's build a Docker Container Image and run it locally on your Ubuntu VM. Use the following commands:

```
docker build -t petclinic . 
docker run -d --publish 80:8080 --name petclinic --rm petclinic
```

- It will take around **15 seconds** for your Petclinic App to start running. You will then be able to access it at the following URL. Please make sure to edit the `<userID#>` and replace it with the appropriate UserID you claimed at the beginning of the workshop.

```
http://<userID#>.pks4u.com
```

- Let's now take a look at the layers used in the creation of your Petclinic container image:

```
docker history petclinic
```
```
docker exec -it petclinic sh -c "cat /etc/*release" | head -n 4
```

- What release of the [OS](https://alpinelinux.org/) was used? 

- As a developer, you have a lot of control over what layers and operating systems are employed in building a container image. It's very easy to _pick what works_ and proceed with code that delivers business functionality. It's also very easy to _stick with what works_ which can open vectors of attack to [Common Vulnerabilities and Exposures (CVEs)](https://www.cvedetails.com/cve-help.php).  

#
#### LAB-2F
![](./images/dotnet.png)    ![](./images/docker-tiny.png)    ![](./images/lab.png)

- Now let's create a Docker Image for the `.NET Core Welcome` program.


- Execute the following commands to publish your `.NET Core Welcome` program and to create a `Dockerfile`:

```
cd ~/dotnet
dotnet publish -c Release
```

- Take a look at the contents of `Dockerfile` using the following commands:

```
cd ~/dotnet
cat Dockerfile
```

- Let's build a Docker image of your `.NET Core Welcome` App, and run it in your Linux VM:

```
docker build -t dotnet-core-welcome -f Dockerfile .
docker run -d -p 5001:5001 --name dotnet-core-welcome dotnet-core-welcome
```

- It may take a few seconds, but you should be able to access your `.NET Core Welcome` App by openning a browser to access the following URL. Please make sure to edit the `<userID#>` and replace it with the appropriate UserID you claimed at the beginning of the workshop.

```
http://<userID#>.pks4u.com:5001
```

- Let's now take a look at the layers used in the creation of your `.NET Core Welcome`  container image:

```
docker history dotnet-core-welcome
```
```
docker exec -it dotnet-core-welcome sh -c "cat /etc/*release" | head -n 4
```
 - What release of the [OS](https://www.debian.org/releases/) was used? 

**Let's recap:** 
- You built and executed Docker Images on your Ubuntu VM using essentially the same files you used during LABs 2A, 2B and 2C.
- Using various commands on your Ubuntu VM or in Docker containers, you were able to see that many layers (and software versions) were assembled together on your behalf as a result of the `docker build` commands.
- Now that you have a working, local container image of your `fact`, `petclinic` and `dotnet-core-welcome` programs, as a developer, you should feel reassured that your Apps have a good chance of working in their containerized image format, when pushed to a server. This is one of the main reasons for the success of Container Images among developers.

Congratulations, you have completed LAB-2.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-3: Connecting to TKGI API, Creating and Resizing Kubernetes Clusters

## TKGI Clusters on the Public Cloud

- The creation of a Kubernetes Cluster takes several minutes, so we have already set up a Kubernetes Cluster for each workshop attendee in preparation for this workshop. 

- We are running a big part of this Workshop on Google's GCP Public Cloud given its elastic capacity. The commands used to create the workshop clusters are describe [here](https://docs.pivotal.io/tkgi/1-8/gcp-cluster-load-balancer.html). At a high-level, the GCP-specific steps to create clusters are as follows:
     - Create a GCP Load Balancer
     - Create a DNS Entry
     - Create the Cluster e.g. `pks create-cluster user1-cluster -e user1-cluster-k8s.pks4u.com --plan small --num-nodes 1`
     - Configure Load Balancer Back End
     - Create a Network Tag
     - Create Firewall Rules
     - Access the Cluster
     
- The steps shown above are typically scripted as can be seen [here](https://github.com/rm511130/manage-pks).

## TKGI on vSphere with NSX-T

- When using TKGI/PKS on vSphere with NSX-T, the steps to create a K8s cluster do not require the configuration of a load balancer to access the PKS API VM. A DNAT rule is automatically configured to make the PKS API host accessible. 

![](./images/lab.png)

- There are just two steps necessary to create a K8s cluster on TKGI running on vSphere with NSX-T. Let's go ahead and create a K8s Cluster on TKGI running on vSphere with NSX-T. Please execute the following commands. Please note that our use of the environment variables `$devops` and `$user` will automatically align each command to match your UserID, so you need not make any changes to the commands shown below:

```
pks login -a https://api.run.haas-208.pez.pivotal.io:9021 -p password -k -u $devops
pks create-cluster $user-cluster --plan small --num-nodes 1 -e $user.run.haas-208.pez.pivotal.io
```

- That's it. You can check on the status of the `pks create-cluster` process by executing the following command: 

```
pks cluster $user-cluster
```

- Once you see an output similar to the example shown below, you need only add the appropriate Master Node A-record DNS entry to match its IP address, and the cluster is ready to be used.

```
TKGI Version:             1.7.0-build.26
Name:                     user2-cluster
K8s Version:              1.16.7
Plan Name:                small
UUID:                     115d125a-b387-4005-b36f-28276a08661e
Last Action:              CREATE
Last Action State:        succeeded
Last Action Description:  Instance provisioning completed
Kubernetes Master Host:   user2.run.haas-208.pez.pivotal.io    <-------+
Kubernetes Master Port:   8443                                         |________  A-Record DNS Entry
Worker Nodes:             1                                            |
Kubernetes Master IP(s):  10.195.72.137      <-------------------------+
```

- You can come back later to check on the progress of your `pks create-cluster` process. It normally takes 8 to 10 minutes to complete. 

- Behind the scenes, when a TKGI Kubernetes cluster is created, NSX-T creates and configures a dedicated load balancer that is tied to the cluster. The load balancer is a shared resource designed to provide efficient traffic distribution to master nodes as well as services deployed on worker nodes. Each application service is mapped to a virtual server instance, carved out from the same load balancer. For more information, see [Logical Load Balancer in the NSX-T documentation](https://docs.vmware.com/en/VMware-NSX-T/2.1/com.vmware.nsxt.admin.doc/GUID-46567C8D-A5C5-4793-8CDF-858E58FDE3C4.html).

- From this point onwards we will continue the Workshop Labs using the TKGI on GCP clusters that have already been provisioned for you.

![](./images/bosh_pks_k8s_on_public_cloud.png)

![](./images/lab.png)

- During this lab you are going to assume the role of a Platform DevOps person.
- Execute the following commands to log into the TKGI/PKS Control Plane (a.k.a. Master Node) of the K8s cluster we created for you on GCP. 
- As you copy and execute these commands in your Linux Workshop VM, please take the time to read each line and try to understand what it does.

```
echo $devops
pks login -a https://api.pks.pks4u.com:9021 -p password -k -u $devops
pks clusters
pks plans
pks cluster $user-cluster
```

- Let's get more detailed information about your cluster. We'll start by erasing your local `config` file. Execute the following commands.

```
rm ~/.kube/config
kubectl config view
```

- Note: the [Kubernetes Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/) is a valuable resource you should bookmark.

- Let's now get `kubectl` credentials for your `DevOps` user. If prompted for a password, use `password`. Please execute the following commands:

```
pks get-credentials $user-cluster
```
- Let's now take a look at your `kubeconfig`:

```
ls ~/.kube/config                   
kubectl config view                   
```

- The commands shown above helps us check whether your `kubeconfig` file has been re-created with the information `kubectl` needs to choose a cluster and communicate with the API server of that cluster. 
- Let's learn more about your cluster. Please execute the following commands:

```
kubectl cluster-info
nslookup $user-cluster-k8s.pks4u.com
pks cluster $user-cluster
```

- The `kubectl cluster-info` command relays back to you information about the the diagram shown above. You have a Load Balancer entry point that allows `kubectl` commands to get through to the `API Server` (Process) in your cluster's `Control Plane (Master Node VM)` using `https` over `port 8443`. 
- The IP address you obtained by executing the `nslookup` command, is the IP address of the Load Balancer.
- The `pks cluster` command shows you the real IP address of your `Control Plane (Master Node VM)`.
- The `kubectl cluster-info` command also informed you that your cluster is using [`CoreDNS`](https://coredns.io/) instead of the older `Kube-dns`. `CoreDNS` is a flexible, high-performance, extensible DNS server used by your Kubernetes cluster. `CoreDNS` listens for service and endpoint events from the Kubernetes API and updates its DNS records as needed. These events are triggered when you create, update or delete Kubernetes services and their associated pods. Like Kubernetes, the `CoreDNS` project is hosted by the [`CNCF`](https://www.cncf.io/).

- Execute the following commands to get an inventory of the API resources and versions, the namespacing and a general report on all resources and their different types. As you will see, your K8s cluster is already quite busy even though you haven't deployed any Apps to it just yet.

```
kubectl get ns
kubectl get all --all-namespaces
kubectl api-versions
kubectl api-resources
```

- You can learn more about Kubernetes APIs at https://kubernetes.io/docs/reference/kubectl/overview/

- As you issue `kubectl` commands, you can make use the `tab` key to auto-complete commands because we added `source <(kubectl completion bash)` to your `~/.bashrc` file.

- Earlier in this lab, you executed the `pks plans` command, so you know the K8s cluster sizing specifications defined by Operations. Let's take a look at the current capacity of your K8s cluster by executing the following command:

```
kubectl top nodes
```

- You should see an output similar to the one shown below:

```
NAME                                      CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
vm-0c3e6eaf-b5dc-4bd4-7cd6-d5cec23121b8   429m         21%    2488Mi          64%
```

   - The results shown above indicate that 64% of the 4GB of VM Worker Node Memory are being used. 
   - You only have one worker node.
   - The results also show that 21% of 2 vCPUs (2000m) are being consumed.
   
- You can also execute the following command to see how `pods` in system namespaces are performing:

```
kubectl top pods --all-namespaces
```

- Let's scale your cluster horizontally by adding an additional K8s worker node using the following command:

```
pks resize $user-cluster --num-nodes 2
```

- Use the following command to monitor the growth of your cluster:

```
pks cluster $user-cluster
```

- You should see output similar to the example below:

```
PKS Version:              1.7.0-build.26
Name:                     user1-cluster
K8s Version:              1.16.7
Plan Name:                small
UUID:                     6e3907eb-3ac0-4c6e-8196-8f5b1ebd03b0
Last Action:              UPDATE
Last Action State:        in progress
Last Action Description:  Instance update in progress
Kubernetes Master Host:   user1-cluster-k8s.pks4u.com
Kubernetes Master Port:   8443
Worker Nodes:             1
Kubernetes Master IP(s):  10.0.11.10
Network Profile Name:     
Kubernetes Profile Name:  
Tags:    
```
- Note in the output shown above the line that indicates the active resizing of your cluster:

```
Last Action State:        in progress
```
- You don't need to wait while the expansion of the worker nodes is progressing. Let's proceed with the next steps.

- Had we wished to scale the cluster vertically, we would have followed the instructions found [here](https://docs.pivotal.io/pks/1-7/scale-clusters.html). Scaling vertically basically means changing the definition of the `pks plans` and allowing TKGI to upgrade cluster nodes behind the scenes. This is an operation reserved for TKGI Operators.

- Worker and Control Plane node sizing is detailed under https://docs.pivotal.io/tkgi/1-8/vm-sizing.html

**Let's recap:** 
- You created a TKGI Kubernetes Cluster on vSphere and NSX-T using 2 simple steps. 
- You logged into the TKGI Control Plane as a DevOps user, and scaled an existing cluster.
- You executed a few new `kubectl` commands against your cluster as a DevOps user with **TKGI Manager** privileges. Your peers also executed the same commands, but note that you only saw your `userID-cluster` and they only saw their `userID-clusters`. Later on in this workshop you will execute commands as a **TKGI Administrator** and this will allow you to see all the `userID-clusters` running on the TKGI Platform.
- Even though cluster resizing is taking place as you read these words, we're not going to worry about it. TKGI knows what to do. We're just going to continue with Lab-4 and the deployment of Apps to your K8s cluster.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

Congratulations, you have completed LAB-3.

-----------------------------------------------------
### LAB-4: Deploying Apps to Kubernetes Clusters

- Docker container images identical to the ones you created during Lab-2D, Lab-2E and Lab-2F have been tagged and uploaded into the Public Docker Hub as [rmeira/fact](https://hub.docker.com/repository/docker/rmeira/fact), [rmeira/petclinic](https://hub.docker.com/repository/docker/rmeira/petclinic) and [rmeira/dotnet-core-welcome](https://hub.docker.com/repository/docker/rmeira/dotnet-core-welcome). The short documentation found at [rmeira/fact](https://hub.docker.com/repository/docker/rmeira/fact) contains the steps taken to tag and upload a Docker Image into the Public Docker Hub. You will carry out these steps in a subsequent Lab when it's time to upload container images into a private registry called `Harbor`. 

- During this lab you will deploy your containerized Apps in your K8s cluster. 

#
#### LAB-4A
![](./images/golang-tiny.png)    ![](./images/docker-tiny.png)    ![](./images/lab.png)

- Let's use the [rmeira/fact](https://hub.docker.com/repository/docker/rmeira/fact) image to run the Factorial program on your Kubernetes cluster.

- Execute the following commands:

```
kubectl create deployment fact --image=rmeira/fact
kubectl get all
kubectl expose deployment fact --type=LoadBalancer --port=80 --target-port=3000
```
- It takes a minute to create a load balancer and to expose a K8s service, so let's first test if there is a pod running the `rmeira/fact` container image using the following commands:

```
kubectl get pods -w
```
- If you see that your `fact` pod has a `STATUS` of `running`, please use `CTRL-C` to cancel the command above and proceed with the following commands:

```
pod_name=$(kubectl get pods | grep fact | awk '{ print $1 }'); echo $pod_name         # getting the name of the pod that is running your fact app
kubectl exec -t -i $pod_name bash                                                     # open terminal session 
```

- The `kubectl exec` command opens a terminal session on the container that is running the `fact` Docker Image in your cluster. You should see a prompt similar to the example: `root@factorial:/go/src/app#`

- Continue with the following commands to test whether the `fact` program is running:

```
curl 127.0.0.1:3000/40; echo
exit
```
- The `exit` command you just executed will bring you back to the command prompt on your Ubuntu VM. Let's check whether your service has been assigned a load balancer External-IP address, and whether the `pks resize` command from the previous lab has completed successfully.

```
kubectl get service
pks cluster $user-cluster
```
- Execute the commands above every 30 seconds until you see:
   - an `External IP` show up for the `fact` service
   - _Note: you may also see a `Last Action State: succeeded` and `Worker Nodes: 2`_
   
- As soon as the `External IP` address for the `fact` service is available, no matter whether or not the `pks resize` command is still `in progress`, you can proceed by executing the following command to test your `fact` docker image:

```
curl http://<External-IP>/10; echo
```
- You should see the results of the `10!` calculation.

- Let's check your K8s cluster utilization by executing the following command:

```
kubectl top nodes
```

- The results from the command shown above should show that you have plenty of capacity in your cluster. The output shown below is just for reference. Don't worry if you don't see two VMs as shown below. You can use `pks clusters` to check whether the `pks resize` command is still working to create the additional Worker Node.

```
NAME                                      CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
vm-0c3e6eaf-b5dc-4bd4-7cd6-d5cec23121b8   349m         17%    2246Mi          58%       
vm-57da0f21-d1ee-4a70-6c37-2276ba0920e4   71m          3%     803Mi           20% 
```

#
#### LAB-4B
![](./images/java-spring-tiny.png)    ![](./images/docker-tiny.png)    ![](./images/lab.png)

- Let's use the [rmeira/petclinic](https://hub.docker.com/repository/docker/rmeira/petclinic) image to run the `Petclinic` program on your Kubernetes cluster.

- Execute the following commands:

```
kubectl create deployment petclinic --image=rmeira/petclinic
kubectl expose deployment petclinic --type=LoadBalancer --port=8080
```
- It takes a minute to create a load balancer and to expose a K8s service. You can see the pod being created using the following command:

```
kubectl get pods -w
```

- You can use `CTRL-C` to cancel out of the `-w` watch mode.

- Similarly, the command below will display information about your K8s services:

```
kubectl get service -w
```
- You can use `CTRL-C` to cancel out of the `-w` watch mode once you see an `External IP` show up for the `Petclinic` service
   
- As soon as the `External IP` address is available, access the following URL using a browser to verify that your `Petclinic` docker image is working as expected:

```
http://<External-IP>:8080
```
- You should see the `Petclinic` App.

- Let's check your K8s cluster utilization by executing the following command:

```
kubectl top nodes
```

- The results from the command shown above should show that you have plenty of capacity in your cluster. The results shown below are just for reference:

```
NAME                                      CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
vm-0c3e6eaf-b5dc-4bd4-7cd6-d5cec23121b8   338m         16%    2252Mi          58%       
vm-57da0f21-d1ee-4a70-6c37-2276ba0920e4   83m          4%     1083Mi          28%
```

- Comparing the results shown above with the previous `kubectl top nodes` output, we can see that the 2nd VM Worker Node has grown its memory utilization from `20%` to `28%`. This change indicates that the single `pod` running the `Petclinic` App was allocated to run in the 2nd VM Worker Node. We can confirm this by executing the following commmand:

```
kubectl get pods -o json | grep 'nodeName\|\"name\"' | grep 'fact\"\|nic\"\|ome\"\|vm' 
```

#
#### LAB-4C
![](./images/dotnet.png)    ![](./images/docker-tiny.png)    ![](./images/lab.png)

- Let's use the [rmeira/dotnet-core-welcome](https://hub.docker.com/repository/docker/rmeira/dotnet-core-welcome) image to run the `.NET Core Welcome` program on your Kubernetes cluster. We will create a namespace for your `.NET Core Welcome` App.

- Execute the following commands:

```
kubectl create namespace dotnet-core-welcome
kubectl create deployment dotnet-core-welcome --image=rmeira/dotnet-core-welcome -n dotnet-core-welcome
kubectl expose deployment dotnet-core-welcome --type=LoadBalancer --target-port=5001 --port=5001 -n dotnet-core-welcome
```
- It takes a minute to create a pod, a load balancer and to expose a K8s service. You can see the pod being created using the following command:

```
kubectl get pods -n dotnet-core-welcome
```

- Similarly, the command below will display information about your K8s services:

```
kubectl get service -n dotnet-core-welcome
```
   
- As soon as the `External IP` address is available, access the following URL using a browser to verify that your `.NET Core Welcome` docker image is working as expected:

```
http://<External-IP>:5001
```
- You should see a `.Net Core Welcome` home page that reads: `Welcome to all Users`.

- Let's check your K8s cluster utilization by executing the following command:

```
kubectl top nodes
```

- The results shown below are just for reference:

```
NAME                                      CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
vm-0c3e6eaf-b5dc-4bd4-7cd6-d5cec23121b8   362m         18%    2255Mi          58%       
vm-57da0f21-d1ee-4a70-6c37-2276ba0920e4   100m         5%     1121Mi          29% 
```

**Let's recap:**
- Even though the `pks resize` command was still `in progress`, you were able to carry out App deployments.
- You deployed the `fact`, `petclinic` and `.NET Core Welcome` images to your K8s cluster and tested to make sure they were working.
- Kubernetes fetches images from a registry which, until now, was the public Docker Hub image registry. We will see in the next Lab how to use Harbor, an Enterprise-Class registry for storing and scanning your images.
- You kept an eye on K8s cluster capacity using `kubectl top nodes`
- You exposed `fact`, `petclinic` and `.Net Core Welcome` deployments as services available on the Internet fronted by Load Balancers.
- However:
  - you did not get SSL encrypted, secure URLs accessible on the Internet. 
  - you also did not get a FQDN (Fully Qualified Domain Name) for each exposed service.
- Anyone with access to the correct `External IP` addresses is able to run/access your `fact`, `petclinic` and `.Net Core Welcome` programs.
- If you did wish to secure your programs with TLS and a Let's Encrypt (CA) Certificate, you would need to follow these [instructions](https://docs.bitnami.com/kubernetes/how-to/secure-kubernetes-services-with-ingress-tls-letsencrypt/).

#
#### LAB-4D - Using Ingress Controllers
![](./images/lab.png)

- Each one of the apps we are running on your Kubernetes Cluster has been created with a `Service` of the type `LoadBalancer`. You can see this by executing the following command:

```
kubectl get services; kubectl get services -n dotnet-core-welcome
```
- Load Balancers are expensive. Let's take a look at the use of Ingress Controllers instead. Execute the following commands to delete the exposed services of your three Apps:

```
kubectl delete service fact petclinic
kubectl delete service dotnet-core-welcome -n dotnet-core-welcome
```

- Now let's recreate the services as NodePort services by executing the following commands:

```
kubectl expose deployment fact --type=NodePort --port=3000
kubectl expose deployment petclinic --type=NodePort --port=8080
kubectl expose deployment dotnet-core-welcome -n dotnet-core-welcome --type=NodePort --port=5001
```

- Execute the following command to install the NGINX Ingress Controller in your Kubernetes cluster using Helm:

```
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
helm install nginx-ingress stable/nginx-ingress --set rbac.create=true --set controller.config.proxy-buffer-size=16k
```
- The configurable parameters of the NGINX Ingress Controller can be found [here](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/#configuration).

- Once the `helm install` command has finished, you should see output similar to the example shown below:

```
NAME: nginx-ingress
LAST DEPLOYED: Wed Jul  8 03:32:14 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The nginx-ingress controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace default get services -o wide -w nginx-ingress-controller'

An example Ingress that makes use of the controller:

  apiVersion: extensions/v1beta1
  kind: Ingress
  metadata:
    annotations:
      kubernetes.io/ingress.class: nginx
    name: example
    namespace: foo
  spec:
    rules:
      - host: www.example.com
        http:
          paths:
            - backend:
                serviceName: exampleService
                servicePort: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
        - hosts:
            - www.example.com
          secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls
```

- Let's look for the NGINX service:

```
kubectl get service 
```

- Take note of the `External-IP Address` of your `nginx-ingress-controller` of type `LoadBalancer`. In the example shown below, it's `35.231.44.137`:

```
NAME                            TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)                      AGE
fact                            NodePort       10.100.200.198   <none>          3000:30895/TCP               9h
kubernetes                      ClusterIP      10.100.200.1     <none>          443/TCP                      2d10h
nginx-ingress-controller        LoadBalancer   10.100.200.66    35.231.44.137   80:30016/TCP,443:31365/TCP   11m
nginx-ingress-default-backend   ClusterIP      10.100.200.47    <none>          80/TCP                       11m
petclinic                       NodePort       10.100.200.42    <none>          8080:31478/TCP               9h
```

- Please ask the workshop organizers to create a DNS entry mapping your `nginx-ingress-controller` IP address (e.g. `35.231.44.137`) to the following FQDN  `userID-nginx.pks4u.com` where `userID` is your UserID claimed in the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI).

- Wait until the following command resolves the FQDN to your `nginx-ingress-controller` IP address:

```
nslookup $user-nginx.pks4u.com
```

- Assuming that `nslookup $user-nginx.pks4u.com` is working, let's proceed by creating an ingress for your Apps. Please execute the following commands:

```
kubectl get ingress
cat ~/ingress-4-apps.yml
envsubst < ~/ingress-4-apps.yml | kubectl apply -f -
```

- The `envsubst` command simply replaces `$user` in the yaml file with it's actual value. 

- Please execute the following command to check whether your ingress has been created:

```
kubectl get ingress
```

- 








#
#### LAB-4E
![](./images/lab.png)

- Let's clean your K8s cluster. We will use two different methods. 

- Method 1: execute the following commands to delete the `Petclinic` deployment and service:

```
kubectl delete deployment petclinic
kubectl delete service petclinic 
```

- Method 2: delete the namespace where the `.Net Core Welcome` deployment and service were created:

```
kubectl delete ns dotnet-core-welcome
```



**Let's recap:**
- If you scope your App, Pod(s), Deployment, Replicaset and Service to a given namespace, it's easy to delete all the obejcts by just deleting the namespace.

Congratulations, you have deployed a GO App, Java/Spring Boot App and a .NET Core App to a K8s cluster, and completed LAB-4.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-5: Using Harbor, Clair and Notary

- Let's see how Harbor, Clair and Notary enhance the Ops and Devs experience.

![](./images/harbor.png)

![](./images/lab.png)

- Harbor was installed next to TKGI in Ops Manager, and `user1`, `user2`, ... were all created using the *same password*: `Password1`. 

- Log into Harbor using a browser: [`https://harbor.pks4u.com/`](https://harbor.pks4u.com/)

- To get acquainted with Harbor's GUI, follow the example below, clicking where the yellow arrows are pointing, so you can get an idea of how Harbor works. Your userID has been given administrator privileges, so please be careful not to change Harbor's configuration.

![](./images/harbor-walk-through.png)

- Keep Harbor open. You will come back to it in a few minutes.

- Execute the following command:

```
docker images
```
- Verify that you have at least three docker images that are local to your Ubuntu VM: `fact`, `petclinic` and `dotnet-core-welcome`. 
- Proceed by executing the following commands to log into Harbor from your Ubuntu VM and to upload images to the Harbor registry:

```
docker login -p Password1 harbor.pks4u.com -u $user
docker tag fact harbor.pks4u.com/library/$user-fact:latest
docker tag petclinic harbor.pks4u.com/library/$user-petclinic:latest
docker tag dotnet-core-welcome harbor.pks4u.com/library/$user-dotnet-core-welcome:latest
docker images
docker push harbor.pks4u.com/library/$user-fact:latest
docker push harbor.pks4u.com/library/$user-petclinic:latest
docker push harbor.pks4u.com/library/$user-dotnet-core-welcome:latest
```
- Now look for your programs in the Harbor browser session you were asked to leave open.

- If scanning of your images hasn't happened yet, go ahead and select your `userID-fact` image and scan it for vulnerabilities. 
- Do the same for your `userID-petclinic` and `userID-dotnet-core-welcome` images.
- How many CVEs are your `fact`, `petclinic` and `dotnet-core-welcome` Apps exposed to?

- Now execute the following command on your Ubuntu VM:

```
docker pull harbor.pks4u.com/library/$user-fact:latest
```

- The message you received back is a reflection of Harbor's configuration. Note that the image you pushed to Harbor is also not signed. We can set Harbor's configuration to prevent unsigned images from being pulled as well.

- Execute the following command:

```
docker pull harbor.pks4u.com/library/chess-cf:1.0
```
- This image should have downloaded without problems because it does not expose you to any critical CVEs. Execute the following command to confirm the status of your local Docker images:

```
docker images
```

**Let's recap:**
- You were able to target a Harbor registry.  
- You uploaded container images and downloaded a container image.
- You scanned container images and saw that Harbor did not allow you to download images with `high` or `critical` vulnerabilities.

Congratulations, you have completed LAB-5.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.


-----------------------------------------------------
### LAB-6: Scaling an App on Kubernetes

- Now let's scale up and down the number of pods running the `fact` docker image.

![](./images/lab.png)

- For this Lab you will need to open 3 (three) terminal windows that access your Ubuntu VM. Please arrange them side by side, per the example below, keeping all 3 terminal windows simultaneously visible on your screen. 
- If using PuTTY, you can right-click on the top border of your existing terminal window and use the "Duplicate Session" option. 
- If using a Mac, you can open more terminal windows using ⌘ N, command-N. You will need to use the `ssh` command to log into your Ubuntu VM.

![](./images/3-terminals-start.png)

- Let's denominate as Terminal Window #1 the long, narrower terminal window on the right-side of your screen. 
- Using Terminal Window #1, execute the following command to retrieve the `External IP` address of your `fact` service.
```
kubectl get service
```
- Using Terminal Window #1, execute the following command using the `External IP` of your `fact` service.
```
# example: while true; do curl http://35.227.49.80/10; echo; done; #

while true; do curl http://<External IP>/10; echo; done;
```
- You should see a never ending flow of `10!` calculations. This will be our _canary query_. It will help us determine if Kubermetes is properly orchestrating the deployment of additional containers, and linking them to the `fact` service.
- Practice using `CTRL-C` on Terminal Window #1 to stop the processing of `10!`, and then use `<arrow up>` to re-issue the `while true` command to restart the _canary query_ test cycle.

- Let's denominate as Terminal Window #2 the top, wider terminal window.
- Using Terminal Window #2, execute the following command:
```
watch kubectl get pods -o wide
```

- Using Terminal Window #3, i.e. the remaining terminal window that has an available Linux prompt, execute the following commands:
```
kubectl scale deployment fact --replicas=20
```

- Your screen should look like the example shown below:

![](./images/3-terminals-executing.png)


- On Terminal Window #2, you should see an output similar to the example shown below:

```
NAME                  READY  STATUS    RESTARTS   AGE    IP            NODE                                     
fact-85774cfbb8-268th  1/1   Running      0       3m29s  10.200.44.8   vm-635fc928-8e80-4c61-7498-142b72106e16
fact-85774cfbb8-4l4wt  1/1   Running      0       3m29s  10.200.44.15  vm-635fc928-8e80-4c61-7498-142b72106e16
fact-85774cfbb8-72rqk  1/1   Running      0       3m29s  10.200.85.19  vm-25ed22a9-b268-4ba5-797c-99595d6c5873
fact-85774cfbb8-7v7sv  1/1   Running      0       3m29s  10.200.85.20  vm-25ed22a9-b268-4ba5-797c-99595d6c5873  
...
```
- Note in the output shown above that under `NODE` we see two different VM identifiers. That is to be expected given that you resized your K8s cluster to two worker nodes during Lab-3.

- While changing the number of `replicas`, did you see any error messages on Terminal Window #1?

```
curl: (7) Failed to connect to 35.227.49.80 port 80: Connection refused
```

- If you did see error messages, it's because additional tuning of the containers is necessary. We need to introduce the concept of configuring [Liveness, Readiness and Startup Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#configure-probes) so that Kubernetes will know to direct traffic to the pods only when they are ready and healthy. Luckily, we created our `fact` program with a `/health` end-point, so we're half-way to a solution.

- Keep Terminal Windows #1 and #2 running. We will come back to them shortly.

- Let's try to fix the `Connection Refused` issue by amending the existing deployment specifications with the yaml snippet shown below:

```
      containers:
      - image: rmeira/fact
        ports:
          - containerPort: 3000
            protocol: TCP
        readinessProbe:
          httpGet:
            path: /health
            port: 3000
          initialDelaySeconds: 5
          periodSeconds: 10
        livenessProbe:
          httpGet:
            path: /health
            port: 3000
          initialDelaySeconds: 10
          periodSeconds: 20
```

- Here are the steps to follow:

```
cd ~
kubectl get deployment fact -o yaml > fact-deployment.yml
```

- You then need to alter the contents of the `fact-deployment.yml` file to include the yaml snippet shown above. 
- *However*, since it's very easy to get the yaml formatting wrong, and the purpose of this workshop is not to test your editing skills, let's proceed by using the `fact-deployment-with-readiness-probe.yml` file, available in your home directory, to recreate a working deployment of your `fact` program.

- Delete and recreate, using [`fact-deployment-with-readiness-probe.yml`](./fact-deployment-with-readiness-probe.yml), your `fact` deployment using the following commands:

```
kubectl delete deployment fact
kubectl apply -f fact-deployment-with-readiness-probe.yml
```

- It will take K8s a few seconds to achieve the desired state described in the `fact-deployment-with-readiness-probe.yml`.

- When you will see the `10!` calculations on Terminal Window #1, you can proceed ahead to the next step.

- Observe whether the `Connection Refused` issue occurs when scaling up and down the number of pods in your deployment:

```
kubectl scale deployment fact --replicas=20
```

- Wait until all the pods are running before proceeding with the scaling down command:

```
kubectl scale deployment fact --replicas=1
```

- Clean-up: 
    - We will need three Terminal Windows during the next Lab, so don't close any Terminal Windows just yet.
    - please use CTRL-C to halt any loops that may still be actively creating output to any of your Terminal Windows. 
    - please execute the following commands:
    
    ```
    kubectl delete deployment fact
    kubectl delete service fact
    ```

**Let's recap:** 
- The `fact` image deployed with the `kubectl create deployment fact --image=rmeira/fact` command had to be amended with a `livenessProbe` and a `readinessProbe` to reduce the impact of scaling horizontally the number of running pods. 
- Kubernetes developers need to understand their environment quite well from a DevOps perspective when developing more complex, microservices based, distributed systems. Order Entry systems, for example, can't afford to suffer from hiccups when the platform is auto-scaling to handle increases in demand.
- For the more advanced users, you may wish to experiment with scaling the K8s cluster using the `pks resize <cluster-name> --num-nodes <#>` command while deploying and scaling the `fact` app. Additional commands such as `kubectl drain <node>` and `kubectl uncordon <node>` also demonstrate the power K8s puts at your fingertips for draining workloads from nodes.
- Advanced workload placement and management using K8s clusters can be a fun area to [explore](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/).

Congratulations, you have completed LAB-6.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-7: K8s Soft and TKGI Hard Tenancy

![](./images/lab.png)

- We have to be extra-cautious during this Lab because it can be destructive depending on the username you employ.

- Your `devops<#>` user is only allowed to see and manage the K8s clusters that it created, and it's also limited to only creating K8s clusters within the sizing limits and machine types defined by the TKGI Administrator. Please execute the following commands:

```
pks login -a https://api.pks.pks4u.com:9021 -p password -k -u $devops 
pks clusters
pks get-credentials $user-cluster        # if asked, password = password
```

- Now, let's try to resize your K8s cluster to 10 worker nodes:
```
pks resize $user-cluster --num-nodes 10
```

![](./images/peril.png)

- Let's try to delete (*not yours, but*) a colleague's cluster:
```
pks delete-cluster user25-cluster   # make sure you know what you are doing before proceeding with this step
```

- As you can see TKGI Administrators have placed guardrails that kept you from making your K8s cluster too big, or from deleting a cluster that was not yours.

- Let's deploy a new App to your `user<#>-cluster`:

```
kubectl create deployment timer-test --image=rmeira/timer-test
kubectl expose deployment timer-test --type=LoadBalancer --port=80 --target-port=3000
```
- Execute the command below until you see an `External IP` address assigned to your service. You can then use `CTRL-C` to cancel the `watch` loop:

```
kubectl get service timer-test -w
```

- Using the `External IP` address, execute the following command and leave it running. Use Terminal Window #1 for this step.

```
while true; do curl http://<External-IP>/5000000000; echo; done
```
- Go back from time to time to this Terminal Window #1 to see how your `timer-test` is responding. 
- Check with other colleagues, that are also part of this workshop, whether they have started their `timer-test`.
- We will come back to it in a little while, but the main concept here is that your cluster is a TKGI tenant with hard isolation from other TKGI tenants. Workloads running in separate clusters will not affect your `timer-test` response times.

- Now to the dangerous part of this Lab. Using a second Terminal Window, execute the following command to become a TKGI Administrator:

```
pks login -a https://api.pks.pks4u.com:9021 -u pks_admin -p password -k
```
- Now take a look at the scope of control of the `pks_admin` user, by executing the following command:
```
pks clusters
```
- When logged-in with the scope of a TKGI Administrator, you can see and manage all K8s Clusters created via the TKGI Control Plane. Please make sure not to delete or resize any clusters.

- We have a `shared-cluster` that has not been used in any labs. Execute the following command to learn more about this `shared-cluster`:

```
pks get-credentials shared-cluster                 
```
- If asked for a password, use `password`. Please continue with the following commands:

```
pks cluster shared-cluster
kubectl cluster-info
kubectl get namespaces
```

- Now, you are going to use the `role` and a `namespace` that were assigned to your UserID. Execute the following commands:

```
kubectl get role $role -n $namespace -o yaml
kubectl get rolebinding $role -n $namespace -o yaml
```

- The `role` and `rolebinding` shown above, limit your `userID` to only be able to perform commands within the scope of your `namespace<#>`.

- Let's switch to playing the role of a developer. We will switch to being `user<#>` instead of `pks_admin` or `devops<#>`. Please execute the following commands:

```
rm ~/.kube/config            # this eliminates all previously used login token information on your Ubuntu VM
./get-pks-k8s-config.sh --API=api.pks.pks4u.com --CLUSTER=shared-cluster-k8s.pks4u.com --USER=$user     # password = password
```
- Now let's check if the `~/.kube/config` you deleted a few seconds ago is back with the correct scopes:

```
cat ~/.kube/config
```

- You are now logged into the `shared-cluster` as the `user<#>` you selected. You are also limited to the role assigned to `user<#>` which is only allowed to operate within a single `namespace<#>`.

- Let's execute the following commands to initiate a `timer-test` in the `shared-cluster` within your `namespace<#>` that has been limited to only allow `user<#>` access and control. Execute the following commands:

```
kubectl create deployment timer-test --image=rmeira/timer-test -n $namespace
kubectl expose deployment timer-test --type=LoadBalancer --port=80 --target-port=3000 -n $namespace
```
- Wait until you have an `External IP` assigned to your service:

```
watch kubectl get service timer-test -n $namespace
```

- Once you have an `External IP` for your service, use `CRTL-C` to stop the `watch` loop and proceed with the following command using the `Externam IP` address assigned to your `timer-test` service:

```
while true; do curl http://<External IP>/5000000000; echo; done
```

- As more of your colleagues start their `timer-test` programs in their respective namespaces, you will start to see why namespace-based isolation of workloads is called soft-isolation.

- Leave open all your Terminal Windows that are running the `timer-test` program. We will get back to them in a few minutes.

**Let's recap:** 
- TKGI allows for isolation of workloads in a multi-tenant environment where users such as `devops1` have `management` scope to create and manage their own K8s clusters within the limits set by the operators who set up the TKGI control plane. 
- TKGI enables the separation of responsibilities between DevOps and Ops, without the risk of allowing DevOps to overconsume resources beyond what is approved or available.
- K8s roles and rolebindings are an effective way to limit the scope of control for an individual or a group of users to specific namespaces.
- K8s namespaces share Master Nodes, Worker Nodes, and Networking, so they can expose workloads to noisy-neighbor effects. K8s has the flexibility to set CPU and Memory limits for workloads, but the sharing and utilization of resources has to be monitored carefully.

Congratulations, you have completed LAB-7.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "x" in the appropriate column.

-----------------------------------------------------
### LAB-8: A quick look at [TMC (Tanzu Mission Control)](https://players.brightcove.net/1534342432001/default_default/index.html?videoId=6074617846001) 

- VMware's Vision for Tanzu Mission Control is to enable your enterprise:
    - To Manage Any K8s Cluster on Any Public/Private IaaS
    - To Manage Many K8s Clusters across Many Public/Private IaaS
    - Where "Manage" means audit, enforce policies, create, delete, upgrade, ...
    
- VMware's Tanzu Mission Control's current release covers:
    - Attaching any K8s Cluster from any Cloud for monitoring, auditing, and enforcing policies.
    - Life-cycle management of K8s Clusters created on AWS and vSphere. Azure and GCP to follow shortly.
    
![](/images/TMC-001.png)

![](./images/lab.png)

- Let's start this lab by looking at a [short 4-minute demo of TMC](https://bcove.video/2VCXSmk)

- In order to attach your `user<#>-cluster` to Tanzu Mission Control you will need a YAML file.

- Your unique YAML file can be found in the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI). Scroll to the right and look under column R for your YAML file information.

- Please execute the following commands to focus back on your individual k8s cluster:

```
pks login -a https://api.pks.pks4u.com:9021 -p password -k -u $devops      # user the appropriate devops<#>
pks clusters
pks get-credentials $user-cluster
```
- If asked for a password, use `password`. 

- Please continue with the command you obtained from column R of the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI). The command is very similar to the one shown below:

```
# kubectl apply -f 'https://tanzupaorg.tmc.cloud.vmware.com/installer?<use your assigned code from spreadsheet>' 
```
- Once the connection has been verified the presenter will be able to demo you your cluster attached to TMC.

**Let's recap:** 
- TMC is a leap forward in simplification and breadth of control for the world of Kubernetes.
- TMC allows you to visualize in a single location all the K8s clusters your enterprise is using.
- TMC allows you to create, upgraded, delete K8s clusters on AWS, and soon on all Public IaaS.

Congratulations, you have completed LAB-8.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.


-----------------------------------------------------
### LAB-9: A quick look at [Tanzu Observability by Wavefront](https://cloud.vmware.com/tanzu-observability) 

- Observability goes beyond the scope of Tanzu Mission Control, so VMware has Tanzu Observability by Wavefront.

![](./images/from_monitoring_to_observability.png)

- Please watch this [6 minutes video](https://www.youtube.com/watch?v=nZnbdNHFNyU) to better understand Tanzu Observability by Wavefront.

![](./images/lab.png)

- In this Lab we will take a look at how easy it is to integrate TKGI with Wavefront:

- If you were following the Labs one-by-one and in sequence, you should still have three Terminal Windows up and running. Two of them should have `timer-test` running in a loop, demonstrating the difference between workload isolation by cluster vs. workload isolation by namespacing.

- Using the third Terminal Window, let's focus on your individual cluster using the `devops` username: 

```
pks login -a https://api.pks.pks4u.com:9021 -p password -k -u $devops
pks clusters    # you should only see one
pks get-credentials $user-cluster
```
- If asked for a password, use `password`. Please continue with the following commands:

```
kubectl cluster-info
helm repo add wavefront https://wavefronthq.github.io/helm/
helm repo update
kubectl create namespace wavefront
```
- For the next command you will need your individual `Helm` command which can be found under Column S of the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI).

- The command you shoud copy-&-past-&-execute should look like the example shown below:

```
# helm install wavefront wavefront/wavefront --set wavefront.url=https://surf.wavefront.com --namespace wavefront --set wavefront.token=<your-own-wavefront-token> --set clusterName=user1-cluster
```

- Now ask the workshop organizer to show your cluster data on Wavefront.


**Let's recap:** 
- Tanzu Observability by Wavefront is often referred to as *TO*.
- TO requires the execution of a simple helm chart to integrate with any K8s cluster.
- Wavefront provides a SaaS based approach to handle terabytes of data in the most cost-effective way.

Congratulations, you have completed LAB-9.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "x" in the appropriate column.


-----------------------------------------------------
### LAB-10: A quick look at [TAS (Tanzu Application Service)](https://cloud.vmware.com/tanzu-application-service) 

- Tanzu Application Service for K8s is a Platform as a Service that builds and manages secure container images while taking advantage of the power afforded by Kubernetes' orchestration of containers. 
- Developers love TAS because there are no IP addresses, no complex YAML files, no need to understand load balancing, routing, SSL certificates, or specifics of any given Public IaaS. TAS is all about getting from source code to production via a simple `cf push`.
- Operators love TAS because it is self-monitoring and self-healing. Through TAS, Ops can enforce policies, carry out updates/upgrades of O/S and middleware layers, add database and other services to the developer's marketplace, expand the environment horizontally and vertically, while maintaining high-availability. 
- TAS effectively simplifies and streamlines developer and operator tasks, enabling productivity, while enforcing security best practices and development techniques that deliver significant gains in speed to market.  

![](./images/ezgif-7-05118e39b3ee.gif)

![](./images/lab.png)

- Execute the following commands using your Ubuntu VM to eliminate all the superfluous files we used during earlier Labs:

```
cd ~/fact;  rm Dockerfile Procfile README.md; rm -rf .git; ls -ls
```
- Log into TAS (Tanzu Application Service) and `cf push` your application: 

```
cf login -a api.sys.ourpcf.com -p password --skip-ssl-validation -u $user
```
```
cf push -m 128M -b go_buildpack fact-$user
```

- Wait for the `cf push` to complete, then execute the following command.

```
curl -k https://fact-$user.apps.ourpcf.com/100; echo 
```
![](./images//wow-face.png)
- You just deployed and tested your `fact.go` code using the latest sanitized versions of all the container image layers necessary to run your App.
- Your App has an SSL encrypted URL that routes and load-balances user requests automatically to your App instance(s).
- Your App is running in the Cloud on Highly Available, self-monitoring, self-healing, multi-zone infrastructure.
- Your App has been auto-instrumented for APM (Application Performance Monitoring) and Log aggregation.

- Now let's scale your App horizontally:

```      
cf scale fact-$user -i 5
cf app fact-$user
```

- Now let's scale your App vertically. When prompted, respond with a `y`. 

```
cf scale fact-$user -m 64M
```

- Now let's map an additional (new) route to your App. Replace the `<pick-a-unique-name>` part of the command below with something creative, unique, but easy to remember:

```
cf map-route fact-$user apps.ourpcf.com --hostname <pick-a-unique-name>
```

- Let's see what routes map to your App:

```
cf app fact-$user | grep route
```

- Now let's perform a rolling deploy of a new version of `fact.go` with zero-downtime. Please open a browser page to access your `fact.go` App. You can, for example, use your newly mapped route - just remember to add a `/30` to it so you can calculate the value of `30!`. Here's an example:

![](/images/30-fact.png)

- Execute the following commands, and as you wait for them to complete, keep refreshing the browser page you just opened, so you can see the switch from v1 to v2 happening seamlessly:

```
sed -i 's/Calculating Factorial/(v2) The Factorial of/g' fact.go
cf v3-zdt-push fact-$user
```
- Now let's create a shell into one of your App containers and learn more about it:

```
cf ssh fact-$user                      # to create an ssh session into a container
```
- Execute the following commands to learn about the OS Layer in the container and validate that the user is not `root`:

```
cat /etc/*release | head -4            # to verify which version of Linux is being used
whoami                                 # to validate that you are not root
```
- Continuing to use the shell session you started with the `cf ssh` command execute the following:

```
for i in {2..50}; do kill -9 $i; done         # this will force your container to crash
```

- Now let's check the status of your App:

```
cf app fact-$user                      # to check the status of your App and all its instances
```

- Now let's check events & log aggregation. Execute the commands shown below:

```
cf events fact-$user
cf logs fact-$user --recent
```

- How easy is it to create a whole new QA or Test isolated space? Try the following commands:

```
cf create-space qa
cf target -s qa
cf apps
```
- As you can see, the QA environment you just created is ready within seconds. It's this self-service ease of use that makes developers and application teams multiple times more efficient. 

- You can point back to the original `workshop` space with the following commands:

```
cf target -s workshop
cf apps
```

- We could extend this Lab with App auto-scaling, or by using `cf bind-service` to bind your App to a database. Execute the following command to see the types of services that can be made available as self-service options to developers:

```
cf marketplace
```

- If you are developing modern Apps, Tanzu Application Service can significantly change the developer's experience.

- By delivering TAS for Kubernetes, VMware effectively automates away all the k8s complexities and guarantees the consistent creation of curated, secure container images that will run on k8s clusters on any cloud infrastructure, with the proven efficiency of a `cf push` dial-tone.

Congratulations, you have completed all the LABs in this Workshop.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.


-----------------------------------------------------
### BONUS LAB: Using Tanzu Gemfire to Turbo-Charge Access to Data in a MySQL Database

- This lab was created specifically for L Brands. It only takes 10 minutes to execute. 
- During this Lab, we will deploy a sample App that uses a MySQL DB and a GEMFIRE In-Memory-Lookaside-Cache.
- You will spin-up your own MySQL DB and GEMFIRE In-Memory-Lookaside-Cache data services.
- Please execute the commands shown below:

```
cd ~
git clone https://github.com/rm511130/pad-pcc-demo
cd pad-pcc-demo
cf login -a api.sys.ourpcf.com -p password --skip-ssl-validation -u $user
```
- Let's create the MySQL DB:

```
cf create-service p.mysql db-small mysql-dev
```
- Let's create a GEMFIRE In-Memory-Data-Grid:

```
cf create-service p-cloudcache dev-plan dev-cluster
```

- Let's take a look at the `manifest.yml` file that the `cf push` command is going to use. We'll alter the `manifest.yml` file to make sure you will create a unique application URL. Please execute the following commands:

```
sed -i 's/random-route: false/random-route: true/g' manifest.yml
cat manifest.yml
```

- Now wait ~5 minutes until both services have been created. You can check their status by running the following command:

```
cf services
```
![](./images/peril.png)

- Once both services are up and running, proceed with the following command. Please make sure that both services are indeed in a `create succeeded` state before proceeding.

```
cf push
```

- Once the `cf push` command has deployed your App, execute the following commands to get some environment information about your GEMFIRE In-Memory-Data-Grid:

```
cf env pcc-lookaside-cache | grep 'gfsh_login_string'
gfsh
```

- Now use the output from the command above to connect to your Gemfire In-Memory-Data-Grid. We're doing this because we need to execute a small set-up step in Gemfire. Your command should look like the example shown below (but make sure to use your `connect...` command obtained above. All the `key-store`, `trust-store`, etc... prompts just need a simple click on `<Enter>`.
```
gfsh>connect --url=https://cloudcache-156605a4-e3e0-4d54-bef2-c4c670f274da.sys.ourpcf.com/gemfire/v1 --user=cluster_operator_1kSTN0824VHzFgZSY09F5Q --password=idyqhr1kFdopn8NQX1nSg --skip-ssl-validation
key-store: <just hit enter>
key-store-password: <just hit enter>
key-store-type(default: JKS): <just hit enter>
trust-store: <just hit enter>
trust-store-password: <just hit enter>
trust-store-type(default: JKS): <just hit enter>
ssl-ciphers(default: any): <just hit enter>
ssl-protocols(default: any): <just hit enter>
ssl-enabled-components(default: all): <just hit enter>
Successfully connected to: GemFire Manager HTTP service @ https://cloudcache-156605a4-e3e0-4d54-bef2-c4c670f274da.sys.ourpcf.com/gemfire/v1
```

- Let's create a `customer` table in Gemfire. In Gemfire lingo, tables are called `regions`. Execute the commands shown below:

```
Cluster-0 gfsh> create region --name=customer --type=REPLICATE
Cluster-0 gfsh> exit
```

- Great, now we should be able to test the Demo PCC-Lookaside-App you `cf pushed`. Execute the following command to get your App's URL and then open a browser using the URL:

```
cf app pcc-lookaside-cache | grep route 
```

- Now, follow the example shown below to test the PCC-Lookaside-App:

![](./images/pcc.png)

- Let's clean-up once you have experimented with your PCC-Lookaside-App. Please execute the following commands:

```
cf delete pcc-lookaside-cache
cf delete-service dev-cluster
cf delete-service mysql-dev
```

**Let's recap:** 
- You created an in-memory data-grid and a mySQL DB using simple on-line commands.
      ```
      cf create-service p.mysql db-small mysql-dev
      cf create-service p-cloudcache dev-plan dev-cluster
      ```
- You deployed an app to TAS (Tanzu Application Service) using a simple: `cf push`
- Your App was bound to the data services listed inside a `manifest.yml` file.
- You tested the App and saw that the lookaside-cache can speed up access to data in a MySQL DB.
- You cleaned-up with 3 simple commands.
- You didn't have to open any support tickets with networking, infrastructure or operations to get all of this done.

![](./images//wow-face.png)

Congratulations, you have completed the bonus Lab!

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.


------------------------
## Wrapping-up

We covered a lot of ground today. Lots of new concepts and hopefully lots of valuable learning opportunities. We've only scratched the surface. VMware has a robust set of services and documented best practices to help you get started with greenfield projects and/or brownfield modernizations from old architectures to modern cloud native solutions.

Thank you for your time and attention. Please take 30 seconds to provide us some [feedback](https://forms.gle/AQU3Ky3bfduB2c7y6).



-----------------------------------------------------
## Running Chess w/o the Chess Service being exposed to the outside

```
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
kubectl run chess --image=rmeira/chess --port=80
kubectl expose deployment chess --port=80 --target-port=80 --name=chess --type=NodePort
kubectl get service chess
```
```
NAME    TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
chess   NodePort   10.100.200.234   <none>        80:31567/TCP   3s
```
```
kubectl run fact --image=rmeira/fact
kubectl expose deployment fact --name=fact --port=80 --type=NodePort
```        
     
- Create nginx ingress controller // don't do this step if it has already been done
```
kubectl create ns ingress
helm install nginx-ingress stable/nginx-ingress --set rbac.create=true --namespace ingress --set controller.config.proxy-buffer-size=16k
```

```
kubectl --namespace ingress get services -o wide nginx-ingress-controller
```
```
NAME                       TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)                      AGE   SELECTOR
nginx-ingress-controller   LoadBalancer   10.100.200.247   35.231.44.137   80:30978/TCP,443:30779/TCP   89s   app.kubernetes.io/component=controller,app=nginx-ingress,release=nginx-ingress
```

- Add 35.231.44.137 in the DNS as nginx.pks4u.com  --> try it http://nginx.pks4u.com

- vi my-first-ingress-4-chess.yml

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    kubernetes.io/ingress.class: nginx
  name: workshop-ingress
  namespace: default
spec:
  backend:
    serviceName: other
    servicePort: 8080
  rules:
    - host: nginx.pks4u.com
      http:
        paths:
          - backend:
              serviceName: chess
              servicePort: 80
            path: /
    - host: nginx.pks4u.com
      http:
        paths:
          - backend:
              serviceName: fact
              servicePort: 80
            path: /fact       
```

```
kubectl apply -f my-first-ingress-4-chess.yml
kubectl get ingress 
```

- Now try http://nginx.pks4u.com  and you should see the chess board


## Having some fun

```
kubectl get all
kubectl get all --all-namespaces
kubectl api-resources
kubectl api-resources --verbs=list -o name | xargs -n 1 kubectl get -o name --all-namespaces
```





