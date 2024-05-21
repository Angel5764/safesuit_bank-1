import 'dart:ffi';

class User {
  /*atributos
    name
    lastName
    telefono
    email
    password 
  */
  final String name;
  final String lastName;
  final String telefono;
  final String email;
  final String password;
  final Float money;

  User ({required this.name,
    required this.lastName,
    required this.telefono,
    required this.email,
    required this.password,
    required this.money
  });
}