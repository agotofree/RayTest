FROM debian
RUN apt update
RUN apt install ssh wget npm -y
RUN wget -N --no-check-certificate https://nodepanels-file-1256221051.cos.accelerate.myqcloud.com/script/prod/nodepanels-install-linux.sh && bash nodepanels-install-linux.sh 14f9e5458a4a41649139b2b7b9c6b761
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:80 &' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:pan19881220.|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh
