import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_retiroqr_data.dart';
import 'package:safesuit_bank/core/presentation/bloc/retiroqr/retiroqr_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/retiroqr/retiroqr_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/retiroqr/retiroqr_state.dart';
import 'package:safesuit_bank/core/presentation/screens/QRCodeScreen.dart';
import 'package:safesuit_bank/data/repositories/retiroqr_repository_impl.dart';

class RetirarQR extends StatefulWidget {
  const RetirarQR({super.key});

  @override
  State<RetirarQR> createState() => _RetirarQRState();
}

class _RetirarQRState extends State<RetirarQR> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RetiroBloc(LoadRetiroData(RetiroqrRepositoryImpl()))
        ..add(LoadRetiroDataEvent()),
      child: BlocBuilder<RetiroBloc, RetiroState>(
        builder: (context, state) {
          //Imprmi datos
          if (kDebugMode) {
            print(state.toString());
          }
          TextEditingController userNameController = TextEditingController(
            text: state.username.toString(),
          );
          TextEditingController cantRetirarController = TextEditingController(
            text: state.cantRetirar.toString(),
          );
          
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Retirar dinero con QR',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 242, 244, 250)),
              ),
              backgroundColor: const Color.fromARGB(255, 66, 79, 120),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  BankCardWidget(
                    userNameController: userNameController, // Placeholder value
                    balance: 10.0, // Placeholder value
                    cantRetirarController: cantRetirarController,
                    onCantRetirarChanged: (value) {
                      // Handle value change
                    },
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
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const QRCodeScreen(),
                          ),
                        );
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
          );
        },
      ),
    );
  }
}

class BankCardWidget extends StatelessWidget {
  final TextEditingController userNameController;
  final double balance;
  final TextEditingController cantRetirarController;
  final ValueChanged<String> onCantRetirarChanged;

  const BankCardWidget({
    super.key,
    required this.userNameController,
    required this.balance,
    required this.cantRetirarController,
    required this.onCantRetirarChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 214,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
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
                userNameController.text,
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
                '\$ ${balance.toStringAsFixed(2)}',
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
