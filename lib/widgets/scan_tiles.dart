import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/themes/app_theme.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context); //Si agregamos el "listen: false", deja eliminar de manera individual. Pero no deja redibujar el widget para que se actualice en tiempo de ejecución.
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

          onDismissed: (DismissDirection direction) {
            Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[index].id!);
          },

          child: ListTile(
            leading: Icon(
              this.tipo == 'geo'
              ? Icons.compass_calibration
              : Icons.map,
              color: AppTheme.primary,
            ),

            title: Text(scans[index].valor),
            subtitle: Text(scans[index].id.toString()),
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
            
            onTap: () => launchURL(context, scans[index]),
          ),
        );
      }, //ItemBuilder
    );
  }
}