import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/scan_tiles.dart';

class MapsPage extends StatelessWidget {
   
  const MapsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return const ScanTiles(tipo: 'http');

    /*final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // ignore: sort_child_properties_last
                  child: const Text('Eliminar', style: TextStyle(fontSize: 30, color: Colors.white, fontStyle: FontStyle.italic)),
                  //padding: const EdgeInsets.only(top: 18, right: 18),
                ),
                const SizedBox(width: 10),

                const Icon(Icons.delete, size: 30, color: Colors.white),

                const Padding(padding: EdgeInsets.only(right: 15)),
              ], // Children[]
            ),

            color: Colors.red,
          ),

          onDismissed: (direction) {
            Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[index].id!);
          },

          child: ListTile(
            leading: const Icon(Icons.map, color: AppTheme.primary),
        
            title: Text(scans[index].valor),
            subtitle: Text(scans[index].id.toString()),
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            
            onTap: () {
              print('Abrir algo');
            },
          ),
        );
      }, //ItemBuilder
    );*/
  }
}