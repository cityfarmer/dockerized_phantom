FROM centos:7.5.1804

ENV container docker
MAINTAINER CityFarmer <cloud-ops@centos.org>

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
yum install -y deltarpm openssl python compat-openssl10; \
rpm -U https://repo.phantom.us/phantom/4.8/base/7/x86_64/nginx-1.17.7-1.el7.ngx.x86_64.rpm; \
rpm -Uvh https://repo.phantom.us/phantom/4.8/base/7/x86_64/phantom_repo-4.8.24304-1.x86_64.rpm;

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]

EXPOSE 443/TCP
