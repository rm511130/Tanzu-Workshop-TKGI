![](./images//vmware-logo.png)

# VMware Tanzu PKS Workshop - Enterprise Kubernetes 
------------------------------------------------------------
## Workshop Agenda
(1:00PM to 5:00PM on 03/19/2020)

- Introduction
     - Workshop Description and Orientation
     - VMware Tanzu Portfolio of Products 
- Platform Architecture 
     - Installation Overview
     - Operations Manager
     - Tile Installation
     - Client Tools
- Demo & Hands-on PKS Labs on the cloud
     - Operator Experience
     - Developer Experience
     - Observability & Management Tools
     - Contrasting with Tanzu Application Service
- Next Steps
-----------------------------------------------------
## Technical Pre-Requisites
- You should be able to access:

    - https://zoom.us/test
    - https://solar-system.cfapps.io
    - [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI)

### If using a Windows PC
- You will need to use [PuTTY](./PuTTY_and_SSH.md) to access a Ubuntu VM (public IP address) using a `.ppk` private-key file.
- To download [`fuse.ppk`](./fuse.ppk) you can install and use [wget](http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-setup.exe) in a PowerShell window.
```
help wget
cd ~\Downloads
wget https://raw.githubusercontent.com/rm511130/Tanzu-Workshop-PKS/master/fuse.ppk -Outfile fuse.ppk
```
- If you rather not install [wget](http://gnuwin32.sourceforge.net/packages/wget.htm), you can simply click on [`fuse.ppk`](./fuse.ppk) then cut-&-paste its contents to a local file in your Windows machine. The file must be named `fuse.ppk` and set to read-only mode.
- If you need help installing or using PuTTY with [fuse.ppk](./fuse.ppk) check these [detailed instructions](./PuTTY_and_SSH.md).
- If you successfully tested the access to the `ubuntu@user1.pks4u.com` VM, you are ready for the workshop.

### If using a Mac 
- You will need to SSH into a Ubuntu VM (public IP address) using a private-key `.pem` file
- Using a Terminal Window, execute the following commands to download `fuse.pem` and set the downloaded file to read-only mode:
```
cd ~/Downloads
wget https://raw.githubusercontent.com/rm511130/Tanzu-Workshop-PKS/master/fuse.pem
chmod 400 ~/Downloads/fuse.pem
```
- You can now test whether SSH is working with the `fuse.pem` private key using the following command:
```
ssh -i ~/Downloads/fuse.pem ubuntu@user1.pks4u.com
```
- Please `exit` from the Ubuntu VM if your test was successful. You are ready for the workshop.


-----------------------------------------------------

## Guidelines for this Workshop
- This workshop includes presentations, demos and hands-on labs. 
- The labs are interdependent and must be executed in order.
- Please use the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) to claim a userID for this workshop. For example, Ralph Meira is user1.
- Update the same [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) as you progress through the Labs, by placing an "x" in the appropriate column.
- When carrying out hands-on labs, you can cut-&-paste the commands shown `in boxes like this one`. However, when issuing commands, please make sure to alter the userID to match the one you have claimed, e.g.:
  - `ssh -i fuse.pem ubuntu@user3.pks4u.com` is for `user3` 
  - `ssh -i fuse.pem ubuntu@user15.pks4u.com` is for `user15`
- Each workshop participant will be assigned a Ubuntu VM previously set up for the execution of hands-on Labs. Your Laptop or Desktop will only be used for two purposes: 
     - SSH'ing into the Ubuntu VM 
     - Browsing web pages
- Throughout this document, when it's time for hands-on labs, you will see the following icon:
     
![](./images/lab.png)

-----------------------------------------------------
## A Brief Introduction - VMWare Tanzu

[VMware Tanzu](https://drive.google.com/open?id=1Sneqdq-ItQ3RI5vlgKxixNxeA5frPuVs)

- Enterprises rely on software to improve business outcomes.
- A critical factor: the *velocity* of how ideas are converted to new features, new apps, and new services.
- The ever-accelerating pace of change generates a daunting backlog of work for IT leaders.
- Everyone is under pressure to reduce technology spend and address security vulnerabilities where perimeters encompass mobile, public and private infrastructure.
- The competing mandates - velocity, security, and operational efficiency - force enterprises to re-evaluate how they develop, architect, and operate software. 


-----------------------------------------------------

## Architecture, Installation & Set-up 

- The videos in this section are great for brushing up on your understanding of the technologies we will be working with during this workshop. 

- If you are comfortable with Containers, Docker and Kubernetes, then please move ahead to Lab-1.

- [Containers vs. VMs 101 in 8 minutes](https://www.youtube.com/watch?v=L1ie8negCjc)

- [Containers - Deep Dive in 18 minutes](https://www.youtube.com/watch?v=EnJ7qX9fkcU)

- [Kubernetes 101 in 5 minutes](https://www.youtube.com/watch?v=PH-2FfFD2PU)

- [PKS on vSphere, AWS, Azure, and/or GCP](https://docs.pivotal.io/pks/1-6/installing.html)


-----------------------------------------------------

### LAB-1: SSH into your Linux Workshop VM environment & test the Command Line Interface tools

- Let's start by logging into the Workshop environment from your machine (Mac, PC, Laptop, Desktop, Terminal, VDI). You will need to use the following private key: 
   - [fuse.pem](./fuse.pem) if using a Mac.
   - [fuse.ppk](./fuse.ppk) if using a Windows PC.

- Note that the examples shown below apply to `user1`. If, for example, you are `user11`, your Ubuntu VM will be at `user11.pks4u.com`.

![](./images/lab.png)

- In the pre-requisites section of this workshop, you were asked to use `ssh` or `PuTTY` to access the Ubuntu VM that has been assigned to your [UserID](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI). Please go ahead and create a Terminal Session into your VM. The example shown below applies to `user1` if he or she had downloaded the `fuse.pem` key to a Mac. If you need, the `PuTTY` instructions for Windows PC users can be found [here](./PuTTY_and_SSH.md).

```
ssh -i ~/Downloads/fuse.pem ubuntu@user1.pks4u.com
```

- Once logged in, you can ignore any messages that ask you to perform a `do-release-upgrade`. Please proceed by executing the following commands:

```
pks --version
kubectl version -o json # If you see a connection refused message, don't worry, it is expected and not a problem
cf --version
git version
docker --version
go version
jq --version
python3 --version
helm version
```

- If any of the commands shown above did not work or produced and error, please alert the workshop organizers.

Congratulations, you have completed LAB-1.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-2: Running a simple GoLang Program Locally (on your Ubuntu VM)

- Using your Ubuntu VM you are going to take this [Factorial GoLang Program](https://github.com/rm511130/fact/blob/master/fact.go) and run it locally.

![](./images/lab.png)

- Execute the following commands:

```
cd ~ 
git clone https://github.com/rm511130/fact  
cd ~/fact  
go run fact.go 
```

- Leave the code running and use a browser to access the following URL. Remember to use the proper FQDN that corresponds to your UserID: e.g. `user20` should use `http://user20.pks4u.com`.
```
http://user1.pks4u.com:3000/1500
``` 

- Did it work?
  - Take a look at the [code](https://github.com/rm511130/fact/blob/master/fact.go). 
  - Did you find in the code the additional endpoints that you can call?
     - `http://user1.pks4u.com:3000/version` 
     - `http://user1.pks4u.com:3000/header`
  - Did you see the logs on the Terminal Window of your VM?

- Use `CTRL-C` to cancel out of the `go run fact.go` command.

**Let's recap:** 
- Your Linux VM is able to run GoLang programs. 
- Your Linux VM has a public IP address.
- The code you executed provided an http interface accessible using a browser.
- A developer typically starts by writing his/her code locally. It's when he/she pushes the code to a server that differences in configuration and dependencies can lead to the famous "...but it worked on my machine..." comments. We will see how Docker Images can help in this area.

- Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

Congratulations, you have completed LAB-2. 

-----------------------------------------------------
### LAB-3: Building a Docker Image

![](./images/lab.png)

- Using your Ubuntu VM let's take a look at the `Dockerfile` in the `~/fact` directory. 

```
cat ~/fact/Dockerfile
```

- Execute the following commands to start with a clean slate and build a Docker Image of your GoLang factorial program:

```
docker system prune -a      # answer y 
cd ~/fact
docker build -t fact .      # the dot is important 
docker run -d --publish 3000:3000 --name fact --rm fact
curl http://user1.pks4u.com:3000/5; echo
```

- Did you notice in the build logs how many layers were used to create the Docker Image of your GoLang factorial program? 
- Execute the following commands, one-by-one, to learn more about your Docker Image. Pay attention to the layers and how recent they are:

```
docker image inspect fact
docker history fact
docker ps
```

- Now let's open an interactive bash shell on your container:

```
docker exec -it fact bash
```
 - You should see a prompt that looks something like this: `root@627ac94efaa7:/go/src/app#`
 - Let's keep working inside your container.
 - Execute the following commands:
 
 ```
 curl http://127.0.0.1:3000/5; echo
 cat /etc/*release
 whoami
 exit
 ```
 - What release of the OS was used?
 - What was the answer to the "whoami" command?
 
**Let's recap:** 
- You built and executed a Docker Image on your Ubuntu VM using essentially the same files you had during Lab-1.
- Using the various commands on your Ubuntu VM and on a Docker container you were able to see that many layers (and software versions) were assembled together on your behalf as a result of the `docker build` command.
- Now that you have a working, local container image of your `fact` program, as a developer, you should feel reassured that your App will work when pushed to a server. This is one of the main reasons for the success of Docker Images among developers.

Congratulations, you have completed LAB-3.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-4: Connecting to PKS API and Resizing a Kubernetes Cluster

- The creation of a Kubernetes Cluster takes some time, so we created a Kubernetes Cluster for you in preparation for this workshop. The command used was:

```
# pks create-cluster user1-cluster -e example.hostname --plan small --num-nodes 1  # do not execute
```

![](./images/bosh_pks_k8s_on_public_cloud.png)

![](./images/lab.png)

- During this lab you are going to assume the role of a Platform DevOps person.
- Execute the following commands to log into the PKS Control Plane. 
- Please make sure to use the correct `-u devops<#>` aligned to your UserID.

```
pks login -a https://api.pks.pks4u.com:9021 -p password -k -u devops1
pks clusters
pks plans
```
- Let's get more detailed information about your cluster.
- Please make sure to use the correct `user<#>-cluster` aligned to your User ID.

```
pks cluster user1-cluster
rm ~/.kube/config
pks get-credentials user1-cluster
kubectl cluster-info
kubectl get all --all-namespaces
```

- If kubectl auto-completion is not switched-on for your Ubuntu VM, you can execute the following commands to activate it:
```
echo "source <(kubectl completion bash)" >> ~/.bashrc
exit
# and log back into your Ubuntu VM using PuTTY or SSH 
```

- Let's scale your cluster horizontally by adding an additional K8s worker node:

```
pks resize user1-cluster --num-nodes 2
```

- Use the following command to monitor the growth of your cluster:

```
pks cluster user1-cluster
```

- You should see output similar to the example below:

```
PKS Version:              1.6.1-build.6
Name:                     user1-cluster
K8s Version:              1.15.5
Plan Name:                small
UUID:                     1210f5d8-c292-4f22-a0d8-0147b87b4ed0
Last Action:              UPDATE
Last Action State:        in progress
Last Action Description:  Instance update in progress
Kubernetes Master Host:   user1-cluster-k8s.pks4u.com
Kubernetes Master Port:   8443
Worker Nodes:             2
Kubernetes Master IP(s):  10.0.11.10
Network Profile Name:     
```
- Note in the output shown above the line that indicates the active resizing of your cluster:

```
Last Action State:        in progress
```
- You don't need to wait while the expansion of the worker nodes is progressing. Let's proceed with the next steps.

- Had we wished to scale the cluster vertically, we would have followed the instructions found [here](https://docs.pivotal.io/pks/1-6/scale-clusters.html). Changing the `plan` of how clusters are built is an PKS Operator function.

**Let's recap:** 
- You logged into the PKS Control Plane as a DevOps user, and scaled an existing cluster.
- Even though you are a DevOps user, you did not see any other K8s Clusters. You are an isolated tenant of the PKS platform.
- You executed a few `kubectl` commands against your cluster as a DevOps PKS Manager.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

Congratulations, you have completed LAB-4.

-----------------------------------------------------
### LAB-5: Deploying an App on Kubernetes

- A Docker Image identical to the one you created during Lab-3 has been tagged and uploaded into the Public Docker Hub as [rmeira/fact](https://hub.docker.com/repository/docker/rmeira/fact). The short documentation found at [rmeira/fact](https://hub.docker.com/repository/docker/rmeira/fact) contains the steps taken to tag and upload a Docker Image into the Public Docker Hub. 
- Let's use the [rmeira/fact](https://hub.docker.com/repository/docker/rmeira/fact) image to run the Factorial program on your Kubernetes cluster.

![](./images/lab.png)

- Execute the following commands:

```
kubectl create deployment fact --image=rmeira/fact
kubectl get all
kubectl expose deployment fact --type=LoadBalancer --port=80 --target-port=3000
```
- It takes a minute to create a load balancer and to expose a K8s service, so let's first test if the pods are running the `rmeira/fact` container image:

```
pod_name=$(kubectl get pods | grep fact | awk '{ print $1 }'); echo $pod_name
kubectl exec -t -i $pod_name bash
```

- The `kubectl exec` command opens a terminal session on a container that is running the `fact` Docker Image in your cluster. You should see a prompt similar to the example: `root@factorial:/go/src/app#`

- Continue with the following commands to test whether the `fact` program is running:

```
curl 127.0.0.1:3000/40; echo
exit
```
- Back to the command prompt on your Ubuntu VM. Let's check whether your service has been assigned a load balancer External-IP address, and whether the `pks resize user1 --num-nodes 2` command from the previous lab has completed successfully.

```
kubectl get service
pks cluster user1-cluster
```
- Execute the commands above every 30 seconds until you see:
   - an `External IP` show up for the `fact` service
   - a `Last Action State: succeeded` and `Worker Nodes: 2`
   
- Using the `External IP` address you see when executing `kubectl get service` execute the following command:

```
curl http://<External-IP>/10; echo
```
- You should see the results of the `10!` calculation.

**Let's recap:** 
- You deployed the `rmeira/fact` image from Docker Hub to your K8s cluster and used a `bash` session to test the deployment.
- Kubernetes fetches images from a registry. We will see in the next Lab how to use Harbor, an Enterprise ready registry.
- You exposed the `fact` deployment as a service available on the Internet.
- You did not get a secured URL accessible from the Internet, but anyone with access to your `External IP` address is able to run your `fact` program.
- If you did wish to secure your `fact` program with TLS and a Let's Encrypt (CA) Certificate, you would need to follow these [instructions](https://docs.bitnami.com/kubernetes/how-to/secure-kubernetes-services-with-ingress-tls-letsencrypt/).

Congratulations, you have deployed an App on K8s and completed LAB-5.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-6: Using Harbor, Clair and Notary

- Let's see how Harbor, Clair and Notary enhance the Ops and Devs experience.

![](./images/harbor.png)

![](./images/lab.png)

- Harbor was installed next to PKS in Ops Manager, and `user1`, `user2`, ... were created with password: `Password1`.

- Log into Harbor using a browser: `https://harbor.pks4u.com/`

- Now follow the example below, clicking where the yellow arrows are pointing, so you can get an idea of how Harbor works. Your userID has been given administrator privileges, so please be careful not to change Harbor's configuration.

![](./images/harbor-walk-through.png)

- Keep Harbor open. You will come back to it in a few minutes.

- Let's log into Harbor from your Ubuntu VM. Execute the following commands:

```
docker login -u user1 -p Password1 harbor.pks4u.com
docker images
docker tag fact harbor.pks4u.com/library/user1-fact:latest
docker images
docker push harbor.pks4u.com/library/user1-fact:latest
```
- Now look for your program in the Harbor browser session you were asked to leave open.

- How many CVEs is your `fact` program exposed to?

- Now execute the following commands on your Ubuntu VM:

```
docker pull harbor.pks4u.com/library/user1-fact:latest
```

- The message you received back is a reflection of Harbor's configuration. Note that the image you pushed to Harbor is also not signed. We can set Harbor's configuration to prevent unsigned images from being pulled as well.

- Execute the following command:

```
docker pull harbor.pks4u.com/library/chess-cf:1.0
```
- This image should have downloaded without problems because it does not expose you to any critical CVEs


Congratulations, you have completed LAB-6.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.


-----------------------------------------------------
### LAB-7: Scaling an App on Kubernetes

- Now let's scale up and down the number of pods running the `fact` docker image.

![](./images/lab.png)

- For this Lab you will need to open 3 (three) terminal windows that access your Ubuntu VM. Please arrange them side by side, per the example below, keeping all simultaneously visible on your screen. 
- If using PuTTY, you can right-click on the top border of your existing terminal window and use the "Duplicate Session" option. 
- If using a Mac, you can open more terminal windows using ⌘ N, command-N.

![](./images/3-terminals-start.png)

- Let's denominate as Terminal Window #1 the long, narrower terminal window on the right-side of your screen. 
- Using Terminal Window #1, execute the following command using the `External IP` from the previous lab.
```
while true; do curl http://35.227.49.80/10; echo; done;
```
- Let's denominate as Terminal Window #2 the top, wider terminal window on the left-side of your screen.
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
- Note in the output shown above that under `NODE` we see two unique VM identifiers. That is to be expected given that you resized your K8s cluster to two worker nodes during Lab-4.

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

- Delete and recreate, using `fact-deployment-with-readiness-probe.yml`, your `fact` deployment with the following commands:

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
- The `rmeira/fact` image deployed with the `kubectl create deployment fact --image=rmeira/fact` command had to be amended with a `livenessProbe` and a `readinessProbe` to reduce the impact of scaling horizontally the number of running pods. 
- Kubernetes developers need to understand their environment quite well from a DevOps perspective when developing more complex, microservices based, distributed systems. Order Entry systems, for example, can't afford to suffer from hiccups when the platform is auto-scaling to handle increases in demand.
- For the more advanced users, you may wish to experiment with scaling the K8s cluster using the `pks resize <cluster-name> --num-nodes <#>` command while deploying and scaling the `fact` app. Additional commands such as `kubectl drain <node>` and `kubectl uncordon <node>` also demonstrate the power K8s puts at your fingertips for draining workloads from nodes.
- Advanced workload placement and management using K8s clusters can be a fun area to [explore](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/).

Congratulations, you have completed LAB-7.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "X" in the appropriate column.

-----------------------------------------------------
### LAB-8: PKS Soft vs. Hard Tenancy

![](./images/lab.png)

- We have to be extra-cautious during this Lab because it can be destructive depending on the username you employ.
- Let's make sure you are using the correct `-u devops<#>` aligned to the UserID you claimed at the beginning of this workshop.

```
pks login -a https://api.pks.pks4u.com:9021 -u devops1 -p password -k
pks clusters
pks get-credentials user1-cluster
```
- Your `devops<#>` user is only allowed to see and managed the K8s clusters that it created, and it's also limited to only creating K8s clusters within the sizing limits and machine types defined by the PKS Administrator.

- Try to resize your `user<#>-cluster` to 10 worker nodes, and then try to delete (*not yours, but*) a colleague's cluster:
```
pks resize user1-cluster --num-nodes 10
pks delete-cluster user2-cluster   # make sure you know what you are doing before proceeding with this step
```

- As you can see PKS Administrators have placed guardrails that kept you from making your K8s cluster too big, or from deleting a cluster that was not yours.

- Let's deploy a new App to your `user<#>-cluster`:

```
kubectl create deployment timer-test --image=rmeira/timer-test
kubectl expose deployment timer-test --type=LoadBalancer --port=80 --target-port=3000
```
- Execute the command below until you see an `External IP` address assigned to your service:

```
kubectl get service timer-test
```

- Using the `External IP` address, execute the following command and leave it running.

```
while true; do curl http://<External-IP>/5000000000; echo; done
```
- Go back from time to time to this Terminal Window to see how your `timer-test` is responding. 
- Check with other colleagues, that are also part of this workshop, whether they have started their `timer-test`.
- We will come back to it in a little while.

- Now to the dangerous part of this Lab. Using a second Terminal Window, execute the following command to become a PKS Administrator:

```
pks login -a https://api.pks.pks4u.com:9021 -u pks_admin -p password -k
```
- Now take a look at your scope of control by executing the following command:
```
pks clusters
```
- When logged-in with the scope of a PKS Administrator, you can see and manage all K8s Clusters created via the PKS Control Plane. Please make sure not to delete or resize any clusters.

- Note that we have a `shared-cluster` that has not been used by anyone yet. Let's execute the following commands to initiate a `timer-test` in the `shared-cluster` within a Namespace that is unique to you. Make sure to use a namespace name that uses your UserID:

```
pks get-credentials shared-cluster
kubectl cluster-info
kubectl create namespace namespace<your-UserId>.     # these commands will fail if you do not correct the namespace name
kubectl create deployment timer-test --image=rmeira/timer-test -n namespace<your-UserID>
kubectl expose deployment timer-test --type=LoadBalancer --port=80 --target-port=3000 -n namespace<your-UserID>
```
- Wait until you have an `External IP` assigned to your service:

```
kubectl get service timer-test -n namespace<your-UserID>
```

- Once you have an `External IP` for your service in the correct namespace, proceed with the following commands:

```
while true; do curl http://<External IP>/5000000000; echo; done
```

- As more of your colleagues start their `timer-test` programs in their respective namespaces, you should see that namespace isolation of workloads is called soft-isolation for a reason.

- Leave your Terminal Window open running your `timer-test` program. You can check whether other `timer-test` programs are running by executing the following command on the Terminal Window that is not busy running `timer-test`:

```
kubectl get pods --all-namespaces | grep timer
```
- Leave the Terminal Windows running. We will get back to them in a few minutes.

**Let's recap:** 
- PKS allows for isolation of workloads in a multi-tenant environment where users with `management` scope can create and manage their own K8s clusters within the limits set by the operators who set up the PKS control plane. 
- PKS enables the separation of responsibilities without the risk of overconsuming resources beyond what is approved or available.

Congratulations, you have completed LAB-8.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "x" in the appropriate column.

-----------------------------------------------------
### LAB-9: A quick look at [TMC (Tanzu Mission Control)](https://players.brightcove.net/1534342432001/default_default/index.html?videoId=6074617846001) 

- VMware's Vision for Tanzu Mission Control is to enable your enterprise:
    - To Manage Any K8s Cluster on Any Public/Private IaaS
    - To Manage Many K8s Clusters across Many Public/Private IaaS
    - Where "Manage" means audit, enforce policies, create, delete, upgrade, ...
    
- VMware's Tanzu Mission Control v1.0 is Generally Available with an initial implementation that covers:
    - Attaching any K8s Cluster from any Cloud for monitoring, auditing, and enforcing policies.
    - Life-cycle management of K8s Clusters created on AWS and vSphere. Azure and GCP to follow shortly.
    
![](/images/TMC-001.png)

![](./images/lab.png)

- Let's start this lab by looking at a [short 4-minute demo of TMC](https://bcove.video/2VCXSmk)

- In order to attach your `user<#>-cluster` to Tanzu Mission Control you will need a YAML file to complete the following command line `kubectl apply -f`. Ask the workshop organizer for your unique YAML file.

- The command you will execute will look something like this:

```
kubectl apply -f 'https://tanzupaorg.tmc.cloud.vmware.com/installer?84f9abcdef4c98'
```

- Once the connection has been verified the presenter will be able to demo you your cluster attached to TMC.

**Let's recap:** 
- TMC is a leap forward in simplification and breadth of control for the world of Kubernetes.
- TMC allows you to visualize in a single location all the K8s clusters your enterprise is using.
- TMC allows you to create, upgraded, delete K8s clusters on AWS, and soon on all Public IaaS.

Congratulations, you have completed LAB-9.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "x" in the appropriate column.


-----------------------------------------------------
### LAB-10: A quick look at [Tanzu Observability by Wavefront](https://cloud.vmware.com/tanzu-observability) 

- Observability goes beyond the scope of Tanzu Mission Control, so VMware has Tanzu Observability by Wavefront.

- Please watch this [6 minutes video](https://www.youtube.com/watch?v=nZnbdNHFNyU) to better understand Tanzu Observability by Wavefront.

![](./images/lab.png)

- In this Lab we will take a look at how easy it is to integrate PKS with Wavefront:

- If you were following the Labs one-by-one and in sequence, you should have three Terminal Windows up and running. Two of them should have `timer-test` running in a loop, demonstrating the difference between workload isolation by cluster vs. workload isolation by namespacing.

- Using the third Terminal Window, let's go back to your `user<#>-cluster` as the `devops<#>` user - both aligned to your UserID.

```
pks login -a https://api.pks.pks4u.com:9021 -u devops1 -p password -k
pks clusters    # you should only see one
pks get-credentials user1-cluster
kubectl cluster-info
helm repo add wavefront https://wavefronthq.github.io/helm/
helm repo update
kubectl create namespace wavefront
```
- Ask the workshop organizers for your `wavefront.token` and use it in the command shown below:

```
helm install wavefront wavefront/wavefront --set wavefront.url=https://surf.wavefront.com --set wavefront.token=caa821fa-f2e5-4524-9374-19667f830f00 --set clusterName=user1-cluster --namespace wavefront
```

- Now ask the workshop organizer to show your cluster data on Wavefront.


**Let's recap:** 
- Tanzu Observability by Wavefront is often refered to as *TO*.
- TO requires the execution of a simple helm chart to integrate with any K8s cluster.
- Wavefront provides a SaaS based approach to handle terabytes of data in the most cost-effective way.

Congratulations, you have completed LAB-10.

Please update the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) with an "x" in the appropriate column.


-----------------------------------------------------
### Bonus-LAB: A quick look at [TAS (Tanzu Application Service)](https://cloud.vmware.com/tanzu-application-service) 

- Tanzu Application Service for K8s is a Platform as a Service solution that takes advantage of the power afforded by Kubernetes, while keeping to the simplicity of a `cf push`. 
- No IP addresses, no complex YAML files, TAS effectively simplifies and streamlines developer tasks, enabling productivity, while enforcing security best practices and development techniques that deliver significant gains in speed to market.  

![](./images/ezgif-7-05118e39b3ee.gif)

![](./images/lab.png)

- Execute the following commands from your Ubuntu VM to eliminate all the superfluous files:

```
cd ~/fact
rm Dockerfile Procfile README.md .git
ls -las
```
- Log into TAS (Tanzu Application Service) and `cf push` your application making sure to use a unique name based on your UserID: 

```
cf login -a api.run.pivotal.io -u rmeira@pivotal.io
cf push fact-user1 -m 128M -b go_buildpack
```

- Wait for the `cf push` to complete and grab the URL next `routes:`, then execute the following commands:

```
curl https://fact-user1.cfapps.io/100; echo 
```

- You just deployed and tested your App using the latest sanitized versions of all the docker image layers necessary to run your App.
- Your App has an SSL encrypted human-readable URL that routes user requests automatically to your App.
- Your App is running in the Cloud on Highly Available infrastructure.
- Your App has been instrumented for APM (Application Performance Monitoring) and Log aggregation.
- Now let's scale your App horizontally and then vertically:

```      
cf scale fact-user1 -i 5
cf app fact-user1
cf scale fact-user1 -m 64M
cf app fact-user1
```
- Now let's create a shell into one of your App containers and let's make it crash on-purpose:

```
cf ssh fact-user1                      # to create an ssh session into a container
cat /etc/*release | head -4            # to verify which version of Linux is being used
whoami                                 # to validate that you are not root
```
- Continuing to use the shell session you started with the `cf ssh` command execute the following:

```
for i in {2..50}; do kill -9 $i; done         # to force your container to crash
```

- Now let's check the status of your App:

```
cf app fact-user1                      # to check the status of your App and all its instances
```

- Now let's check log aggregation. Execute the command shown below and open a browser to access your App's URL `https://fact-user1.cfapps.io`

```
cf logs fact-user1
```

- We could extend this Lab with App auto-scaling, or by using `cf bind-service` to bind your App to a database, but I think we've made the point that, if you are developing modern Apps, there's already a Tanzu Application Service PaaS available to help you significantly change your developer's experience.


Congratulations, you have completed all the LABs in this Workshop.

------------------------
#Wrapping-up

We covered a lot of ground today. Lots of new concepts and hopefully lots of valuable learning opportunities. We've only scratched the surface. VMware has a robust set of services and documented best practices to help you get started with greenfield projects and/or brownfield modernizations from old architectures to modern cloud native solutions.

Thank you for your time and attention. We look forward to next steps.
