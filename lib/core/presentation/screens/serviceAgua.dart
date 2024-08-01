import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagaraguakanBloc(pagaraguakanRepository: PagaraguakanRepositoryImpl()),
      child: BlocListener<PagaraguakanBloc, PagaraguakanState>(
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
        child: BlocBuilder<PagaraguakanBloc, PagaraguakanState>(
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
                          height: 50,
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
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        SizedBox(
                          width: 300,
                          height: 50,
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
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        ElevatedButton(
                          onPressed: () {
                            if (LoadPagaraguakanData().esNIAValido(NIAController.text) &&
                                LoadPagaraguakanData().esDouble(double.tryParse(ImporteController.text) ?? 0.0)) {
                              context.read<PagaraguakanBloc>().add(
                                LoginButtonPressed(
                                  NIA: NIAController.text,
                                  importe: double.parse(ImporteController.text),
                                  context: context,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('NIA o Importe inválido')),
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
