import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:safesuit_bank/core/presentation/screens/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
  
}

class _LoginPage extends State<LoginPage> {
  
  bool _isChecked = false;

  String _phoneNumber = "";
  String _password = "";
  

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image(
        image: AssetImage("assets/images/Oxxo.png"),
        height: 175,
        fit: BoxFit.cover,
      ),
      TextField(
          decoration: InputDecoration(hintText: "Numero de telefono"),
          controller: TextEditingController(text: _phoneNumber)),
      TextField(
          decoration: InputDecoration(hintText: "Contraseña"),
          controller: TextEditingController(text: _password)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (newValue) => {setState(() => _isChecked = newValue!)},
            checkColor: Colors.blue,
            fillColor: MaterialStateProperty.all(Colors.red),
          ),
          Text("Mantener sesion activa"),
        ],
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeView()));
        },
        child: Text( "Presiona", style: TextStyle(color: Colors.black),),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
        
      ),
    ]
    );
  }
}
