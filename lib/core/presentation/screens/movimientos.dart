import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesuit_bank/core/domain/entities/movimientos.dart';
import 'package:safesuit_bank/core/domain/models/movimientosModel.dart';
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
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
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
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state.transactions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: state.transactions.length,
              itemBuilder: (context, index) {
                final transaction = state.transactions[index];
                return _buildTransactionCard(transaction);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTransactionCard(MovimientosModel transaction) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.swap_horiz,
            color: Colors.blueGrey[800],
            size: 40.0,
          ),
          title: Text(
            transaction.concept,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amount: \$${transaction.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Text(
                'From: ${transaction.senderAccount}',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'To: ${transaction.receptorAccount}',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 16.0,
                backgroundColor: Colors.blueGrey[100],
                child: Text(
                  transaction.owner[0],
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  transaction.owner,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
