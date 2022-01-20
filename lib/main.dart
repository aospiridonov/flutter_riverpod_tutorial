import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class FakeHttpClient {
  Future<String> get(String url) async {
    await Future.delayed(const Duration(seconds: 1));
    return 'Responce from $url';
  }
}

final fakeHttpClientProvider = Provider((ref) => FakeHttpClient());
final responceProvider =
    FutureProvider.family<String, String>((ref, url) async {
  final httpClient = ref.read(fakeHttpClientProvider);
  return httpClient.get(url);
});

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        body: Center(
          child: Consumer(
            builder: (context, ref, child) {
              final responseAsyncValue =
                  ref.watch(responceProvider('https://youtube.com'));
              return responseAsyncValue.map(
                data: (_) => Text(_.value),
                error: (_) => Text(
                  _.error.toString(),
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                loading: (_) => CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
