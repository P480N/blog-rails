# blog-rails
Blog desarrollado en Ruby on Rails 4.2.6

## Requisitos para instalar la aplicación:
Tener instalado Ruby 2.3.0p0

## Instalación

La instalación de la aplicación se realiza por línea de comandos.

Primero se instalar las gemas del proyecto:

```sh
$ sudo apt-get install libmysqlclient-dev
$ bundle install
```

Luego se debe crea la BD:

```sh
$ rake db:create
```

Finalmente se realiza la migración de las tablas:

```sh
$ rake db:migrate
```

## Tecnologías utilizadas:
- Ruby 2.3.0p0
- Rails 4.2.6
- devise
- Bootstrap 3.3.7