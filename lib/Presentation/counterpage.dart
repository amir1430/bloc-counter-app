import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learining_bloc/Bloc/CounterBloc.dart';
import 'package:learining_bloc/Bloc/Events/CounterEvents.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('counter app'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('the counter is:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                BlocBuilder<CounterBloc, int>(
                  builder: (context, count) {
                    return Container(
                      child: Text('$count'),
                    );
                  },
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.remove),
                onPressed: () => counterBloc.add(CounterEvents.Decrement),
              ),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => counterBloc.add(CounterEvents.Increment),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
