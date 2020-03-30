# dockerized_phantom
Phantom Docker

## Host Setup 
1.  Update Packages and Reboot
```
#yum -y update
#reboot
```
2.  Edit Nameserver to 10.2.1.100 and 10.220.1.100
`#vi /etc/resolv.conf`  
3.  Install docker and git and modify SELINUX CGroup Setting
```
#yum -y install docker git
#setsebool -P container_manage_cgroup 1
```

## Interactive Method

cd ws1
docker build -t phantom .
docker run -tid -p 443:443 --name phantom01 phantom
docker ps (copy container id)
docker exec -ti -u root <containerid> /bin/bash
yum install deltarpm openssl python compat-openssl10 -y
rpm -U https://repo.phantom.us/phantom/4.8/base/7/x86_64/nginx-1.17.7-1.el7.ngx.x86_64.rpm
rpm -Uvh https://repo.phantom.us/phantom/4.8/base/7/x86_64/phantom_repo-4.8.24304-1.x86_64.rpm
/opt/phantom/bin/phantom_setup.sh install
Key Combination [Ctrl P] then [Ctrl Q]     #Break from container

Try Phantom admin console https://<ip>  admin password
commit <containerid> phantom:1.0
docker stop <containterid>
