# syntax=docker/dockerfile:1.4
FROM texlive/texlive:latest as builder
WORKDIR /workspace
COPY . .
RUN <<EOF
apt-get update -y
apt-get install --no-install-recommends -y fonts-noto-cjk-extra
xelatex sciscn
bibtex sciscn
xelatex sciscn
xelatex sciscn
EOF
FROM scratch
COPY --from=builder /workspace/sciscn.pdf /
