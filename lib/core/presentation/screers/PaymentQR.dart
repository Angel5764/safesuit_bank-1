import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/usecases/load_retiroqr_data.dart';
import 'package:safesuit_bank/core/presentation/screers/QRCodeScreen.dart';
import 'package:safesuit_bank/core/presentation/bloc/retiroqr/retiroqr_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/retiroqr/retiroqr_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/retiroqr/retiroqr_state.dart';

class RetirarQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RetiroBloc(
        context.read<Usz>(), // Añadiendo el argumento necesario
      )..add(LoadRetiroDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Retirar dinero con QR',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 242, 244, 250)),
          ),
          backgroundColor: Color.fromARGB(255, 66, 79, 120),
        ),
        body: BlocBuilder<RetiroBloc, RetiroState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    BankCardWidget(
                      userName: state.username,
                      balance: state.saldoDisponible,
                      cantRetirar: state.cantRetirar,
                      onCantRetirarChanged: (value) {
                        context.read<RetiroBloc>().add(CantRetirarChanged(double.tryParse(value) ?? 0.0));
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
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
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => QRCodeScreen()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
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
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BankCardWidget extends StatelessWidget {
  final String userName;
  final double balance;
  final double cantRetirar;
  final ValueChanged<String> onCantRetirarChanged;
  final TextEditingController _controller = TextEditingController();

  BankCardWidget({
    Key? key,
    required this.userName,
    required this.balance,
    required this.cantRetirar,
    required this.onCantRetirarChanged,
  }) : super(key: key) {
    _controller.text = cantRetirar.toString();
  }

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
                controller: _controller,
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
                onChanged: onCantRetirarChanged,
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
