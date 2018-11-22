FROM ubuntu:18.04

LABEL maintainer="madhav.bnk@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends binutils \
    build-essential \
    curl \
    gdal-bin \
    less \
    python-gdal \
    libgeoip1 \
    libgeos-dev \
    libmysqlclient-dev \
    libproj-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    net-tools \
    netcat \
    python3-dev \
    software-properties-common \
    tzdata \
    unzip \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED=1 TZ=Asia/Kolkata APPUSER=bbadmin DJANGO_SETTINGS_MODULE=test_pytest.settings
ENV PYTHONUNBUFFERED=1 TZ=Asia/Kolkata APPUSER=bbadmin GEOS_VERSION=3.5.1 PROJ_VERSION=4.9.3 PROJ_DATUMGRID_VERSION=1.5 GDAL_VERSION=2.1.4 DJANGO_SETTINGS_MODULE=test_pytest.settings

WORKDIR /app/

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && groupadd --system ${APPUSER} \
    && useradd --no-log-init --system --create-home --gid ${APPUSER} ${APPUSER} \
    && usermod -u 1000 ${APPUSER} \
    && groupmod -g 1000 ${APPUSER} \
    && chown -Rv ${APPUSER}:${APPUSER} /app \
    && curl -L http://download.osgeo.org/geos/geos-${GEOS_VERSION}.tar.bz2 -o geos-${GEOS_VERSION}.tar.bz2 && tar xjf geos-${GEOS_VERSION}.tar.bz2 && rm geos-${GEOS_VERSION}.tar.bz2 && cd geos-${GEOS_VERSION} && ./configure && make && make install && ldconfig && cd .. && rm -rf geos-${GEOS_VERSION} \
    && curl -L http://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz -o proj-${PROJ_VERSION}.tar.gz && curl -L http://download.osgeo.org/proj/proj-datumgrid-${PROJ_DATUMGRID_VERSION}.tar.gz -o proj-datumgrid-${PROJ_DATUMGRID_VERSION}.tar.gz && tar xzf proj-${PROJ_VERSION}.tar.gz && rm proj-${PROJ_VERSION}.tar.gz && cd proj-${PROJ_VERSION}/nad && tar xzf ../../proj-datumgrid-${PROJ_DATUMGRID_VERSION}.tar.gz && rm ../../proj-datumgrid-${PROJ_DATUMGRID_VERSION}.tar.gz && cd .. && ./configure && make && make install && ldconfig && cd .. && rm -rf proj-${PROJ_VERSION} \
    && curl -L http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz -o gdal-${GDAL_VERSION}.tar.gz && tar xzf gdal-${GDAL_VERSION}.tar.gz && rm gdal-${GDAL_VERSION}.tar.gz && cd gdal-${GDAL_VERSION} && ./configure && make && make install && ldconfig && cd .. && rm -rf gdal-${GDAL_VERSION}

COPY --chown=bbadmin:bbadmin . /app/

USER ${APPUSER}

RUN /usr/bin/python3 -m venv --without-pip /app/venv \
    && curl https://bootstrap.pypa.io/get-pip.py -o /app/venv/get-pip.py \
    && /app/venv/bin/python3 /app/venv/get-pip.py \
    && /app/venv/bin/pip install --no-binary django -r requirements.txt

EXPOSE 8000

CMD [ "/app/venv/bin/python3" ]
