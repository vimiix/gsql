FROM busybox as fs
ARG DB_VERSION=5.0.6
RUN set -eux; \
    case "$(uname -m)" in \
    aarch64|arm64) arch='arm64';; \
    x86_64|amd64) arch='x86_64';; \
    esac; \
    mkdir -p /cache && cd /cache; \
    wget "http://cdn-mogdb.enmotech.com/mogdb-media/$DB_VERSION/Kylin_$arch/MogDB-$DB_VERSION-Kylin-$arch-all.tar.gz"; \
    tar -xf "MogDB-$DB_VERSION-Kylin-$arch-all.tar.gz" --strip-components 1 "MogDB-$DB_VERSION-Kylin-$arch-all/MogDB-$DB_VERSION-Kylin-64bit-tools.tar.gz"; \
    tar -xf "MogDB-$DB_VERSION-Kylin-64bit-tools.tar.gz" --strip-components 1; \
    rm -f *.tar.gz;

FROM debian:10.9-slim
COPY --from=fs /cache /
RUN set -eux; \
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list; \
    sed -i 's/security.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list; \
    apt-get update && apt-get install --yes --no-install-recommends \
    libreadline-dev \
    libxml2 \
    curl; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/*; \
    ln -s /lib/$(uname -m)-linux-gnu/libreadline.so.7 /lib/$(uname -m)-linux-gnu/libreadline.so.8
COPY ./entrypoint.sh /root/
ENTRYPOINT [ "/root/entrypoint.sh"]
CMD ["gsql"]
