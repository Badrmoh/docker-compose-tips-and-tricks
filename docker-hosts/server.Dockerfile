FROM ubuntu

RUN useradd -l -m -s /bin/bash user && \
	apt-get update && apt-get install -y openssh-server && \
	sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config && \
	mkdir /var/run/sshd
	# sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

USER user
COPY --chown=user docker_id_rsa.pub /home/user/.ssh/id_rsa.pub
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

USER root
CMD ["/usr/sbin/sshd", "-D"]
