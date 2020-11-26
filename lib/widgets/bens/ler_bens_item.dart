import 'package:app_inventario/models/telaArgumentos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:app_inventario/screens/bens/ler_bens_geral_tela.dart';
import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';

class LerBensItens extends StatefulWidget {
  static const routeName = '/lerBens';

  @override
  _LerBensItensState createState() => _LerBensItensState();
}

class _LerBensItensState extends State<LerBensItens> {
  TelaArgumentos _args;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final _controller = TextEditingController();
  final _form = GlobalKey<FormState>();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _buscaBemPatrimonial() {
    _args = ModalRoute.of(context).settings.arguments;
    Navigator.of(context).pushNamed(
      LerBensGeralTela.routeName,
      arguments: TelaArgumentos(
        id: _args.id,
        arg1: _controller.text,
        arg2: _args.arg1,
      ),
    );
    _controller.text = '';
  }

//------------------MANUAL------------------//
  void _leituraBensManual(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return SingleChildScrollView(
          child: Card(
            child: Container(
              padding: EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Form(
                    key: _form,
                    child: TextFormField(
                      key: Key('numeroPatrimonialText'),
                      // initialValue: _valorInicial,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Número patrimonial',
                        helperText: 'Informe o número patrimonial',
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.search),
                    onPressed: _buscaBemPatrimonial,
                    label: Text('Pesquisar'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //------------------CAMERA------------------//

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _args = ModalRoute.of(context).settings.arguments;
      Navigator.of(context).pushNamed(
        LerBensGeralTela.routeName,
        arguments: TelaArgumentos(
          id: _args.id,
          arg1: barcodeScanRes,
          arg2: _args.arg1,
        ),
      );
    });
  }

  //------------------CAMERA------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leitura de Bens'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              trailing: IconButton(
                icon: Icon(Icons.camera_alt),
                color: Colors.black,
                onPressed: () {
                  scanBarcodeNormal();
                },
              ),
              title: Text('Camera'),
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              trailing: IconButton(
                icon: Icon(Icons.content_paste),
                color: Colors.black,
                onPressed: () {
                  _leituraBensManual(context);
                },
              ),
              title: Text('Manual'),
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              trailing: IconButton(
                icon: Icon(Icons.usb),
                color: Colors.black,
                onPressed: () {},
              ),
              title: Text('USB'),
            ),
            Divider(),
            ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              trailing: IconButton(
                icon: Icon(Icons.bluetooth),
                color: Colors.black,
                onPressed: () {},
              ),
              title: Text('RFID'),
            )
          ],
        ),
      ),
    );
  }
}
