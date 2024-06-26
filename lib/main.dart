import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:safesuit_bank/core/presentation/screers/home.dart';
import 'package:safesuit_bank/core/presentation/screers/UserRegistration.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //initializeNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Suit Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isChecked = false;
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
          localizedReason: "Autenticate para acceder",
          options: const AuthenticationOptions(stickyAuth: true, useErrorDialogs: true));
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: ((context) => HomeView())));
    } else {
      print("fallo auth");
    }
  }


  @override
  Widget build(BuildContext context) {
    // Las variables _isChecked, _phoneNumber y _password deberían definirse fuera del método build para evitar redeclaraciones en cada reconstrucción. Aquí se mantienen para coincidir con la estructura del código proporcionado.
    String _phoneNumber = "";
    String _password = "";

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(11.0),
          width: 480,
          height: 566,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black, 
              width: 2.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/images/Logo.jpg"),
                height: 200,
                fit: BoxFit.contain,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Numero de telefono"),
                controller: TextEditingController(text: _phoneNumber)
              ),
              TextField(
                decoration: InputDecoration(hintText: "Contraseña"),
                controller: TextEditingController(text: _password)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (newValue) {
                      setState(() => _isChecked = newValue!);
                    },
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.all(Colors.white),
                  ),
                  Text("Mantener sesion activa"),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
                },
                child: Text(
                  "Inicia sesión",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                ),
              ),
              const Text("\nO"),              
              IconButton(
                onPressed: () => {_auth(), },
                icon: const Icon(Icons.fingerprint, size: 50,)
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserRegistrationView()));
                },
                child: Text(
                  "registrarse",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
