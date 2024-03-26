# docker-commcare-sync

Docker image that contains the commcare-sync application:
https://github.com/dimagi/commcare-sync

### Development

To build this image locally:

```docker build --rm -t partnersinhealth/commcare-sync .```

### Using this image

This image has been specifically created to add in capabilities for connecting with SQL Server Database on top of the
base commcare sync capabilities.

To connect to a Microsoft SQL Server database, you need to use a Connection String in your configuration like this:

```mssql+pyodbc://{username}:{password}@{host}:1433/{database_name}?driver=ODBC+Driver+18+for+SQL+Server&TrustServerCertificate=yes```