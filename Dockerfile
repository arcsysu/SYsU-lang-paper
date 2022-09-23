# syntax=docker/dockerfile:1.4
FROM texlive/texlive:latest as builder
WORKDIR /workspace
COPY . .
RUN <<EOF
apt update
apt install fonts-noto-cjk-extra
xelatex sciscn.tex
xelatex sciscn.tex
EOF
FROM scratch
COPY --from=builder /workspace/sciscn.pdf /
