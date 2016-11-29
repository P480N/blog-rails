# blog-rails
Blog desarrollado en Ruby on Rails 4.2.6

## Requisitos para instalar la aplicación:
Tener instalado 
- Ruby 2.3.0p0
- MySQL (u otro motor de BD)
- libmysqlclient-dev
- imagemagick

## Instalación

La instalación de la aplicación se realiza por línea de comandos.

Instalar libmysqlclient-dev:

```sh
$ sudo apt-get install libmysqlclient-dev
```

Primero se instalar las gemas del proyecto:

```sh
$ bundle install
```

Instalar imagemagick:

En Ubuntu 14.04.

Primero instalar imagemagick y luego libmagickwand-dev:

```sh
$ sudo apt-get install imagemagick
$ sudo apt-get install libmagickwand-dev
```

En Mac OS X:

```sh
$ brew install imagemagick
```

Para verificar si quedo correctamente instalado:

```sh
$ convert -version
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