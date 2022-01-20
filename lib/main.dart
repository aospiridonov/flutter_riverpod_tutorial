import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class IncrementNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Tutorial'),
        ),
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final incrementNotifier = ref.watch(incrementProvider);
              return Text(incrementNotifier.value.toString());
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(incrementProvider).increment();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
