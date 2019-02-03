FROM wordpress:5

# install the PHP extensions we need
RUN set -ex; \
        \
        apt-get update; \
        apt-get install -y \
                libldap2-dev \
        ; \
        rm -rf /var/lib/apt/lists/*; \
        \
        docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu; \
        docker-php-ext-install ldap; \
	apt-get purge -y libldap2-dev

