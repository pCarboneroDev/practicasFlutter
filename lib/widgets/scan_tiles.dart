import 'package:flutter/material.dart';
import 'package:practicas_flutter/providers/scan_list_provider.dart';
import 'package:practicas_flutter/utils/utils.dart';
import 'package:provider/provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;
  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direction) {
          scanListProvider.borrarScanId(index);
        },

        child: ListTile(
          leading: Icon(
            this.tipo == 'http' ? Icons.home_outlined : Icons.map_outlined, 
            color: Theme.of(context).primaryColor
          ),
          title: Text(scanListProvider.scans[index].valor),
          subtitle: Text(scanListProvider.scans[index].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () => goToUrl(context, scanListProvider.scans[index]),
        ),
      ),
    );
  }
}
