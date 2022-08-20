ARG VARIANT=bullseye
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        auto-multiple-choice \
        chktex \
        graphicsmagick \
        latexmk \
        texlive \
        texlive-extra-utils \
        texlive-fonts-extra \
        texlive-fonts-extra-links \
        texlive-lang-french \
        texlive-latex-extra \
        texlive-luatex \
        texlive-pstricks \
        texlive-science \
    && rm -rf /var/lib/apt/lists/*
COPY .AMC.d /home/vscode/.AMC.d
RUN chown -R vscode:vscode /home/vscode/.AMC.d
ENTRYPOINT ["/usr/bin/auto-multiple-choice"]
