import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_trans_data.dart';
import 'package:safesuit_bank/core/presentation/bloc/transferencia/trans_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/transferencia/trans_state.dart' as bstate;
import 'package:safesuit_bank/data/repositories/transfer_repository_impl.dart';
import '../bloc/transferencia/trans_bloc.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/core/presentation/screens/TransMonto.dart';

class TransUser extends StatelessWidget {
  const TransUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferenciaBloc(LoadTransData(TransferRepositoryImpl()))
        ..add(LoadTransDataEvent()),
      child: const TransferenciasPage(),
    );
  }
}

class TransferenciasPage extends StatefulWidget {
  const TransferenciasPage({super.key});

  @override
  _TransferenciasPageState createState() => _TransferenciasPageState();
}

class _TransferenciasPageState extends State<TransferenciasPage> {
  TextEditingController cantidadController = TextEditingController(text: '\$0.00');
  String usuarioSeleccionado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferencias', 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 242, 244, 250)
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 32,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 59.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para agregar un nuevo usuario
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 0, 43, 135),
                backgroundColor: const Color.fromARGB(255, 212, 205, 197),
                minimumSize: const Size(358, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.centerLeft,
              ),
              child: const Text(
                'Agregar usuario',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 50.0),
            BlocBuilder<TransferenciaBloc, bstate.TransState>(
              builder: (context, state) {
                String namecontroller = state.ownertransfer;
                String cardnumber = state.numbercardtransfer;
                double amountransfer = state.amountransfer;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          usuarioSeleccionado = state.ownertransfer;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransMont(),
                          ),
                        );
                      },
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 212, 205, 197),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: const EdgeInsets.all(3),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$namecontroller\n$cardnumber \$$amountransfer',
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 0, 43, 135),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // }),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
            const SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}

class TransName extends StatelessWidget {
  final String usuarioSeleccionado;

  const TransName({Key? key, required this.usuarioSeleccionado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransName'),
      ),
      body: Center(
        child: Text('Usuario seleccionado: $usuarioSeleccionado'),
      ),
    );
  }
}
