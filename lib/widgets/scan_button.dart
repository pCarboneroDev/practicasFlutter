import 'package:flutter/material.dart';
import 'package:practicas_flutter/providers/scan_list_provider.dart';
import 'package:practicas_flutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {

        String? barcodeScanRes = await SimpleBarcodeScanner.scanBarcode(
                  context,
                  barcodeAppBar: const BarcodeAppBar(
                    appBarTitle: 'Test',
                    centerTitle: false,
                    enableBackButton: true,
                    backButtonIcon: Icon(Icons.arrow_back_ios),
                  ),
                  isShowFlashIcon: true,
                  delayMillis: 500,
                  cameraFace: CameraFace.back,
                  scanFormat: ScanFormat.ONLY_QR_CODE,
                );
        //final String? barcodeScanRes = 'https://pub.dev';
        //final String? barcodeScanRes = 'geo:37.370806,-5.972405';

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        if (barcodeScanRes != '-1'){
          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes!);
          goToUrl(context, nuevoScan);
        }
      },
      child: Icon(Icons.filter_center_focus),
    );
  }
}