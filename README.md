# Symfony v1.4
Configuración Inicial para ejecutar Symfony ver 1.4 usando  ```vagrant``` y la maquina virtual ```precise32```

## Aplicaciones Instaladas

* Maquina Virtual 'precise32'
* Ubuntu 12.04 LTS - Kernel 3.2.0-23-generic-pae i686
* PHP 5.3.10-1ubuntu3.21:
  -> libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql php-apc
* Apache/2.2.22 (Ubuntu)
* mysql  Ver 14.14 Distrib 5.5.46
* mysql-client mysql-server
* git version 1.7.9.5
* PhpMyAdmin
* curl 7.22.0

## Para Iniciar (Get started)

```
git clone git://github.com/jlobaton/symfony14.git
cd symfony14
```
.. editar el archivo ```Vagrantfile``` y personalizar el directorio de trabajo en la sección ```host_project* y guest_docroot```

```
"host_project_folder"  => "/home/schuma/NetBeansProjects/ClubAmerica",
"guest_project_folder" => "/home/vagrant/ClubAmerica",
"guest_docroot"        => "/home/vagrant/ClubAmerica/web",
```

...y una vez iniciado el vagrant, se empezará a instalar la maquina virtual [```precise32.box``` ](http://files.vagrantup.com/precise32.box).y todas las aplicaciones , y luego para tener acceso a la maquina inicial instalada, ejecutamos

```
vagrant up
```
... en el navegador colocar

```
http://33.33.333.1:8080
```

## Gracias (Thanks) 
