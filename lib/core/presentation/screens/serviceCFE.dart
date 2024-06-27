// lib/widgets/trans_agua.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagarcfeBloc(LoadPagarcfeData(PagarcfeRepositoryImpl()))
        ..add(LoadPagarcfeDataEvent()),
      child: BlocBuilder<PagarcfeBloc, PagarcfeState>(
        builder: (context, state) {
          if (kDebugMode) {
            print(state.toString());
          }
          TextEditingController NumSController = TextEditingController(
            text: state.Numservices,
          );
          TextEditingController ImporteController = TextEditingController(
            text: state.Importe.toString(),
          );

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
                      if (state.errorMessage.isNotEmpty)
                        Text(
                          state.errorMessage,
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
                        height: 50,
                        child: TextField(
                          controller: NumSController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 205, 205, 205),
                            hintText: 'Ingresar No.service',
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
                          onChanged: (value) {
                            context.read<PagarcfeBloc>().add(ImporteChanged(double.tryParse(value) ?? 0.0));
                          },
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const HomeView()),
                          );
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
    );
  }
}
