import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

final firstStringProvider = Provider((ref) => 'First');
final secondStringProvider = Provider((ref) => 'Second');

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final first = ref.watch(firstStringProvider);
    final second = ref.watch(secondStringProvider);
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        body: Column(
          children: [
            Text(
              first,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              second,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
