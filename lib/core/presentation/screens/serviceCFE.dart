import 'package:flutter/material.dart';
import 'package:safesuit_bank/core/presentation/screens/paymentCFE.dart';

class TransCFE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pagar CFE',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 28, color: Color.fromARGB(255, 242, 244, 250)),
        ),
        backgroundColor: Color.fromARGB(255, 66, 79, 120),
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
                const SizedBox(height: 25.0),
                Center(
                  child: Image.asset(
                    'assets/images/logo_cfe.jpg', // Asegúrate de que el path a la imagen es el correcto.
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                SizedBox(height: 25.0),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 205, 205, 205),
                      hintText: 'No. de Servicio',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 205, 205, 205),
                      hintText: 'Importe',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PayCFEScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 242, 244, 250),
                    backgroundColor: Color.fromARGB(255, 66, 79, 120),
                    minimumSize: Size(150, 50),
                  ),
                  child: Text(
                    'Continuar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 150.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
