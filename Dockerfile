FROM haskell

WORKDIR /workspace

RUN apt update && apt install -y git make clang

RUN git clone https://github.com/owainlewis/osc.git

WORKDIR /workspace/osc

RUN stack --istall-ghc build

RUN stack install

WORKDIR /code

COPY bin .
 
CMD "./run.sh"