FROM ubuntu:20.10

ENV DEBIAN_FRONTEND=noninteractive

# Install APT packages
RUN     apt-get update \
    &&  apt-get install -y \
            apt-transport-https \
            ca-certificates \
            apt-utils \
            gnupg \
            nano \
            curl

# Install Kubectl
# - https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
RUN     curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    &&  echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list \
    &&  apt-get update \
    &&  apt-get install -y kubectl

# Install Dopper CLI
RUN     curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | apt-key add - \
    &&  echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | tee /etc/apt/sources.list.d/doppler-cli.list \
    &&  apt-get update \
    &&  apt-get install -y doppler
