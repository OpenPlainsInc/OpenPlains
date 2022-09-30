# OpenPlains

![logo](./images/banner_v1_500px.png)

> Currently migrating project from TomorrowNowApp repository.

OpenPlains is a GRASS GIS platform that enable running GRASS GIS in the cloud using Actinia as its geospatial computational API.

Manage your grassdata from the interactive data view.
![data](./images/data_view.png)

Explore metadata.
![data](./images/info_view.png)

Find and run GRASS modules.
![data](./images/grass_modules_view.png)

Build Custom Applications
![video](./images/stormy_loader-optimized.gif)

<!-- [![react-savana-tests](https://github.com/tomorrownow/OpenPlains/actions/workflows/node.js.yml/badge.svg)](https://github.com/tomorrownow/OpenPlains/actions/workflows/node.js.yml)
[![django-savana-tests](https://github.com/tomorrownow/OpenPlains/actions/workflows/django.yml/badge.svg)](https://github.com/tomorrownow/OpenPlains/actions/workflows/django.yml) -->

> **Disclaimer:** The OpenPlains project is currently in an experimental phase and therefore breaking changes and project restructuring will occur without notice. We recommend waiting until the first stable version is released before considering using the project in any form.

## Getting Started

Docker compose containers and client port bindings.

| Service  | Description | Port |
| -----------   | ----------- | -------- |
| api           | Django 4.2.1  | 8005     |
| actinia | Actinia 4.1.0 | 8088     |
| webapp      | React       | 3000     |
| db      | Postgresql + PostGIS | 5431 |
| actinia-redis | redis | 6379 |
| django-redis-cache |  redis | 6370 |
| celery_worker |  celery | NA |
| titiler | titiler | 7000 |
| geoserver | geoserver | 8600 |

### Configuration

#### Settings

### Start app

```bash
docker-compose up
```

### Stop app

```bash
docker-compose down
```

## API

### Create new app

Run inside of web container

```bash
docker-compose run api python manage.py startapp <appname>
```

Creates or updates models and store changes as a migration

```bash
# Create migrations
docker-compose run api python manage.py makemigrations <appname>

# Apply changes to database
docker-compose run api python manage.py migrate
```

### Collect Static Files

```bash
docker-compose run api python manage.py collectstatic
```

### View Django urls

```bash
docker-compose run api python manage.py show_urls
```

### Start Django Shell

```bash
docker-compose run api python manage.py shell
```

#### Start Django Jupyter Notebook

```bash
docker-compose run api python manage.py shell_plus --notebook
```

```python
from savana.utils import actinia
actinia.locations()
```

### Testing

```bash
docker-compose run api python manage.py test <appname>
```

## Front End (webapp/)

### Install new NPM modules

<https://www.docker.com/blog/keep-nodejs-rockin-in-docker/>

```bash

docker-compose run webapp npm install

```
