FROM gitpod/workspace-full
USER root
RUN apt-get update && apt-get install -y perl6 && zef install --deps-only --/test .
USER gitpod
