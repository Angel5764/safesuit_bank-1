import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart'; // Import necesario para TextInputFormatter
import 'package:safesuit_bank/core/domain/usecases/load_pagarcfe_repository.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/cfe/pagarcfe_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/cfe/pagarcfe_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/cfe/pagarcfe_state.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/data/repositories/pagarcfe_repository_impl.dart';

class TransCFE extends StatefulWidget {
  const TransCFE({super.key});

  @override
  State<TransCFE> createState() => _TransCFEState();
}

class _TransCFEState extends State<TransCFE> {
  final TextEditingController NumservicesController = TextEditingController();
  final TextEditingController ImporteController = TextEditingController();
  String? NumservicesError;
  String? importeError;

  @override
  void initState() {
    super.initState();
    NumservicesController.addListener(() {
      final Numservicesvalidacion = LoadPagarcfeData().numeroCFEValido(NumservicesController.text);
      setState(() {
        NumservicesError = Numservicesvalidacion ? null : 'Numero es inválido deben tener 12 números.';
      });
    });
    ImporteController.addListener(() {
      final esValido = LoadPagarcfeData().esDouble(ImporteController.text);
      double? importe = double.tryParse(ImporteController.text);
      final rangoimporte = importe != null && importe > 200 && importe <= 10000;

      setState(() {
        if (!esValido) {
          importeError = 'Solo usar números y un punto decimal.';
        } else if (!rangoimporte) {
          importeError = 'Importe mínimo 200, máximo 10000.';
        } else {
          importeError = null;
        }
      });
    });
  }

  @override
  void dispose() {
    NumservicesController.dispose();
    ImporteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagarcfeBloc(
          pagarcfeRepository: PagarcfeRepositoryImpl()),
      child: BlocListener<PagarcfeBloc, PagarcfeState>(
        listener: (context, state) {
          if (state is PagarcfeAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (state is PagarcfeAuthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<PagarcfeBloc, PagarcfeState>(
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
                        if (state is PagarcfeAuthenticationFailure)
                          Text(
                            state.error,
                            style: const TextStyle(color: Colors.red),
                          ),
                        const SizedBox(height: 25.0),
                        Center(
                          child: Image.asset(
                            'assets/images/logo_cfe.jpg',
                            width: 150.0,
                            height: 150.0,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: 300,
                          height: 70, // Altura fija para el contenedor
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50, // Altura fija para el TextField
                                child: TextField(
                                  controller: NumservicesController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(255, 205, 205, 205),
                                    hintText: 'Ingresar el numero de servicio',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  ),
                                  inputFormatters: [LengthLimitingTextInputFormatter(12)], // Limitar a 12 caracteres
                                ),
                              ),
                              if (NumservicesError != null)
                                Text(
                                  NumservicesError!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: 300,
                          height: 70, // Altura fija para el contenedor
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50, // Altura fija para el TextField
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
                                Text(
                                  importeError!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        ElevatedButton(
                          onPressed: () {
                            if (NumservicesError == null && importeError == null) {
                              String numservices = NumservicesController.text;
                              double importe = double.parse(ImporteController.text);
                              showDialog(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: const Text('Confirmación'),
                                    content: Text(
                                        '¿Está seguro de que desea realizar el pago de $importe para el numero de servicio $numservices?'),
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
                                          BlocProvider.of<PagarcfeBloc>(context).add(
                                            LoginButtonPressed(
                                              Numservices: numservices,
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
