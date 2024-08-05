import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart'; // Import necesario para TextInputFormatter
import 'package:safesuit_bank/core/domain/usecases/load_pagaraguakan_repository.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/aguakan/pagaraguakan_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/aguakan/pagaraguakan_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/pagos/aguakan/pagaraguakan_state.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/data/repositories/pagaraguakan_repository_impl.dart';

class TransAgua extends StatefulWidget {
  const TransAgua({super.key});

  @override
  State<TransAgua> createState() => _TransAguaState();
}

class _TransAguaState extends State<TransAgua> {
  final TextEditingController NIAController = TextEditingController();
  final TextEditingController ImporteController = TextEditingController();
  String? niaError;
  String? importeError;

  @override
  void initState() {
    super.initState();
    NIAController.addListener(() {
      final NIAvalidacion = LoadPagaraguakanData().esNIAValido(NIAController.text);
      setState(() {
        niaError = NIAvalidacion ? null : 'NIA inválido deben tener 12 números.';
      });
    });
    ImporteController.addListener(() {
      final esValido = LoadPagaraguakanData().esDouble(ImporteController.text);
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
    NIAController.dispose();
    ImporteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagarcfeBloc(
          pagaraguakanRepository: PagaraguakanRepositoryImpl()),
      child: BlocListener<PagarcfeBloc, PagaraguakanState>(
        listener: (context, state) {
          if (state is PagaraguakanAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (state is PagaraguakanAuthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<PagarcfeBloc, PagaraguakanState>(
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
                        if (state is PagaraguakanAuthenticationFailure)
                          Text(
                            state.error,
                            style: const TextStyle(color: Colors.red),
                          ),
                        const SizedBox(height: 25.0),
                        Center(
                          child: Image.asset(
                            'assets/images/logo_aguakan.jpg',
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
                                  controller: NIAController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(255, 205, 205, 205),
                                    hintText: 'Ingresar NIA',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  ),
                                  inputFormatters: [LengthLimitingTextInputFormatter(12)], // Limitar a 12 caracteres
                                ),
                              ),
                              if (niaError != null)
                                Text(
                                  niaError!,
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
                            if (niaError == null && importeError == null) {
                              String nia = NIAController.text;
                              double importe = double.parse(ImporteController.text);
                              showDialog(
                                context: context,
                                builder: (BuildContext dialogContext) {
                                  return AlertDialog(
                                    title: const Text('Confirmación'),
                                    content: Text(
                                        '¿Está seguro de que desea realizar el pago de $importe para el NIA $nia?'),
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
                                              NIA: nia,
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
