FROM gitpod/workspace-full
USER root
RUN apt-get update && apt-get install -y perl6 vim
USER gitpod
