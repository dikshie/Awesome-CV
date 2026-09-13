# Lightweight XeLaTeX build container for Awesome-CV
FROM ubuntu:24.04

LABEL maintainer="Mohamad Dikshie Fauzie <dikshie@gmail.com>"
LABEL description="Containerized XeLaTeX environment for building Awesome-CV Resume, CV, and Cover Letter"

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/tmp
ENV TEXMFVAR=/tmp/texmf-var
ENV TEXMFCACHE=/tmp/texmf-cache

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-xetex \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    fontconfig \
    make \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

ENTRYPOINT ["make"]
CMD ["all"]
