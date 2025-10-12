# debian version
# 10 (Buster)
# 11 (Bullseye)
# 12 (Bookworm) **now**
# 13 (Trixie)
# 14 (Forky)

# for main image
ARG DOCKER_DEBIAN_VERSION=bookworm

# for builder images
ARG DOCKER_GOLANG_VERSION=1.25.1
ARG DOCKER_RUST_VERSION=1.90.0
ARG DOCKER_NODE_VERSION=22.19.0
ARG DOCKER_PYTHON_VERSION=3.13

# for debian tools (apt-get)
# https://packages.debian.org/search?keywords=<package_name>
ARG DEBIAN_MAKE_VERSION=4.3-4.1
ARG DEBIAN_BUILD_ESSENTIAL_VERSION=12.9
ARG DEBIAN_LIBXCB1_DEV_VERSION=1.15-1
ARG DEBIAN_LIBXCB_RENDER0_DEV_VERSION=1.15-1
ARG DEBIAN_LIBXCB_SHAPE0_DEV_VERSION=1.15-1
ARG DEBIAN_LIBXCB_XFIXES0_DEV_VERSION=1.15-1
ARG DEBIAN_BASH_VERSION=5.2.15-2+b9
ARG DEBIAN_ZSH_VERSION=5.9-4+b7
ARG DEBIAN_GNUPG_VERSION=2.2.40-1.1+deb12u1
ARG DEBIAN_CA_CERTIFICATES_VERSION=20230311+deb12u1
ARG DEBIAN_CURL_VERSION=7.88.1-10+deb12u14
ARG DEBIAN_WGET_VERSION=1.21.3-1+deb12u1
ARG DEBIAN_GIT_VERSION=1:2.39.5-0+deb12u2
ARG DEBIAN_TREE_VERSION=2.1.0-1
ARG DEBIAN_NANO_VERSION=7.2-1+deb12u1
ARG DEBIAN_LESS_VERSION=590-2.1~deb12u2
ARG DEBIAN_ZIP_VERSION=3.0-13
ARG DEBIAN_GZIP_VERSION=1.12-1
ARG DEBIAN_UNZIP_VERSION=6.0-28
ARG DEBIAN_TAR_VERSION=1.34+dfsg-1.2+deb12u1
ARG DEBIAN_XZ_UTILS_VERSION=5.4.1-1
ARG DEBIAN_LOCALES_ALL_VERSION=2.36-9+deb12u13
ARG DEBIAN_PROCPS_VERSION=2:4.0.2-3
ARG DEBIAN_SUDO_VERSION=1.9.13p3-1+deb12u2
ARG DEBIAN_FZF_VERSION=0.38.0-1+b1
ARG DEBIAN_MAN_DB_VERSION=2.11.2-2
ARG DEBIAN_GNUPG2_VERSION=2.2.40-1.1+deb12u1
ARG DEBIAN_GH_VERSION=2.23.0+dfsg1-1
ARG DEBIAN_IPTABLES_VERSION=1.8.9-2
ARG DEBIAN_IPSET_VERSION=7.17-1
ARG DEBIAN_IPROUTE2_VERSION=6.1.0-3
# ARG DEBIAN_DNSUTILS_VERSION=1:9.18.33-1~deb12u2
ARG DEBIAN_BIND9_DNSUTILS_VERSION=1:9.18.33-1~deb12u2
ARG DEBIAN_AGGREGATE_VERSION=1.6-7+b1
ARG DEBIAN_EXPAT_VERSION=2.5.0-1+deb12u2
ARG DEBIAN_LIBPQ_DEV_VERSION=15.14-0+deb12u1

# for go tools
ARG GO_DOCKERFMT_VERSION=v0.3.7
ARG GO_SHFMT_VERSION=v3.12.0
ARG GO_GO_TASK_VERSION=v3.45.4
ARG GO_CURLIE_VERSION=v1.8.2
ARG GO_USQL_VERSION=v0.19.25

# for cargo tools
ARG CARGO_EZA_VERSION=0.23.3
ARG CARGO_TOKEI_VERSION=12.1.2
ARG CARGO_DELTA_VERSION=0.18.2
ARG CARGO_FD_VERSION=10.3.0
ARG CARGO_BAT_VERSION=0.25.0
ARG CARGO_LSD_VERSION=1.1.5
ARG CARGO_BROOT_VERSION=1.49.1

# for npm tools
ARG NPM_NPM_VERSION=11.6.0
ARG NPM_PRETTIER_VERSION=3.6.2
ARG NPM_RENOVATE_VERSION=41.15.0
ARG NPM_CLAUDE_CODE_VERSION=1.0.120
ARG NPM_CCUSAGE_VERSION=17.0.2
ARG NPM_REPOMIX_VERSION=1.6.0
ARG NPM_OPENAI_CODEX_VERSION=0.39.0

# for pip tools
ARG PIP_PIP_VERSION=25.2
ARG PIP_PIPX_VERSION=1.7.1
ARG PIP_WHEEL_VERSION=0.45.1
ARG PIP_UV_VERSION=0.8.19
ARG PIP_RUFF_VERSION=0.13.1
ARG PIP_HTTPIE_VERSION=3.2.4
ARG PIP_PGCLI_VERSION=4.3.0
ARG PIP_GITINGEST_VERSION=0.3.1

# for other tools (github-tags)
ARG OTHER_JQ_VERSION=1.8.0
ARG OTHER_YQ_VERSION=4.47.2
ARG OTHER_XQ_VERSION=1.3.0
ARG OTHER_TAPLO_VERSION=0.10.0
ARG OTHER_SHELLCHECK_VERSION=v0.11.0
ARG OTHER_RIPGREP_VERSION=14.1.1
ARG OTHER_HADOLINT_VERSION=v2.13.1
ARG OTHER_GITLEAKS_VERSION=8.28.0
ARG OTHER_FZF_VERSION=0.65.2

# ##########################################################################################
# builder images
# ##########################################################################################

# golang
# https://hub.docker.com/_/golang
FROM golang:${DOCKER_GOLANG_VERSION}-${DOCKER_DEBIAN_VERSION} AS golang-builder

# dockerfmt
# https://github.com/reteps/dockerfmt
ARG GO_DOCKERFMT_VERSION
RUN go install github.com/reteps/dockerfmt@${GO_DOCKERFMT_VERSION} \
    && dockerfmt version

# shfmt
# https://github.com/mvdan/sh
ARG GO_SHFMT_VERSION
RUN go install mvdan.cc/sh/v3/cmd/shfmt@${GO_SHFMT_VERSION} \
    && shfmt --version

# go-task
# https://github.com/go-task/task
# https://taskfile.dev/
ARG GO_GO_TASK_VERSION
RUN go install github.com/go-task/task/v3/cmd/task@${GO_GO_TASK_VERSION} \
    && task --version

# curlie
# https://github.com/rs/curlie
ARG GO_CURLIE_VERSION
RUN go install github.com/rs/curlie@${GO_CURLIE_VERSION} \
    && curlie --version

# usql
# https://github.com/xo/usql
ARG GO_USQL_VERSION
RUN go install -tags most github.com/xo/usql@${GO_USQL_VERSION} \
    && usql --version

# rust
# https://hub.docker.com/_/rust
FROM rust:${DOCKER_RUST_VERSION}-${DOCKER_DEBIAN_VERSION} AS rust-builder

# eza
# https://github.com/eza-community/eza
# https://github.com/eza-community/eza/blob/main/INSTALL.md
ARG CARGO_EZA_VERSION
RUN cargo install eza@${CARGO_EZA_VERSION} \
    && eza --version

# tokei
# https://github.com/XAMPPRocky/tokei
ARG CARGO_TOKEI_VERSION
RUN cargo install tokei@${CARGO_TOKEI_VERSION} \
    && tokei --version

# delta
# https://github.com/dandavison/delta
# https://dandavison.github.io/delta/installation.html
ARG CARGO_DELTA_VERSION
RUN cargo install git-delta@${CARGO_DELTA_VERSION} \
    && delta --version

# fd
# https://github.com/sharkdp/fd
ARG DEBIAN_MAKE_VERSION
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        make=${DEBIAN_MAKE_VERSION} \
    && rm -rf /var/lib/apt/lists/*
ARG CARGO_FD_VERSION
RUN cargo install fd-find@${CARGO_FD_VERSION} \
    && fd --version

# bat
# https://github.com/sharkdp/bat
ARG CARGO_BAT_VERSION
RUN cargo install bat@${CARGO_BAT_VERSION} \
    && bat --version

# lsd
# https://github.com/lsd-rs/lsd
ARG CARGO_LSD_VERSION
RUN cargo install lsd@${CARGO_LSD_VERSION} \
    && lsd --version

# broot
# https://github.com/Canop/broot
# https://dystroy.org/broot/install/
ARG DEBIAN_BUILD_ESSENTIAL_VERSION
ARG DEBIAN_LIBXCB1_DEV_VERSION
ARG DEBIAN_LIBXCB_RENDER0_DEV_VERSION
ARG DEBIAN_LIBXCB_SHAPE0_DEV_VERSION
ARG DEBIAN_LIBXCB_XFIXES0_DEV_VERSION
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        build-essential=${DEBIAN_BUILD_ESSENTIAL_VERSION} \
        libxcb1-dev=${DEBIAN_LIBXCB1_DEV_VERSION} \
        libxcb-render0-dev=${DEBIAN_LIBXCB_RENDER0_DEV_VERSION} \
        libxcb-shape0-dev=${DEBIAN_LIBXCB_SHAPE0_DEV_VERSION} \
        libxcb-xfixes0-dev=${DEBIAN_LIBXCB_SHAPE0_DEV_VERSION} \
    && rm -rf /var/lib/apt/lists/*
ARG CARGO_BROOT_VERSION
RUN cargo install broot@${CARGO_BROOT_VERSION} \
    && broot --version

# node
# https://hub.docker.com/_/node
# https://note.milldea.com/posts/two-ways-to-install-nodejs-with-fixed-version-in-dockerfile
FROM node:${DOCKER_NODE_VERSION}-${DOCKER_DEBIAN_VERSION} AS node-builder

# python
# https://hub.docker.com/_/python
FROM python:${DOCKER_PYTHON_VERSION}-${DOCKER_DEBIAN_VERSION} AS python-builder
RUN mkdir -p /python-install \
    && cp -r /usr/local/bin /python-install/ \
    && cp -r /usr/local/lib /python-install/ \
    && cp -r /usr/local/include /python-install/ \
    && rm -rf /python-install/lib/pkgconfig

# ##########################################################################################
# main image
# ##########################################################################################

# debian
# https://hub.docker.com/_/debian/
FROM debian:${DOCKER_DEBIAN_VERSION}
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS=yes

# add distribution packages
ARG DEBIAN_BASH_VERSION
ARG DEBIAN_ZSH_VERSION
ARG DEBIAN_GNUPG_VERSION
ARG DEBIAN_CA_CERTIFICATES_VERSION
ARG DEBIAN_CURL_VERSION
ARG DEBIAN_WGET_VERSION
ARG DEBIAN_GIT_VERSION
ARG DEBIAN_TREE_VERSION
ARG DEBIAN_NANO_VERSION
ARG DEBIAN_LESS_VERSION
ARG DEBIAN_ZIP_VERSION
ARG DEBIAN_GZIP_VERSION
ARG DEBIAN_UNZIP_VERSION
ARG DEBIAN_TAR_VERSION
ARG DEBIAN_XZ_UTILS_VERSION
ARG DEBIAN_LOCALES_ALL_VERSION
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        bash=${DEBIAN_BASH_VERSION} \
        zsh=${DEBIAN_ZSH_VERSION} \
        gnupg=${DEBIAN_GNUPG_VERSION} \
        ca-certificates=${DEBIAN_CA_CERTIFICATES_VERSION} \
        curl=${DEBIAN_CURL_VERSION} \
        wget=${DEBIAN_WGET_VERSION} \
        git=${DEBIAN_GIT_VERSION} \
        tree=${DEBIAN_TREE_VERSION} \
        nano=${DEBIAN_NANO_VERSION} \
        less=${DEBIAN_LESS_VERSION} \
        zip=${DEBIAN_ZIP_VERSION} \
        gzip=${DEBIAN_GZIP_VERSION} \
        unzip=${DEBIAN_UNZIP_VERSION} \
        tar=${DEBIAN_TAR_VERSION} \
        xz-utils=${DEBIAN_XZ_UTILS_VERSION} \
        locales-all=${DEBIAN_LOCALES_ALL_VERSION} \
    && rm -rf /var/lib/apt/lists/*

# golang
# refs above
COPY --from=golang-builder /usr/local/go /usr/local/go
ENV PATH=/usr/local/go/bin/:$PATH

# dockerfmt
# refs above
COPY --from=golang-builder /go/bin/dockerfmt /usr/local/bin/

# shfmt
# refs above
COPY --from=golang-builder /go/bin/shfmt /usr/local/bin/

# go-task
# refs above
COPY --from=golang-builder /go/bin/task /usr/local/bin/

# curlie
# refs above
COPY --from=golang-builder /go/bin/curlie /usr/local/bin/

# usql
# refs above
COPY --from=golang-builder /go/bin/usql /usr/local/bin/

# eza
# refs above
COPY --from=rust-builder /usr/local/cargo/bin/eza /usr/local/bin/

# tokei
# refs above
COPY --from=rust-builder /usr/local/cargo/bin/tokei /usr/local/bin/

# delta
# refs above
COPY --from=rust-builder /usr/local/cargo/bin/delta /usr/local/bin/

# fd
# refs above
COPY --from=rust-builder /usr/local/cargo/bin/fd /usr/local/bin/

# bat
# refs above
COPY --from=rust-builder /usr/local/cargo/bin/bat /usr/local/bin/

# lsd
# refs above
COPY --from=rust-builder /usr/local/cargo/bin/lsd /usr/local/bin/

# broot
# refs above
COPY --from=rust-builder /usr/local/cargo/bin/broot /usr/local/bin/

# node
# refs above
COPY --from=node-builder /usr/local/bin/node /usr/local/bin/node
COPY --from=node-builder /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs \
    && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
    && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx \
    && node --version \
    && npm --version \
    && npx --version

# npm
# https://github.com/npm/cli
# https://www.npmjs.com/package/npm
ARG NPM_NPM_VERSION
RUN npm install -g npm@${NPM_NPM_VERSION} \
    && npm --version

# prettier
# https://prettier.io/docs/install
ARG NPM_PRETTIER_VERSION
RUN npm install -g prettier@${NPM_PRETTIER_VERSION} \
    && prettier --version

# renovate
# https://github.com/renovatebot/renovate
# https://www.npmjs.com/package/renovate
ARG NPM_RENOVATE_VERSION
RUN npm install -g renovate@${NPM_RENOVATE_VERSION} \
    && renovate --version

# claude-code
# https://github.com/anthropics/claude-code
# https://github.com/anthropics/claude-code/blob/main/.devcontainer/devcontainer.json
# https://github.com/anthropics/claude-code/blob/main/.devcontainer/Dockerfile
# https://github.com/anthropics/claude-code/blob/main/.devcontainer/init-firewall.sh
ARG DEBIAN_LESS_VERSION
ARG DEBIAN_GIT_VERSION
ARG DEBIAN_PROCPS_VERSION
ARG DEBIAN_SUDO_VERSION
ARG DEBIAN_FZF_VERSION
ARG DEBIAN_ZSH_VERSION
ARG DEBIAN_MAN_DB_VERSION
ARG DEBIAN_UNZIP_VERSION
ARG DEBIAN_GNUPG2_VERSION
ARG DEBIAN_GH_VERSION
ARG DEBIAN_IPTABLES_VERSION
ARG DEBIAN_IPSET_VERSION
ARG DEBIAN_IPROUTE2_VERSION
ARG DEBIAN_BIND9_DNSUTILS_VERSION
ARG DEBIAN_AGGREGATE_VERSION
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        less=${DEBIAN_LESS_VERSION} \
        git=${DEBIAN_GIT_VERSION} \
        procps=${DEBIAN_PROCPS_VERSION} \
        sudo=${DEBIAN_SUDO_VERSION} \
        # fzf=${DEBIAN_FZF_VERSION} \
        zsh=${DEBIAN_ZSH_VERSION} \
        man-db=${DEBIAN_MAN_DB_VERSION} \
        unzip=${DEBIAN_UNZIP_VERSION} \
        gnupg2=${DEBIAN_GNUPG2_VERSION} \
        gh=${DEBIAN_GH_VERSION} \
        iptables=${DEBIAN_IPTABLES_VERSION} \
        ipset=${DEBIAN_IPSET_VERSION} \
        iproute2=${DEBIAN_IPROUTE2_VERSION} \
        bind9-dnsutils=${DEBIAN_BIND9_DNSUTILS_VERSION} \
        aggregate=${DEBIAN_AGGREGATE_VERSION} \
    && rm -rf /var/lib/apt/lists/*
ARG NPM_CLAUDE_CODE_VERSION
RUN npm install -g @anthropic-ai/claude-code@${NPM_CLAUDE_CODE_VERSION} \
    && claude --version
ENV DEVCONTAINER=true

# ccusage
# https://github.com/ryoppippi/ccusage
# https://www.npmjs.com/package/ccusage
ARG NPM_CCUSAGE_VERSION
RUN npm install -g ccusage@${NPM_CCUSAGE_VERSION}
# RUN npm install -g ccusage@${NPM_CCUSAGE_VERSION} \
#     && ccusage --version

# repomix
# https://github.com/yamadashy/repomix
# https://www.npmjs.com/package/repomix
ARG NPM_REPOMIX_VERSION
RUN npm install -g repomix@${NPM_REPOMIX_VERSION} \
    && repomix --version

# openai/codex
# https://www.npmjs.com/package/@openai/codex
# https://developers.openai.com/codex/cli
ARG NPM_OPENAI_CODEX_VERSION
RUN npm install -g @openai/codex@${NPM_OPENAI_CODEX_VERSION}

# python
# refs above
ARG DEBIAN_EXPAT_VERSION
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        expat=${DEBIAN_EXPAT_VERSION} \
    && rm -rf /var/lib/apt/lists/*
COPY --from=python-builder /python-install/bin/ /usr/local/bin/
COPY --from=python-builder /python-install/lib/ /usr/local/lib/
COPY --from=python-builder /python-install/include/ /usr/local/include/
ENV PIP_ROOT_USER_ACTION=ignore
RUN python --version \
    && pip --version

# pip
# https://pypi.org/project/pip/
ARG PIP_PIP_VERSION
RUN pip install --upgrade pip==${PIP_PIP_VERSION} \
    && pip --version

# pipx
# https://github.com/pypa/pipx
ARG PIP_PIPX_VERSION
RUN pip install pipx==${PIP_PIPX_VERSION}
RUN pipx ensurepath \
    && pipx --version

# wheel
# https://pypi.org/project/wheel/
ARG PIP_WHEEL_VERSION
RUN pip install wheel==${PIP_WHEEL_VERSION} \
    && wheel version

# uv
# https://github.com/astral-sh/uv
# https://pypi.org/project/uv/
ARG PIP_UV_VERSION
RUN pip install uv==${PIP_UV_VERSION} \
    && uv --version

# ruff
# https://github.com/astral-sh/ruff
ARG PIP_RUFF_VERSION
RUN pip install ruff==${PIP_RUFF_VERSION} \
    && ruff --version

# httpie
# https://github.com/httpie/cli
# https://httpie.io/docs/cli/installation
# https://pypi.org/project/httpie/
ARG PIP_HTTPIE_VERSION
RUN pip install httpie==${PIP_HTTPIE_VERSION} \
    && httpie --version

# pgcli
# https://github.com/dbcli/pgcli
# https://pypi.org/project/pgcli/
ARG DEBIAN_LIBPQ_DEV_VERSION
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        libpq-dev=${DEBIAN_LIBPQ_DEV_VERSION} \
    && rm -rf /var/lib/apt/lists/*
ARG PIP_PGCLI_VERSION
RUN pip install pgcli==${PIP_PGCLI_VERSION} \
    && pgcli --version

# gitingest
# https://github.com/cyclotruc/gitingest
ARG PIP_GITINGEST_VERSION
RUN pip install gitingest==${PIP_GITINGEST_VERSION}
# RUN pip install gitingest==${PIP_GITINGEST_VERSION} \
#     && gitingest --version

# jq
# https://github.com/jqlang/jq
ARG OTHER_JQ_VERSION
RUN ARCH=$(uname -m | sed 's/aarch64/arm64/' | sed 's/x86_64/amd64/') \
    && curl -fsSL -o /jq https://github.com/jqlang/jq/releases/download/jq-${OTHER_JQ_VERSION}/jq-linux-${ARCH} \
    && chmod +x /jq \
    && mv /jq /usr/local/bin/ \
    && jq --version

# yq
# https://github.com/mikefarah/yq
# https://hub.docker.com/r/mikefarah/yq
ARG OTHER_YQ_VERSION
RUN ARCH=$(uname -m | sed 's/aarch64/arm64/' | sed 's/x86_64/amd64/') \
    && curl -fsSL -o /yq https://github.com/mikefarah/yq/releases/download/v${OTHER_YQ_VERSION}/yq_linux_${ARCH} \
    && chmod +x /yq \
    && mv /yq /usr/local/bin/ \
    && yq --version

# xq
# https://github.com/sibprogrammer/xq
ARG OTHER_XQ_VERSION
RUN ARCH=$(uname -m | sed 's/aarch64/arm64/' | sed 's/x86_64/amd64/') \
    && curl -fsSL -o /xq.tar.gz https://github.com/sibprogrammer/xq/releases/download/v${OTHER_XQ_VERSION}/xq_${OTHER_XQ_VERSION}_linux_${ARCH}.tar.gz \
    && mkdir -p /xq \
    && tar -xvzf /xq.tar.gz -C /xq/ \
    && chmod +x /xq/xq \
    && mv /xq/xq /usr/local/bin/ \
    && rm /xq.tar.gz \
    && rm -rf /xq \
    && cd / \
    && xq --version

# taplo
# https://github.com/tamasfe/taplo
# https://taplo.tamasfe.dev/
# https://hub.docker.com/r/tamasfe/taplo
ARG OTHER_TAPLO_VERSION
RUN ARCH=$(uname -m | sed 's/arm64/aarch64/' | sed 's/amd64/x86_64/') \
    && curl -fsSL -o /taplo.gz https://github.com/tamasfe/taplo/releases/download/${OTHER_TAPLO_VERSION}/taplo-linux-${ARCH}.gz \
    && gzip -d /taplo.gz \
    && chmod +x /taplo \
    && mv /taplo /usr/local/bin/ \
    && taplo --version

# shellcheck
# https://github.com/koalaman/shellcheck
# https://hub.docker.com/r/koalaman/shellcheck
ARG OTHER_SHELLCHECK_VERSION
RUN ARCH=$(uname -m | sed 's/arm64/aarch64/' | sed 's/amd64/x86_64/') \
    && curl -fsSL -o /shellcheck.tar.xz https://github.com/koalaman/shellcheck/releases/download/${OTHER_SHELLCHECK_VERSION}/shellcheck-${OTHER_SHELLCHECK_VERSION}.linux.${ARCH}.tar.xz \
    && tar -xvf /shellcheck.tar.xz -C / \
    && chmod +x /shellcheck-${OTHER_SHELLCHECK_VERSION}/shellcheck \
    && mv /shellcheck-${OTHER_SHELLCHECK_VERSION}/shellcheck /usr/local/bin/ \
    && rm /shellcheck.tar.xz \
    && rm -rf /shellcheck-${OTHER_SHELLCHECK_VERSION} \
    && cd / \
    && shellcheck --version

# ripgrep
# https://github.com/BurntSushi/ripgrep
# * https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-aarch64-unknown-linux-gnu.tar.gz
# * https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz
ARG OTHER_RIPGREP_VERSION
RUN ARCH=$(uname -m) \
    && LIBC=$([ "$ARCH" = "x86_64" ] && echo unknown-linux-musl || echo unknown-linux-gnu) \
    && mkdir -p /ripgrep \
    && curl -fsSL -o /ripgrep/ripgrep.tar.gz -L https://github.com/BurntSushi/ripgrep/releases/download/${OTHER_RIPGREP_VERSION}/ripgrep-${OTHER_RIPGREP_VERSION}-${ARCH}-${LIBC}.tar.gz \
    && cd /ripgrep \
    && tar -xvzf ripgrep.tar.gz \
    && mv ripgrep-${OTHER_RIPGREP_VERSION}-${ARCH}-${LIBC}/rg /usr/local/bin/ \
    && chmod +x /usr/local/bin/rg \
    && rm -rf /ripgrep \
    && cd / \
    && rg --version

# hadolint
# https://github.com/hadolint/hadolint
ARG OTHER_HADOLINT_VERSION
RUN ARCH=$(uname -m | sed 's/aarch64/arm64/' | sed 's/amd64/x86_64/') \
    && curl -fsSL -o /hadolint https://github.com/hadolint/hadolint/releases/download/${OTHER_HADOLINT_VERSION}/hadolint-Linux-${ARCH} \
    && chmod +x /hadolint \
    && mv /hadolint /usr/local/bin/ \
    && hadolint --version

# gitleaks
# https://github.com/gitleaks/gitleaks
ARG OTHER_GITLEAKS_VERSION
RUN ARCH=$(uname -m | sed 's/aarch64/arm64/' | sed 's/x86_64/x64/' | sed 's/x86_64/x64/') \
    && mkdir -p /gitleaks \
    && curl -fsSL -o /gitleaks/gitleaks.tar.gz https://github.com/gitleaks/gitleaks/releases/download/v${OTHER_GITLEAKS_VERSION}/gitleaks_${OTHER_GITLEAKS_VERSION}_linux_${ARCH}.tar.gz \
    && cd /gitleaks/ \
    && tar -xvzf gitleaks.tar.gz \
    && chmod +x gitleaks \
    && mv gitleaks /usr/local/bin/ \
    && rm -rf /gitleaks \
    && cd / \
    && gitleaks --version

# fzf
# https://github.com/junegunn/fzf
ARG OTHER_FZF_VERSION
RUN ARCH=$(uname -m | sed 's/aarch64/arm64/' | sed 's/x86_64/amd64/') \
    && mkdir -p /fzf \
    && curl -fsSL -o /fzf/fzf.tar.gz https://github.com/junegunn/fzf/releases/download/v${OTHER_FZF_VERSION}/fzf-${OTHER_FZF_VERSION}-linux_${ARCH}.tar.gz \
    && cd /fzf/ \
    && tar -xvzf fzf.tar.gz \
    && chmod +x fzf \
    && mv fzf /usr/local/bin/ \
    && rm -rf /fzf \
    && cd / \
    && fzf --version

# add vscode user
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ARG DEBIAN_SUDO_VERSION
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -s /bin/bash -m $USERNAME \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
        sudo=${DEBIAN_SUDO_VERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL >/etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME
