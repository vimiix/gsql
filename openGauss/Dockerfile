FROM busybox as fs
ARG DB_VERSION=5.0.2
RUN set -eux; \
    case "$(uname -m)" in \
    aarch64|arm64) arch='arm';; \
    x86_64|amd64) arch='x86_openEuler';; \
    esac; \
    mkdir /download; \
    wget "http://opengauss.obs.cn-south-1.myhuaweicloud.com/$DB_VERSION/$arch/openGauss-$DB_VERSION-openEuler-64bit.tar.bz2"; \
    tar -xf "openGauss-$DB_VERSION-openEuler-64bit.tar.bz2" --strip-components 1 -C /download; \
    mkdir -p /cache/bin /cache/lib; \
    cp /download/bin/gsql \
       /download/bin/gs_dump \
       /download/bin/gs_dumpall \
       /download/bin/gs_basebackup \
       /download/bin/gs_probackup \
       /download/bin/gs_restore /cache/bin; \
    cp -R /download/lib/* /cache/lib;


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
