import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final TextEditingController emailController =
      TextEditingController(text: 'deigotrujillo@email.com');
  final TextEditingController rfcController =
      TextEditingController(text: 'TUSD0GQRRGA0');
  final TextEditingController phoneController =
      TextEditingController(text: '9981529938');
  final TextEditingController passwordController =
      TextEditingController(text: 'xxxxxxxxxxxxxx');
  final TextEditingController bankController =
      TextEditingController(text: 'Safesuit Bank');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil',
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
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              'Diego Valentín Trujillo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(Icons.email, 'Correo', emailController),
            _buildTextField(Icons.description, 'RFC', rfcController),
            _buildTextField(Icons.phone, 'Teléfono', phoneController),
            _buildTextField(Icons.lock, 'Contraseña', passwordController,
                obscureText: true),
            _buildTextField(
              Icons.account_balance,
              'Banco',
              bankController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Funcionalidad del botón Guardar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF43A047), // Color del botón
                padding:
                    const EdgeInsets.symmetric(horizontal: 52, vertical: 20),
              ),
              child: const Text(
                'Guardar',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 242, 244, 250),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label,
      TextEditingController controller,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
