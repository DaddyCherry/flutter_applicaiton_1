import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
  _handleHttp();
}

Future<void> _handleHttp() async {
  var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': 'Flutter'});

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    debugPrint('Number of books about http: $itemCount.');
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
  }
}
