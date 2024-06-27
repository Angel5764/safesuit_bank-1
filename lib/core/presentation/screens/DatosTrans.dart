import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:safesuit_bank/core/presentation/screens/TransMonto.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';

class DataTrans extends StatelessWidget {
  const DataTrans({super.key});

  @override
  Widget build(BuildContext context) {
    return const TransferenciasPage();
  }
}

class TransferenciasPage extends StatefulWidget {
  const TransferenciasPage({super.key});

  @override
  _TransferenciasPageState createState() => _TransferenciasPageState();
}

class _TransferenciasPageState extends State<TransferenciasPage> {
  TextEditingController cantidadController = TextEditingController();

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => TransMont()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 242, 244, 250),
            size: 32,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 59.0),
            Text(
              'Datos de emisor',
              style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 66, 79, 120), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 212, 205, 197),
              ),
              child: const Text(
                "Datos de emisor de ejemplo",
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 66, 79, 120)),
              ),
            ),
            const SizedBox(height: 65.0),
            Text(
              'Datos de receptor',
              style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 66, 79, 120), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 212, 205, 197),
              ),
              child: const Text(
                'Datos de receptor de ejemplo',
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 66, 79, 120)),
              ),
            ),
            const SizedBox(height: 65.0),
            Text(
              'Monto',
              style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 66, 79, 120), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 212, 205, 197),
              ),
              child: const Text(
                '\$350',
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 66, 79, 120)),
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 78.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.only(top: 60, bottom: 0),
                        title: const Center(
                          child: Text(
                            "Transferencia exitosa",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(150, 60),
                                foregroundColor: const Color.fromARGB(255, 242, 244, 250),
                                backgroundColor: const Color.fromARGB(255, 30, 136, 229),
                              ),
                              child: const Text(
                                "Descargar comprobante",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(252, 60),
                                foregroundColor: const Color.fromARGB(255, 242, 244, 250),
                                backgroundColor: const Color.fromARGB(255, 67, 160, 71),
                              ),
                              child: const Text(
                                "Salir",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 242, 244, 250),
                  backgroundColor: Colors.green,
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  'Enviar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
