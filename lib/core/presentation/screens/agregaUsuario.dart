import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/transferencia/trans_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/transferencia/trans_event.dart';
import 'package:safesuit_bank/core/domain/usecases/load_trans_data.dart';
import 'package:safesuit_bank/core/presentation/screens/TransSelecionUser.dart';
import 'package:safesuit_bank/data/repositories/transfer_repository_impl.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = TransferRepositoryImpl();
    final loadTransData = LoadTransData(repository);

    return BlocProvider(
      create: (context) => TransferenciaBloc(loadTransData, repository),
      child: const AddUserForm(),
    );
  }
}

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController banknameController = TextEditingController();
  TextEditingController accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar Usuario',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 242, 244, 250),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 242, 244, 250),
            size: 32,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Nickname Field
                TextFormField(
                  controller: nicknameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 212, 205, 197),
                    hintText: 'Nickname',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un nickname';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'El nickname solo puede contener letras';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),

                // Email Field
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 212, 205, 197),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un correo electrónico';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Por favor ingresa un correo válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),

                // Phone Field
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 212, 205, 197),
                    hintText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un número de teléfono';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'El número de teléfono debe tener 10 dígitos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),

                // Bank Name Field
                TextFormField(
                  controller: banknameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 212, 205, 197),
                    hintText: 'Bank Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el nombre del banco';
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return 'El nombre del banco solo puede contener letras';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),

                // Account Field
                TextFormField(
                  controller: accountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 212, 205, 197),
                    hintText: 'Account Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un número de cuenta';
                    }
                    if (!RegExp(r'^\d{12,16}$').hasMatch(value)) {
                      return 'El número de cuenta debe tener entre 12 y 16 dígitos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25.0),

                // Add Button
                ElevatedButton(
                  onPressed: () {
                    // Validar formulario antes de enviar el evento
                    if (_formKey.currentState!.validate()) {
                      // Envía el evento para agregar un nuevo contacto
                      context.read<TransferenciaBloc>().add(
                            AddTransferEvent(
                              nickname: nicknameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              bankname: banknameController.text,
                              account: accountController.text,
                            ),
                          );

                      // Mostrar mensaje de éxito
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          backgroundColor: Colors.white,
                          title: Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green),
                              SizedBox(width: 10),
                              Text(
                                'Éxito',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          content: Text(
                            'Usuario agregado correctamente.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const TransUser()),
                                );
                              },
                              child: Text(
                                'Aceptar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 242, 244, 250),
                    backgroundColor: Colors.green,
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    'Agregar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 150.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
