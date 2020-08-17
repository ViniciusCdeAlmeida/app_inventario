import 'package:app_inventario/widgets/cabecalho/app_cabecalho.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class LerBensItens extends StatefulWidget {
  static const routeName = '/lerBens';

  @override
  _LerBensItensState createState() => _LerBensItensState();
}

class _LerBensItensState extends State<LerBensItens> {
  //------------------CAMERA------------------//
  ScanResult scanResult;
  final _flashOnController = TextEditingController(text: "Flash on");
  final _flashOffController = TextEditingController(text: "Flash off");
  final _cancelController = TextEditingController(text: "Cancel");

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  // ignore: type_annotate_public_apis
  initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  Future scan() async {
    try {
      var options = ScanOptions(
        strings: {
          "cancel": _cancelController.text,
          "flash_on": _flashOnController.text,
          "flash_off": _flashOffController.text,
        },
        restrictFormat: selectedFormats,
        useCamera: _selectedCamera,
        autoEnableFlash: _autoEnableFlash,
        android: AndroidOptions(
          aspectTolerance: _aspectTolerance,
          useAutoFocus: _useAutoFocus,
        ),
      );

      var result = await BarcodeScanner.scan(options: options);

      setState(() {
        scanResult = result;
        // Navigator.of(context)
        //     .popAndPushNamed(Teste.routeName, arguments: result.rawContent);
      });
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );

      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
      } else {
        result.rawContent = 'Unknown error: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
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
              contentPadding: EdgeInsets.all(10),
              trailing: IconButton(
                icon: Icon(Icons.camera_alt),
                color: Colors.black,
                onPressed: () {
                  scan();
                },
              ),
              title: Text('Camera'),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              trailing: IconButton(
                icon: Icon(Icons.content_paste),
                color: Colors.black,
                onPressed: () {},
              ),
              title: Text('Manual'),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(10),
              trailing: IconButton(
                icon: Icon(Icons.usb),
                color: Colors.black,
                onPressed: () {},
              ),
              title: Text('USB'),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(10),
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
