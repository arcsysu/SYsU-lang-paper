# syntax=docker/dockerfile:1.4
FROM texlive/texlive:latest as builder
WORKDIR /workspace
COPY . .
RUN <<EOF
apt-get update
apt-get install --no-install-recommends fonts-noto-cjk-extra
xelatex sciscn.tex
xelatex sciscn.tex
EOF
FROM scratch
COPY --from=builder /workspace/sciscn.pdf /
