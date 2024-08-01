import 'package:flutter/material.dart';
import 'package:safesuit_bank/core/presentation/screens/TransSelecionUser.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddUserForm();
  }
}

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

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
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 212, 205, 197),
                  hintText: 'Nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
                style: const TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 66, 79, 120)),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 212, 205, 197),
                  hintText: 'Número de Tarjeta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                ),
                style: const TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 66, 79, 120)),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  print('Nombre: ${nameController.text}, Número de Tarjeta: ${cardNumberController.text}');
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
