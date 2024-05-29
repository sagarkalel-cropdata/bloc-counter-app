import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:bloc_counter_app/cubit/switch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final switchCubit = context.read<SwitchCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          BlocBuilder<SwitchCubit, bool>(builder: (context, state) {
            return Switch(
              value: state,
              onChanged: (value) => switchCubit.switchToggle(value),
            );
          }),
          const Text('Cubit/ Bloc '),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            /// Updating UI with the help of BlockConsumer
            BlocConsumer<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              listener: (context, state) {},
            ),

            /// Updating on UI with the help of blockBuilder
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) => Text(
                '$state',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            /// listening changes from [CounterCubit stream] and updating UI.
            StreamBuilder(
              stream: counterCubit.stream,
              builder: (context, snapshot) => Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            /// while accessing instance of [CounterCubit] if we make listen=true, below will update accordingly live
            Text(
              '${counterCubit.state}',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: counterCubit.inc,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: counterCubit.dec,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
