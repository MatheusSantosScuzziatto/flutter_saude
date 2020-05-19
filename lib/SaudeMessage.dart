import 'package:flutter/material.dart';

class SaudeMessage extends StatefulWidget {
  String valor;
  SaudeMessage({this.valor});

  @override
  _SaudeMessageState createState() => _SaudeMessageState();
}

class _SaudeMessageState extends State<SaudeMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Estado de Saúde - Mensagem"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Text("${widget.valor}")
            ],
          ),
        ));
  }
}
