import 'package:flutter/material.dart';
import 'package:practicas_flutter/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

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
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
          title: Text(scanListProvider.scans[index].valor),
          subtitle: Text(scanListProvider.scans[index].valor.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () => print(scanListProvider.scans[index].id),
        ),
      ),
    );
  }
}