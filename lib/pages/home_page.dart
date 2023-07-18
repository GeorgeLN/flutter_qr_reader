import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/pages/maps_pages.dart';

//import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/widgets/scan_button.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false); //Así llamamos la clase "ScanListProvider", para invocar
    //el método "borrarScans()" ... Se coloca listen: false, ya que no es necesario redibujar el Widget.

    return Scaffold(
      appBar: AppBar(

        title: const Text('Historial'),
        centerTitle: true,
        elevation: 0,

        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed:() {
              scanListProvider.borrarScans();
            },
          ),
        ], //actions[]
      ),

      body: const _HomePageBody(),

      bottomNavigationBar: const CustomNavigationbar(),

      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {

    //Obtener el Selected Menu Opt.
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: PRUEBAS, leer la base de datos.
    //final tempScan = ScanModel(valor: 'http://google.com');
    //DBProvider.db.getScanById(1).then((scan) => print(scan?.valor));
    //DBProvider.db.getTodosLosScans().then(print);

    //Usar el Provider.
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
      scanListProvider.cargarScanPorTipo('geo');
        return const MapsPage();

      case 1:
      scanListProvider.cargarScanPorTipo('http');
        return const DireccionesPage();

      default:
        return const MapsPage();
    }
  }
}