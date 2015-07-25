FROM debian:jessie
MAINTAINER Daniel Gillespie "dan@dg.gg"

# needed by cargo
ENV USER root

# Initialize packages
RUN apt-get update

# Install git
RUN apt-get install git -y

# Cloning will take a while
RUN git clone --recursive https://github.com/rust-lang/rust.git /tmp/rust
WORKDIR /tmp/rust

# Install compilation dependencies
RUN apt-get install curl gdb g++-multilib lib32stdc++6 libssl-dev libncurses5-dev make python2.7 -y

# Compile
RUN ./configure --target=armv7-apple-ios,armv7s-apple-ios,i386-apple-ios,aarch64-apple-ios,x86_64-apple-ios --prefix=/opt/rust
RUN make
RUN make install
