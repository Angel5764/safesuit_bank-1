import 'package:flutter/material.dart';
import 'package:safesuit_bank/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetirarQR extends StatefulWidget {
  const RetirarQR({super.key});

  @override
  State<RetirarQR> createState() => _RetirarQRState();
}

class _RetirarQRState extends State<RetirarQR> {
  String _name = 'Cargando...';
  String _lastname = 'Cargando...';
  double _saldoDisponible = 0.0;
  final TextEditingController cantRetirarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token != null) {
        final apiService = ApiService();
        final userProfile = await apiService.getUserProfile(token);
        setState(() {
          _name = userProfile['name'] ?? 'Usuario';
          _lastname = userProfile['lastname'] ?? 'Apellido';
          _saldoDisponible = userProfile['saldoDisponible'] ?? 0.0;
        });
      } else {
        throw Exception('Token no encontrado');
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener el perfil del usuario')),
      );
    }
  }

  void _validateAndNavigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRCodeScreen()),
    );
  }

  void _onCantRetirarChanged(String value) {
    // Aquí puedes actualizar el estado si es necesario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Retirar dinero con QR',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 242, 244, 250)),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              BankCardWidget(
                name: _name,
                lastname: _lastname,
                saldoDisponible: _saldoDisponible,
                cantRetirarController: cantRetirarController,
                onCantRetirarChanged: _onCantRetirarChanged,
              ),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Genera tu código QR para retirar\n dinero sin tu tarjeta:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  _validateAndNavigate(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.qr_code,
                        size: 35,
                        color: Colors.white,
                      ),
                      Text(
                        'Generar QR',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class BankCardWidget extends StatelessWidget {
  final String name;
  final String lastname;
  final double saldoDisponible;
  final TextEditingController cantRetirarController;
  final ValueChanged<String> onCantRetirarChanged;

  BankCardWidget({
    Key? key,
    required this.name,
    required this.lastname,
    required this.saldoDisponible,
    required this.cantRetirarController,
    required this.onCantRetirarChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 214,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          const BoxShadow(
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
                decoration: const BoxDecoration(
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
              const SizedBox(height: 10),
              Text(
                '$name $lastname',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Cantidad a retirar:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              TextField(
                controller: cantRetirarController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: '00.00',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixText: '\$ ',
                  prefixStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onChanged: onCantRetirarChanged,
              ),
              const SizedBox(height: 10),
              const Text(
                'Saldo disponible:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                '\$ $saldoDisponible',
                style: const TextStyle(
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

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Text('QR Code Screen'),
      ),
    );
  }
}
