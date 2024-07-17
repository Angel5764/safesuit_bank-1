import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:safesuit_bank/services/api_services.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  String _userName = 'Cargando...';

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token != null) {
        final userProfile = (await _apiService.getUserProfile(token))["data"];
        setState(() {
          _userName = userProfile['name'] ?? 'Usuario';
          emailController.text = userProfile['email'] ?? '';
          rfcController.text = userProfile['rfc'] ?? '';
          phoneController.text = userProfile['phone'] ?? '';
          passwordController.text = 'xxxxxxxxxxx';
          bankController.text = 'Safesuit Bank';
        });
      } else {
        throw Exception('Token no encontrado');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token != null) {
        final updateData = {
          'email': emailController.text,
          'rfc': rfcController.text,
          'phone': phoneController.text,
          'password': passwordController.text,
        };

        await _apiService.updateUserProfile(token, updateData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perfil actualizado con éxito')),
        );
      } else {
        throw Exception('Token no encontrado');
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al actualizar el perfil')),
      );
    }
  }

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
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
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
            Text(
              _userName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(Icons.email, 'Correo', emailController),
            _buildTextField(Icons.description, 'RFC', rfcController),
            _buildTextField(Icons.phone, 'Teléfono', phoneController),
            _buildTextFieldRead(Icons.lock, 'Contraseña', passwordController,
                obscureText: true),
            _buildTextFieldRead(
              Icons.account_balance,
              'Banco',
              bankController,
              
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUserProfile,
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
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

    Widget _buildTextFieldRead(IconData icon, String label,
      TextEditingController controller,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        readOnly: true,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
