import 'package:bytebank/model/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'formulario_transferencia.dart';

class ListaTransferenciaState extends State<ListaTransferencias>{
  final List<Transferencia> _transferencias = List();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Transferências'
        ),
      ),
      body: ListView.builder(
        itemCount:  _transferencias.length,
        itemBuilder: (context,indice){
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);

        },

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
        final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return FormularioTransferencia();
            }
        ));
        future.then((transferenciaRecebida)  {
          debugPrint('chegou o then do future');
          debugPrint('$transferenciaRecebida');

          if(transferenciaRecebida != null){
            Future.delayed(Duration(milliseconds: 300), (){
              setState(() {
                _transferencias.add(transferenciaRecebida);
              });
            });

          }
        });
      },
      ),
    );
  }

}

class ListaTransferencias extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ItemTransferencia extends StatelessWidget{
  final Transferencia transferencia;


  ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this.transferencia.valor.toString()),
        subtitle: Text(this.transferencia.numeroConta.toString()),
      ),
    );

  }

}