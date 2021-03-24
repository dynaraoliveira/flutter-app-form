import 'package:flutter/material.dart';
import 'package:flutter_app_form/components/editor.dart';
import 'package:flutter_app_form/models/transfer.dart';

const _titleAppBar = 'Criando transferência';
const _labelTextValue = 'Valor';
const _hintTextValue = '0.00';
const _labelTextNumberAccount = 'Número da conta';
const _hintTextNumberAccount = '0000';
const _textButtonConfirm = 'Confirmar';

class FormTransfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTransferState();
  }
}

class FormTransferState extends State<FormTransfer> {
  final TextEditingController _controllerFieldNumberAccount =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controller: _controllerFieldNumberAccount,
                hintText: _hintTextNumberAccount,
                labelText: _labelTextNumberAccount,
              ),
              Editor(
                hintText: _hintTextValue,
                controller: _controllerFieldValue,
                labelText: _labelTextValue,
                icon: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textButtonConfirm),
                onPressed: () => _createTransfer(context),
              ),
            ],
          ),
        ));
  }

  void _createTransfer(BuildContext context) {
    final int numberAccount = int.tryParse(_controllerFieldNumberAccount.text);
    final double value = double.tryParse(_controllerFieldValue.text);
    if (numberAccount != null && value != null) {
      final transferCreated = Transfer(value, numberAccount);
      Navigator.pop(context, transferCreated);
    }
  }
}
