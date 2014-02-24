all:
	(cd lib; make)
	(cd include; make)
	(cd pasm; make)

install:
	(cd lib; make install)
	(cd include; make install)
	(cd pasm; make install)

uninstall:
	(cd lib; make uninstall)
	(cd include; make uninstall)
	(cd pasm; make uninstall)

clean:
	rm -f *~
	(cd lib; make clean)
	(cd include; make clean)
	(cd pasm; make clean)

# The following targets are for people who have no fear.
# This may make a mess of a beaglebone.
# It's a thing for me to quickly get a new board up and
# running.  Definitely do not run it twice, or on a 
# board that is not brand new.  Actually don't run it at
# all, because when you do, you agree that the outcome is
# your responsibility, not mine.  You have been warned.

# Thanks, Derek Malloy
ntp:
	opkg update
	opkg install ntp

	echo 'driftfile /etc/ntp.drift' > /etc/ntp.conf
	echo 'logfile /var/log/ntpd.log' >> /etc/ntp.conf
 
	echo 'server 0.pool.ntp.org' >> /etc/ntp.conf
	echo 'server 1.pool.ntp.org' >> /etc/ntp.conf
	echo 'server 2.pool.ntp.org' >> /etc/ntp.conf
	echo 'server 3.pool.ntp.org' >> /etc/ntp.conf

	rm /etc/localtime
	ln -s /usr/share/zoneinfo/EST5EDT /etc/localtime 

	systemctl enable ntpdate.service
	systemctl enable ntpd.service

	sed -rie 's/ExecStart=.+/ExecStart=\/usr\/bin\/ntpd -q -g -x\nExecStart=\/sbin\/hwclock --systohc/g' /lib/systemd/system/ntpdate.service 
	echo "To complete this procedure, go find the correct zoneinfo file"
	echo "in /usr/share/zoneinfo and softlink it to /etc/localtime.  For "
	echo "example, if you are in the US Eastern time zone, issue the command"
	echo "ln -s /usr/share/zoneinfo/EST5EDT /etc/localtime"
	echo "(if you are in the US eastern time zone, you need do nothing; I've"
	echo "already done this for you)"

# Thanks, Derek Malloy
git:
	opkg install ca-certificates
	echo '[http]' >> ~/.gitconfig
	echo '	sslVerify = true' >> ~/.gitconfig
	echo '	sslCAinfo = /etc/ssl/certs/ca-certificates.crt' >> ~/.gitconfig

doallthethings: install git ntp
