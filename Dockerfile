FROM ocaml/opam

RUN sudo apt-get update -yy

ADD . /opam-repo-dev
RUN opam repo add -k git opam-repo-dev /opam-repo-dev
RUN opam update -R

WORKDIR /opam-repo-dev
