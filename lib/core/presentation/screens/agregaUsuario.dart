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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Nickname Field
              TextField(
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
              ),
              const SizedBox(height: 20.0),

              // Email Field
              TextField(
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
              ),
              const SizedBox(height: 20.0),

              // Phone Field
              TextField(
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
              ),
              const SizedBox(height: 20.0),

              // Bank Name Field
              TextField(
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
              ),
              const SizedBox(height: 20.0),

              // Account Field
              TextField(
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
              ),
              const SizedBox(height: 25.0),

              // Add Button
              ElevatedButton(
                onPressed: () {
                  // Validar campos antes de enviar el evento
                  if (nicknameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneController.text.isEmpty ||
                      banknameController.text.isEmpty ||
                      accountController.text.isEmpty) {
                    // Muestra un mensaje de error si algún campo está vacío
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Todos los campos son obligatorios.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Aceptar'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

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
    );
  }
}
