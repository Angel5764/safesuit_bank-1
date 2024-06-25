import 'package:flutter/material.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';
import 'package:safesuit_bank/core/presentation/screens/TransMonto.dart';

class TransUser extends StatelessWidget {
  const TransUser({super.key});

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
  TextEditingController cantidadController = TextEditingController(text: '\$0.00');
  String usuarioSeleccionado = ''; // Variable para almacenar el nombre del usuario seleccionado
  int numSecciones = 3; // Definición de la variable numSecciones

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
          onTap: (){
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
                // Lógica para agregar un nuevo usuario si es necesario
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 0, 43, 135),
                backgroundColor: const Color.fromARGB(255, 212, 205, 197),
                minimumSize: const Size(358, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.centerLeft, // Alinea el texto a la izquierda
              ),
              child: Text(
                'Agregar usuario',
                style: TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(height: 50.0),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                numSecciones,
                (index) {
                  List<Map<String, dynamic>> datos = [
                    {"nombre": "Cristofer Abad Islas Ramirez", "numero": "******1234"},
                    {"nombre": "Diego Trujillo Serrano", "numero": "******5678"},
                    {"nombre": "Sergio Cadenas Gonzales", "numero": "******9101"},
                  ];

                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            usuarioSeleccionado = datos[index]["nombre"]; // Guarda el nombre del usuario seleccionado
                          });
                          // Navega a la siguiente ventana sin mostrar el usuario seleccionado en la pantalla actual
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TransMont()));
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
                              '${datos[index]["nombre"]}\n${datos[index]["numero"]}',
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 43, 135)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Separación entre cada cuadro
                    ],
                  );
                },
              ),
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
        title: Text('TransName'),
      ),
      body: Center(
        child: Text('Usuario seleccionado: $usuarioSeleccionado'),
      ),
    );
  }
}
