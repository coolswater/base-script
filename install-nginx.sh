#安装基本库
yum -y install make zlib zlib-devel gcc-c++ libtool  openssl openssl-devel

#安装pcre
#PCRE 作用是让 Nginx 支持 Rewrite 功能。
cd /usr/local/src
wget http://downloads.sourceforge.net/project/pcre/pcre/8.35/pcre-8.35.tar.gz
tar zxvf pcre-8.35.tar.gz
cd pcre-8.35
./configure
make && make install

#安装nginx
cd /usr/local/src
wget http://nginx.org/download/nginx-1.16.0.tar.gz
tar -xvf nginx-1.16.0.tar.gz
mkdir -p /usr/local/nginx
cd /usr/local/src/nginx-1.16.0
./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre=/usr/local/src/pcre-8.35
make && make install
