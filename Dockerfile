FROM python:3.8-buster
ENV PYTHONUNBUFFERED=1

RUN \
  echo "deb https://deb.nodesource.com/node_14.x buster main" > /etc/apt/sources.list.d/nodesource.list && \
  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
  apt-get update && \
  apt-get install -yqq nodejs git

# Add CommCare Sync codebase
RUN git clone https://github.com/dimagi/commcare-sync.git code
WORKDIR /code

RUN pip install -r requirements.txt

# Microsoft SQL Server Driver support for Debian 10 (Buster)
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc
RUN curl https://packages.microsoft.com/config/debian/10/prod.list | tee /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install -yqq msodbcsql18 unixodbc-dev
RUN pip install django-mssql-backend
