import 'package:flutter/material.dart';

void main() {
  runApp(ContadorApp());
}

class ContadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Clicks',
      home: ContadorPage(),
    );
  }
}

class ContadorPage extends StatefulWidget {
  @override
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int contador = 0;

  void _incrementar() {
    setState(() {
      contador++;
    });
  }

  void _decrementar() {
    if (contador > 0) {
      setState(() {
        contador--;
      });
    }
  }

  void _resetear() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador de Clicks'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$contador ${contador == 1 ? 'click' : 'clicks'}',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementar,
                  child: Text('+'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _decrementar,
                  child: Text('-'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetear,
                  child: Text('Reset'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
