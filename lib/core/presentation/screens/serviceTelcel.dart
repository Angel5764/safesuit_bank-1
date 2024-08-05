import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart'; // Import necesario para TextInputFormatter
import 'package:safesuit_bank/core/presentation/bloc/pagos/telcel/pagartelcel_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/telcel/pagartelcel_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/telcel/pagartelcel_state.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/data/repositories/pagartelcel_repository_impl.dart';

import '../../domain/usecases/load_pagartelcel_repository.dart';

class TransTelcel extends StatefulWidget {
  const TransTelcel({super.key});

  @override
  State<TransTelcel> createState() => _TransTelcelState();
}

class _TransTelcelState extends State<TransTelcel> {
  final TextEditingController NoTelcelController = TextEditingController();
  final TextEditingController ImporteController = TextEditingController();
  String? NumservicesError;
  String? importeError;

  @override
  void initState() {
    super.initState();
    NoTelcelController.addListener(() {
      final NoTelcelvalidacion = LoadPagartelcelData().esUnTelefono(NoTelcelController.text);
      setState(() {
        NumservicesError = NoTelcelvalidacion ? null : 'El número debe iniciar con 998 y tener 10 digitos.';
      });
    });
    ImporteController.addListener(() {
      final esValido = LoadPagartelcelData().esDouble(ImporteController.text);
      double? importe = double.tryParse(ImporteController.text);
      final rangoimporte = importe != null && importe >= 9 && importe <= 5000;

      setState(() {
        if (!esValido) {
          importeError = 'Solo usar números y un punto decimal.';
        } else if (!rangoimporte) {
          importeError = 'Importe mínimo 9, máximo 5000.';
        } else {
          importeError = null;
        }
      });
    });
  }

  @override
  void dispose() {
    NoTelcelController.dispose();
    ImporteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagartelcelBloc(pagartelcelRepository: PagartelcelRepositoryImpl()),
      child: BlocListener<PagartelcelBloc, PagartelcelState>(
        listener: (context, state) {
          if (state is PagartelcelAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (state is PagartelcelAuthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<PagartelcelBloc, PagartelcelState>(
          builder: (context, state) {
            if (kDebugMode) {
              print(state.toString());
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Transferir',
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
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        if (state is PagartelcelAuthenticationFailure)
                          Text(
                            state.error,
                            style: const TextStyle(color: Colors.red),
                          ),
                        const SizedBox(height: 25.0),
                        Center(
                          child: Image.asset(
                            'assets/images/logo_telcel.png',
                            width: 150.0,
                            height: 150.0,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: 300,
                          height: 80, // Altura fija para el contenedor
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 35, // Altura fija para el TextField
                                child: TextField(
                                  controller: NoTelcelController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(255, 205, 205, 205),
                                    hintText: 'Ingresar el número de Telcel',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  ),
                                  inputFormatters: [LengthLimitingTextInputFormatter(10)], // Limitar a 10 caracteres
                                ),
                              ),
                              if (NumservicesError != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    NumservicesError!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: 300,
                          height: 80, // Altura fija para el contenedor
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 35, // Altura fija para el TextField
                                child: TextField(
                                  controller: ImporteController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(255, 205, 205, 205),
                                    hintText: 'Importe',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(7), // Limitar a 7 caracteres
                                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')), // Permitir solo números y un punto
                                  ],
                                ),
                              ),
                              if (importeError != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    importeError!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        ElevatedButton(
                          onPressed: () {
                            if (NumservicesError == null && importeError == null) {
                              String NoTelcel = NoTelcelController.text;
                              double importe = double.parse(ImporteController.text);
                              showDialog(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: const Text('Confirmación'),
                                    content: Text(
                                        '¿Está seguro de que desea realizar el pago de $importe para el número de Telcel $NoTelcel?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop(); // Cierra el diálogo
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(dialogContext).pop();
                                          BlocProvider.of<PagartelcelBloc>(context).add(
                                            LoginButtonPressed(
                                              NoTelcel: NoTelcel,
                                              importe: importe,
                                              context: context,
                                            ),
                                          );
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => const HomeView()),
                                          );
                                        },
                                        child: const Text('Aceptar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 242, 244, 250),
                            backgroundColor: const Color.fromARGB(255, 66, 79, 120),
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            'Continuar',
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
          },
        ),
      ),
    );
  }
}
