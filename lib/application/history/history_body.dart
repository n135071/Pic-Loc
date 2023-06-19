import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_1/application/history/history_state.dart';
import 'package:test_1/application/history/histroy_bloc.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
        builder: (BuildContext context, HistoryState state) {
      if (state is HistoryFailed) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      if (state is HistoryCompleted) {
        if (state.history.isEmpty) {
          return const Center(
            child: Text('no history'),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: state.history.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('yyyy-MM-dd KK:mm').format(
                              DateTime.parse(

                                  state.history[index].attendanceTime!)),
                          // .toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        // .toString(),

                        const SizedBox(
                          width: 20,
                        ),
                        state.history[index].enter == true
                            ? const CircleAvatar(
                                backgroundColor: Colors.green,
                              )
                            : const CircleAvatar(
                                backgroundColor: Colors.red,
                              ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                );
              }),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
