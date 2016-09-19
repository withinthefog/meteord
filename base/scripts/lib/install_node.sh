#!/bin/bash
set -e
NODE_VERSION=4.4.7
NODE_ARCH=x64

# check we need to do this or not

NODE_DIST=node-v${NODE_VERSION}-linux-${NODE_ARCH}

cd /tmp
curl -O -L http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz
tar xvzf ${NODE_DIST}.tar.gz
rm -rf /opt/nodejs
mv ${NODE_DIST} /opt/nodejs

ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm

# 使用taobao npm镜像
npm config set registry https://registry.npm.taobao.org

npm install --global npm@3

# 使用cnpm替代npm
npm install -g cnpm --registry=https://registry.npm.taobao.org --loglevel=debug
ln -sf /opt/nodejs/lib/node_modules/cnpm/bin/cnpm /opt/nodejs/bin/
