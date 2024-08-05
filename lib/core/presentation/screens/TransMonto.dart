import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/mandaTransferencia/transferencia_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/mandaTransferencia/transferencia_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/mandaTransferencia/transferencia_state.dart';
import 'package:safesuit_bank/core/domain/usecases/load_transferir_data.dart';
import 'package:safesuit_bank/data/repositories/transferencia_repository_impl.dart';

class TransMont extends StatelessWidget {
  final String receptorNickname;
  final int receptorAccount;
  final String bankName;

  const TransMont({
    super.key,
    required this.receptorNickname,
    required this.receptorAccount,
    required this.bankName, 
  });

  @override
  Widget build(BuildContext context) {
    final repository = MandaTransferenciaRepositoryImpl();
    final loadTransData = LoadTransData(repository);

    return BlocProvider(
      create: (context) => MandaTransferenciaBloc(loadTransData),
      child: TransferenciasPage(
        receptorNickname: receptorNickname,
        receptorAccount: receptorAccount,
        bankName: bankName,
      ),
    );
  }
}

class TransferenciasPage extends StatefulWidget {
  final String receptorNickname;
  final int receptorAccount;
  final String bankName;
  const TransferenciasPage({
    super.key,
    required this.receptorNickname,
    required this.receptorAccount,
    required this.bankName, // Add bankName property
  });

  @override
  _TransferenciasPageState createState() => _TransferenciasPageState();
}

class _TransferenciasPageState extends State<TransferenciasPage> {
  final TextEditingController cantidadController =
      TextEditingController(text: '\$0.00');
  final TextEditingController conceptoController = TextEditingController();
  String cantidad = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferencias',
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
      body: BlocConsumer<MandaTransferenciaBloc, MandaTransferenciaState>(
        listener: (context, state) {
          if (state is MandaTransferenciaSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Transferencia realizada con éxito'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          } else if (state is MandaTransferenciaError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 16.0),
                Text(
                  'Receptor: ${widget.receptorNickname}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Banco: ${widget.bankName}', // Use the correct bankName
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: cantidadController,
                  textAlign: TextAlign.center,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cantidad',
                  ),
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Color.fromARGB(255, 66, 79, 120),
                  ),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    controller: conceptoController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 212, 205, 197),
                      hintText: 'Concepto',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
                const SizedBox(height: 25.0),
                ElevatedButton(
                  onPressed: () {
                    final amount = int.tryParse(
                            cantidadController.text.replaceAll('\$', '')) ??
                        0;
                    final concept = conceptoController.text.trim();

                    if (amount <= 0 || concept.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Por favor ingresa una cantidad y concepto válidos.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    context.read<MandaTransferenciaBloc>().add(
                          AgregarTransferenciaEvent(
                            receptorAccount: widget.receptorAccount,
                            amount: amount,
                            concept: concept,
                            owner: widget.receptorNickname, // Reemplaza por el nombre del dueño real
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 242, 244, 250),
                    backgroundColor: Colors.green,
                    minimumSize: const Size(150, 50),
                  ),
                  child: state is MandaTransferenciaLoading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 242, 244, 250)),
                        )
                      : const Text(
                          'Enviar',
                          style: TextStyle(fontSize: 20),
                        ),
                ),
                const SizedBox(height: 150.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
