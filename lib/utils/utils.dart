import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  else {
    if (scan.tipo == 'geo') {
      Navigator.pushNamed(context, 'mapa', arguments: scan);
    }
    else {
      showDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('URL Incorrecto'),
    
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
    
                    children: [
                      Text('URL Escaneado no coincide con los parámetros correctos.'),
                      SizedBox(height: 10),
                      FlutterLogo(size: 50),
                    ],
                  ),
                  
                  actions: [
                    TextButton(
                      // ignore: sort_child_properties_last
                      child: const Text('Cerrar'),
    
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ); //ShowDialog
    }  
  }
}