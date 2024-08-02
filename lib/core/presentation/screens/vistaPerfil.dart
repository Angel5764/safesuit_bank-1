import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/services/api_services.dart';
import 'package:safesuit_bank/core/presentation/bloc/perfil/perfil_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/perfil/perfil_state.dart';
import 'package:safesuit_bank/core/presentation/bloc/perfil/perfil_event.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PerfilBloc(ApiService())..add(LoadUserProfile()),
      child: Scaffold(
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
          child: BlocBuilder<PerfilBloc, PerfilState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.userName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(Icons.email, 'Correo', state.email, false),
                  _buildTextField(Icons.description, 'RFC', state.rfc, false),
                  _buildTextField(Icons.phone, 'Teléfono', state.phone, false),
                  _buildTextFieldRead(Icons.lock, 'Contraseña', state.password, true),
                  _buildTextFieldRead(Icons.account_balance, 'Banco', state.bank, false),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final updateData = {
                        'email': state.email,
                        'rfc': state.rfc,
                        'phone': state.phone,
                        'password': state.password,
                      };
                      context.read<PerfilBloc>().add(UpdateUserProfile(updateData));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF43A047),
                      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 20),
                    ),
                    child: const Text(
                      'Guardar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 242, 244, 250),
                      ),
                    ),
                  ),
                  if (state.isUpdated)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Perfil actualizado con éxito',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String label, String value, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: value),
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildTextFieldRead(IconData icon, String label, String value, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: TextEditingController(text: value),
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
