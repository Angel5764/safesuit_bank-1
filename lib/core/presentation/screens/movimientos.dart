import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movimientos',
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
      body: ListView(
        children: <Widget>[
          _buildTransactionSection(
            date: '10 diciembre 2023',
            transactions: [
              _Transaction(
                title: 'MauricioCamara',
                subtitle: 'Enviaste',
                time: '2:13 p.m.',
                amount: '-\$19.00',
              ),
            ],
          ),
          _buildTransactionSection(
            date: '05 diciembre 2023',
            transactions: [
              _Transaction(
                title: 'mi OXXO APP',
                subtitle: 'Compraste',
                time: '3:29 p.m.',
                amount: '-\$50.00',
              ),
              _Transaction(
                title: 'Paypal',
                subtitle: 'Compraste',
                time: '4:50 p.m.',
                amount: '-\$90.00',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionSection({String? date, List<_Transaction>? transactions}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            date!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: transactions!.map((tx) => _buildTransactionCard(tx)).toList(),
        ),
      ],
    );
  }

  Widget _buildTransactionCard(_Transaction tx) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Color.fromRGBO(217, 217, 217, 1),
      child: ListTile(
        title: Text(tx.title),
        subtitle: Text('${tx.subtitle}\n${tx.time}'),
        trailing: Text(tx.amount),
        isThreeLine: true,
      ),
    );
  }
}

class _Transaction {
  final String title;
  final String subtitle;
  final String time;
  final String amount;

  _Transaction({required this.title, required this.subtitle, required this.time, required this.amount});
}
