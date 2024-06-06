import 'package:flutter/material.dart';
import 'package:safesuit_bank/core/presentation/screers/QRCodeScreen.dart';


class RetirarQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String userName = 'Angel Zea';
    final double balance = 100000.00;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Retirar dinero con QR',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, color: Color.fromARGB(255, 242, 244, 250)),
        ),
        backgroundColor: Color.fromARGB(255, 66, 79, 120),
      ),
      body: SingleChildScrollView( // Esto permite el desplazamiento cuando el contenido es más grande que la pantalla.
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Un poco de espacio en la parte superior
              BankCardWidget(
                userName: userName, // Pasas el userName aquí.
                balance: balance, // Y el balance aquí.
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Genera tu código QR para retirar\n dinero sin tu tarjeta:',
                      textAlign: TextAlign.center, // Asegura el centrado del texto en su línea
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Espacio entre el widget de la tarjeta y el botón
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QRCodeScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(15), // Esto crea el espacio alrededor del icono y el texto
                  decoration: BoxDecoration(
                    color: Colors.blue, // Color de fondo
                    shape: BoxShape.circle, // Esto hará que sea un círculo
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Mantener el contenido al mínimo
                    mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido
                    children: <Widget>[
                      Icon(
                        Icons.qr_code, // Icono de QR
                        size: 35, // Tamaño del icono más grande
                        color: Colors.white,
                      ),
                      Text(
                        'Generar QR', // Texto sobre el icono
                        style: TextStyle(
                          fontSize: 10, // Tamaño de fuente ajustado para que quepa
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Espacio al final del botón
            ],
          ),
        ),
      ),
    );
  }
}


class BankCardWidget extends StatelessWidget {
  final String userName;
  final double balance;

  const BankCardWidget({
    Key? key,
    required this.userName, 
    required this.balance, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 198,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/patron_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                userName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Cantidad a retirar:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  prefixStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Saldo disponible:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                '\$ ${balance.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
