# dockerized_phantom
Phantom Docker

## Host Setup 
1.  Update Packages and Reboot
```
#yum -y update
#reboot
```
2.  Edit Nameserver to 10.2.1.100 and 10.220.1.100
```
#vi /etc/resolv.conf
```  
3.  Install docker and git and modify SELINUX CGroup Setting
```
#yum -y install docker git
#setsebool -P container_manage_cgroup 1
#git clone git@github.com:cityfarmer/dockerized_phantom.git 
```

## Interactive Method
1.  Build Docker Image and Start Container
```
#cd dockerized_phantom
#docker build -t phantom:1.0 .
#docker run -tid -p 443:443 --name phantom01 phantom:1.0
```
2. Execute session in container and run dependencies and startup scripts
```
#docker exec -ti phantom01 /bin/bash
#/opt/phantom/bin/phantom_setup.sh install
....
....
Installing phantom apps
Loaded plugins: fastestmirror, ovl
Cleaning repos: base extras phantom-apps phantom-base updates
Cleaning up everything
Maybe you want: rm -rf /var/cache/yum, to also free up space taken by orphaned data from disabled or removed repos
Cleaning up list of fastest mirrors
```
3.  When phantom_setup.sh stops Enter Key Combo below to break from container
   *NOTE:  install script does not return, but when you see the lines above it is complete*
```
[Ctrl P] then [Ctrl Q]
```
4.  Try Phantom admin console https://ip
  - admin 
  - password
5.  Commit container changes to Image
```
#commit phantom01 phantom:2.0
#docker stop phantom01
```
## Admin Commands (Optional)
1.  Restart containter
```
#docker start phantom01
```
2.  Remove containter and restart from image
  ```
  #docker rm -f phantom01
  #docker run -tid --name phantom02 -p 443:443 phantom:2.0 
  ```
