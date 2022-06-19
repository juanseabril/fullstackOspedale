# Test de Conocimiento - Prueba FullStack
Se desarrollo una aplicación fullstack utilizando como base de datos no relacional MongoDB de forma local, se tiene una estructura definida para los usuarios, roles y eps. 

## FrontEnd: Flutter / Dart
Se utilizo como patron de diseño clean architecture, en el cual dejamos de forma independiente la data, el dominio, la ui, esto con el fin de poder realizar pruebas unitarias de cada modulo a futuro y tener un mayor control de nuestro código,
se ha realizado de forma nativa el uso de manejadores de estado, se ha desarrollado unicamente para web, utiliza la ultima versión de flutter.

## BackEnd: DJango / Python
Se utilizo como patron de diseño MVC, en el cual dejamos de forma independiente el modelo, la vista y el controlador, esto con el fin de poder modificar los endpoints sin afectar los demas, se dejo habilitado el manejo del CRUD para cada estructura de la base de datos, se utiliza la versión de python 3.9
