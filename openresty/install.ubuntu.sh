#!/bin/bash

INSTALL_DIR="/usr/local/openresty"
CPU_NUM=`cat /proc/cpuinfo |grep "processor"|wc -l`


apt-get install libreadline-dev libpcre3-dev libssl-dev libdrizzle-dev \
	libpq-dev libxslt-dev libgd2-xpm-dev libgeoip-dev libgoogle-perftools-dev \
	perl gcc make wget

cd /tmp/
wget https://openresty.org/download/ngx_openresty-1.9.7.1.tar.gz
tar xvf ngx_openresty-1.9.7.1.tar.gz 
cd ngx_openresty-1.9.7.1/


./configure --prefix=$INSTALL_DIR --with-pcre-jit --with-ipv6 --with-luajit \
	--without-http_redis2_module  --with-http_iconv_module \
	--with-http_postgres_module -j$CPU_NUM \
	--with-http_iconv_module \
	--with-http_postgres_module \
	--with-luajit \
	--with-ipv6 \
	--with-http_realip_module          \
	--with-http_addition_module        \
	--with-http_xslt_module            \
	--with-http_image_filter_module    \
	--with-http_geoip_module           \
	--with-http_sub_module             \
	--with-http_dav_module             \
	--with-http_flv_module             \
	--with-http_gzip_static_module     \
	--with-http_auth_request_module    \
	--with-http_random_index_module    \
	--with-http_secure_link_module     \
	--with-http_degradation_module     \
	--with-http_stub_status_module     \
	--with-mail                       \
	--with-mail_ssl_module            \
	--with-google_perftools_module    \
	--with-cpp_test_module            \
	--with-pcre                       \
	--with-pcre-jit

make && make install
