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
- A Mac or PC with internet connection, running a browser that can access https://chess.cfapps.io
- Ability to access and update this [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI)

### If using a Mac
- You will need to SSH into a Ubuntu VM (public IP address) using a private-key `.pem` file
- Please execute the following commands to download `fuse.pem` and set the file to read-only:
```
cd ~/Downloads
wget https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.pem`
chmod 400 ~/Downloads/fuse.pem
```
- You can now test whether SSH is working with the `fuse.pem` private key using the following command:
```
ssh -i ~/Downloads/fuse.pem ubuntu@test.pks4u.com
```
  
### If using a Windows PC
- You will need to use PuTTY to access a Ubuntu VM (public IP address) using a private-key `.ppk` file
- To download [`fuse.ppk`](https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.ppk) you can install and use [wget](http://gnuwin32.sourceforge.net/packages/wget.htm) within a PowerShell window:
```
help wget
cd ~\Downloads
wget https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.ppk -Outfile fuse.ppk
```
- If you rather not install [wget](http://gnuwin32.sourceforge.net/packages/wget.htm), you can simply click on [`fuse.ppk`](https://raw.githubusercontent.com/rm511130/LBRANDS/master/fuse.ppk) then cut-&-paste its contents to a local file in your Windows machine. The file must be named `fuse.ppk` and set to read-only mode.
- If you need help installing or using PuTTY with [fuse.ppk](https://raw.github.com/rm511130/LBRANDS/blob/master/fuse.ppk) check these [detailed instructions](https://github.com/rm511130/LBRANDS/blob/master/PuTTY_and_SSH.md).
  
-----------------------------------------------------

## Guidelines for this Workshop
- This workshop includes presentations, demos and hands-on labs. 
- The labs are interdependent and must be executed in order.
- Please use the [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) to claim a user-id for this workshop. For example, Ralph Meira is user1.
- Update the same [Workshop Google Sheet](https://docs.google.com/spreadsheets/d/17AG0H2_zJNXWIP8ZOsXjjlPCPKwhskRTg5bgkRR4maI) as you progress through the Labs, by placing an "x" in the appropriate column.
- When carrying out hands-on labs, you can cut-&-paste the commands shown `in boxes like this one`. However, when issuing commands, please make sure to alter the userID to match the one you have claimed, e.g.:
  - `ssh -i fuse.pem ubuntu@user3.ourpcf.com` is for `user3` 
  - `ssh -i fuse.pem ubuntu@user15.ourpcf.com` is for `user15`
- Don't get stuck. Ask for help. The goal is to learn concepts and understand how Pivotal/VMware can help LBrands be successful.
- The PAS and PKS platforms we will be using were created using Let's Encrypt SSL Certificates, so we don't expect any warning screens about insecure SSL connections or pages.
- Each workshop participant will be assigned an Ubuntu VM which has been readied for the execution of hands-on Labs. Your Laptop or Desktop will only be used for two purposes: 
     - PuTTY'ing or SSH'ing into the Ubuntu VM 
     - Browsing web pages
- When it's time for hands-on labs, you will see the following icon:
     
![](./images/lab.png)
