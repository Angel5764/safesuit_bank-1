import 'package:flutter/material.dart';
import 'package:safesuit_bank/main.dart';


class UserRegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrar Usuario',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 242, 244, 250),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 66, 79, 120),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 25.0),
                _buildTextField('Nombre'),
                SizedBox(height: 25.0),
                _buildTextField('Apellido'),
                SizedBox(height: 25.0),
                _buildTextField('Correo Electrónico'),
                SizedBox(height: 25.0),
                _buildTextField('RFC'),
                SizedBox(height: 25.0),
                _buildTextField('Teléfono'),
                SizedBox(height: 25.0),
                _buildTextField('Contraseña', obscureText: true),
                SizedBox(height: 25.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 242, 244, 250),
                    backgroundColor: Color.fromARGB(255, 66, 79, 120),
                    minimumSize: Size(150, 50),
                  ),
                  child: Text(
                    'Registrar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 150.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {bool obscureText = false}) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 205, 205, 205),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: UserRegistrationView(),
));
