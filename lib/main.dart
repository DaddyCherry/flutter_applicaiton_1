import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Navigator'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => func(),
              child: const Text('シンプルボタン'),
            ),
            textSection
          ],
        ));
  }
}

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: SelectableText(text),
);

const text = 'This is text';

void func() {
  debugPrint('pushed!!');
  callApi();
}

Future<http.Response> callApi() async {
  const url = 'https://notify-api.line.me/api/notify';
  const token = 'H56icg4qatjE7jETqKgZFIxt6hL0k6Kv0D6bZsPJCg0';

  final response = await http.post(
    Uri.https('notify-api.line.me', '/api/notify', {'message': 'TEST!'}),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  return response;
}
