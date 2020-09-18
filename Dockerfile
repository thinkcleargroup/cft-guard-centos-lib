FROM centos:7

RUN yum -y update
RUN yum -y install curl git

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH $PATH:/root/.cargo/bin

RUN git clone https://github.com/aws-cloudformation/cloudformation-guard.git

RUN yum -y install make which wget tar \
    gcc patch readline-devel zlib-devel \
    libyaml-devel libffi-devel openss-devel \
    gdbm-devel ncurses-devel libxml-devel bzip2 
WORKDIR cloudformation-guard
RUN pwd
RUN ls
RUN make
CMD ["ls"]