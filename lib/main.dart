import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            final item = items[i];
            return Dismissible(
              key: Key(item),
              child: ListTile(
                title: Text(item),
              ),
              background: Container(color: Colors.red,),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(i);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item dismissed'))
                );
              },
            );
          },
        ),
      ),
    );
  }
}
