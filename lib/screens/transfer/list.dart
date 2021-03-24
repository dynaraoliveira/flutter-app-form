import 'package:flutter_app_form/models/transfer.dart';
import 'package:flutter_app_form/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Transferências';

class ListTransfer extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return ListTransferState();
  }
}

class ListTransferState extends State<ListTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transfers[indice];
          return ItemTransfer(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransfer();
          })).then(
            (transferReceived) => _atualiza(transferReceived),
          );
        },
      ),
    );
  }

  void _atualiza(Transfer transferReceived) {
    if (transferReceived != null) {
      setState(() {
        widget._transfers.add(transferReceived);
      });
    }
  }
}

class ItemTransfer extends StatelessWidget {
  final Transfer _transfer;

  ItemTransfer(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfer.value.toString()),
      subtitle: Text(_transfer.numberAccount.toString()),
    ));
  }
}
