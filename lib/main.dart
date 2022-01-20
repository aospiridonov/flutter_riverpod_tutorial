import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Tutorial'),
        ),
        body: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MyFirstClass(),
      child: ProxyProvider<MyFirstClass, MySecondClass>(
        update: (context, firstClass, previous) => MySecondClass(firstClass),
        child: Builder(
          builder: (context) {
            return Text(Provider.of<MySecondClass>(context).myFirstClass.value);
          },
        ),
      ),
    );
  }
}

class MyFirstClass {
  final value = 'hello';
}

class MySecondClass {
  final MyFirstClass myFirstClass;
  MySecondClass(this.myFirstClass);
}
