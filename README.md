##### https://tinyurl.com/PKS4LBRANDS

![](./images//Pivotal.png)

# VMware PKS Workshop - Enterprise Kubernetes 
------------------------------------------------------------
## Workshop Agenda
(1:00PM to 5:00PM on 03/19/2020)

- Introduction
     - Orientation & Workshop Description
-  PKS Installation Steps Overview
     - Operations Manager
     - Tile(s) Installation
     - Client Tools
- Demo & Hands-on Labs on GCP and Azure
     - Developer Experience
        - Deploying Apps using PKS & TAS
     - Day 2 Operations
        - Scaling
        - Health Monitoring
        - Patching
        - Upgrading
- Next Steps
-----------------------------------------------------
## Technical Pre-Requisites
- Your Mac or Windows PC should be able to access:
    - https://chess.cfapps.io
    - [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI)

### If using a  Mac 
- You will need to SSH into a Ubuntu VM (public IP address) using a private-key `.pem` file
- Please open a Terminal Window and execute the following commands to download `fuse.pem` and set the downloaded file to read-only mode:
```
cd ~/Downloads
wget https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.pem
chmod 400 ~/Downloads/fuse.pem
```
- You can now test whether SSH is working with the `fuse.pem` private key using the following command:
```
ssh -i ~/Downloads/fuse.pem ubuntu@user1.pks4u.com
```
- Please `exit` from the Ubuntu VM if your test was successful. You are ready for the workshop.
  
### If using a Windows PC
- You will need to use PuTTY to access a Ubuntu VM (public IP address) using a `.ppk` private-key file.
- To download [`fuse.ppk`](https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.ppk) you can install and use [wget](http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-setup.exe) in a PowerShell window.
```
help wget
cd ~\Downloads
wget https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.ppk -Outfile fuse.ppk
```
- If you rather not install [wget](http://gnuwin32.sourceforge.net/packages/wget.htm), you can simply click on [`fuse.ppk`](https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.ppk) then cut-&-paste its contents to a local file in your Windows machine. The file must be named `fuse.ppk` and set to read-only mode.
- If you need help installing or using PuTTY with [fuse.ppk](https://raw.github.com/rm511130/LBRANDS/blob/master/fuse.ppk) check these [detailed instructions](https://github.com/rm511130/LBRANDS/blob/master/PuTTY_and_SSH.md).
- If you successfully tested the access to the `ubuntu@user1.pks4u.com` VM, you are ready for the workshop.
