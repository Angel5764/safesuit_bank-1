import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Inicializo mi variable global de notificaciones
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('launch_background');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> _showNotification() async {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('1', 'SafesuitBank',
          importance: Importance.max, priority: Priority.high);

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Transferencia',
    'Haz hecho una transferencia',
    platformChannelSpecifics,
    payload: 'payload',
  );
}

class PayAguaScreen extends StatelessWidget {

  Future<void> showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // El usuario debe tocar un botón para cerrar el diálogo
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(20),
          title: Center(child: Text('Pago Exitoso')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Recibo enviado al correo electrónico.', style: TextStyle(color: Colors.black87)),
              SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción para descargar el comprobante
                      print('Descargando comprobante');
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(150, 50),
                    ),
                    child: Text('Descargar comprobante', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para salir
                      print('Saliendo');
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(150, 50),
                    ),
                    child: Text('Salir', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferir pago',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 242, 244, 250),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 66, 79, 120),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Monto a pagar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 79, 120),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Text(
                '\$1,993.00',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 79, 120),
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Text(
                '*No incluye manejo de cuenta ni reconexiones por documentos vencidos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 79, 120),
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Fecha límite de pago:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 79, 120),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '15 - Abril - 2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 79, 120),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Periodo: Abril 2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 79, 120),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  print('Cantidad ingresada: \$1,993.00');
                  _showNotification();
                  showAlertDialog(context); // Mostrar el diálogo
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 242, 244, 250),
                  backgroundColor: Colors.green,
                  minimumSize: Size(150, 50),
                ),
                child: Text(
                  'Enviar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}