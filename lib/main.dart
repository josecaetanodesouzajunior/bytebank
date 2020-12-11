import 'package:bytebank/screen/lista_transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: ListaTransferencias(),
     theme: ThemeData(
       primaryColor: Colors.green[400],
       accentColor: Colors.blueAccent,
       buttonTheme: ButtonThemeData(
         buttonColor: Colors.blueAccent[700],
         textTheme: ButtonTextTheme.accent,
       ),
     ),
    );
  }

}


