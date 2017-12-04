FROM ubuntu:16.04
MAINTAINER ipinko
RUN apt-get update
RUN apt-get install curl zip apt-transport-https libleveldb-dev sqlite3 libsqlite3-dev -y
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-get update
RUN curl -O -J -L https://github.com/neo-project/neo-cli/releases/download/v2.4.1/neo-cli-ubuntu.16.04-x64.zip

RUN apt-get install dotnet-sdk-2.0.2 -y
RUN unzip neo-cli-ubuntu.16.04-x64.zip
RUN rm neo-cli-ubuntu.16.04-x64.zip
RUN dotnet neo-cli/neo-cli.dll