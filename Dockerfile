FROM ubuntu:20.04

# SSHサーバーのインストールと初期設定
RUN apt-get update && apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

# rootユーザーのパスワード設定
RUN echo 'root:rootpassword' | chpasswd

RUN apt-get install -y sudo

# コンテナ内でSSHをデフォルトで起動する
CMD ["/usr/sbin/sshd", "-D"]
