import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart'; //Importante
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
   
  const ScanButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.qr_code_scanner_rounded),

      onPressed: () async {
        //const barcodeScanRes = 'https://fernando-herrera.com';
        //const barcodeScanRes = 'geo:4.406029,-75.146283';

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);

        if (barcodeScanRes == '-1') {
          return;
        }

        //scanListProvider.nuevoScan(barcodeScanRes);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        // ignore: use_build_context_synchronously
        launchURL(context, nuevoScan);
      },
    );
  }
}