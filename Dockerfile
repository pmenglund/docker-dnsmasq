FROM		ubuntu
MAINTAINER	martin@englund.nu

ENV		TERM xterm

RUN		apt-get install -y dnsmasq-base incron

RUN		echo 'root' >> /etc/incron.allow

ADD		dnsmasq.conf /etc/dnsmasq.conf
ADD		incron.root /var/spool/incron/root
ADD		run /usr/bin/run

VOLUME		["/etc/dnsmasq"]

EXPOSE		53/udp 53/tcp

ENTRYPOINT	["/usr/bin/run"]
