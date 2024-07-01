import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:safesuit_bank/core/domain/entities/movimientos.dart';
import 'package:safesuit_bank/core/domain/usecases/load_movimientos_data.dart';
import 'package:safesuit_bank/core/domain/repositories/movimientos_repository.dart';
import 'package:safesuit_bank/core/presentation/bloc/movimientos/movimientos_bloc.dart';
import 'package:safesuit_bank/core/presentation/bloc/movimientos/movimientos_event.dart';
import 'package:safesuit_bank/core/presentation/bloc/movimientos/movimientos_state.dart';
import 'package:safesuit_bank/data/repositories/movimientos_repository_impl.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovimientosRepository movimientosRepository = MovimientosRepositoryImpl();
    final MovimientosBloc movimientosBloc = MovimientosBloc(LoadMovimientosData(movimientosRepository));
    movimientosBloc.add(LoadMovimientosDataEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movimientos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 242, 244, 250),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 66, 79, 120),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (_) => movimientosBloc,
        child: BlocBuilder<MovimientosBloc, MovimientosState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            if (state.transactions.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                final transaction = state.transactions[index];
                return _buildTransactionSection(
                  date: transaction.fecha,
                  transactions: [transaction],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTransactionSection({required DateTime date, required List<TransactionEntity> transactions}) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            formattedDate,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: transactions.map((tx) => _buildTransactionCard(tx)).toList(),
        ),
      ],
    );
  }

  Widget _buildTransactionCard(TransactionEntity tx) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(tx.fecha);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Color.fromRGBO(217, 217, 217, 1),
      child: ListTile(
        title: Text(tx.username),
        subtitle: Text('Fecha: $formattedDate\nStatus: ${tx.status}'),
        trailing: Text(tx.monto.toString()),
        isThreeLine: true,
      ),
    );
  }
}
