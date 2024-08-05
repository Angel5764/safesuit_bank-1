import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_trans_data.dart';
import 'package:safesuit_bank/core/presentation/bloc/transferencia/trans_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/transferencia/trans_state.dart' as bstate;
import 'package:safesuit_bank/core/presentation/screens/agregaUsuario.dart';
import 'package:safesuit_bank/data/repositories/transfer_repository_impl.dart';
import '../bloc/transferencia/trans_bloc.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/core/presentation/screens/TransMonto.dart';

class TransUser extends StatelessWidget {
  const TransUser({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = TransferRepositoryImpl();
    final loadTransData = LoadTransData(repository);

    return BlocProvider(
      create: (context) => TransferenciaBloc(loadTransData, repository)
        ..add(LoadTransferDataEvent()),
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
            color: Color.fromARGB(255, 242, 244, 250),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeView()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 32,
          ),
        ),
      ),
      body: SingleChildScrollView(  // Añadido para permitir desplazamiento si el contenido es grande
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 59.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddUserPage(),
                    ),
                  );
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
                  // Verifica si hay transferencias para mostrar
                  if (state.transfers.isEmpty) {
                    return const CircularProgressIndicator(); // Muestra un indicador de carga si la lista está vacía
                  } else {
                    // Muestra la lista de transferencias
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),  // Evita scroll de ListView anidado
                      itemCount: state.transfers.length,
                      itemBuilder: (context, index) {
                        final transfer = state.transfers[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              usuarioSeleccionado = transfer.nickname;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransMont(), // Asegúrate de pasar cualquier dato necesario
                              ),
                            );
                          },
                          child: Center(  // Envuelve el Container en Center para centrarlo
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,  // Usa el 85% del ancho disponible
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.symmetric(vertical: 8.0),  // Añade un margen vertical
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 212, 205, 197),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transfer.nickname,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 43, 135),
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Banco: ${transfer.bankname}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 0, 43, 135),
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    'Cuenta: ${transfer.account}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 0, 43, 135),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 25.0),
            ],
          ),
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
