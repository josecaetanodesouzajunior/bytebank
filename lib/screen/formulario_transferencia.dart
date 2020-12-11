import 'package:bytebank/components/editor.dart';
import 'package:bytebank/model/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormularioTransferencia extends StatelessWidget{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Nova Transferência'
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: 'Numero da conta',
                dica: '000',
              ),
              Editor(
                  controlador: _controladorCampoValor,
                  rotulo: 'Valor',
                  dica:'100.00',
                  icone:Icons.monetization_on
              ),

              RaisedButton(
                child: Text('Confirmar'),
                onPressed:() => _criarTransferencia(context),
              ),
            ],
          ),
        )
    );
  }

  void _criarTransferencia(BuildContext context){
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta != null && valor != null){
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context,transferenciaCriada);
    }
  }

}
