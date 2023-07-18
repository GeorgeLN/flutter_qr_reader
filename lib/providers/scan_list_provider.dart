import 'package:qr_reader/providers/db_provider.dart';

import 'package:qr_reader/models/scan_model.dart';
import 'package:flutter/foundation.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoScan( String valor ) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    //Asignar el ID de la base de datos al modelo.
    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScanPorTipo( String tipo ) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...?scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarScans() async {
    // ignore: unused_local_variable
    final scans = await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  borrarScanPorId( int id ) async {
    // ignore: unused_local_variable
    await DBProvider.db.deleteScan(id);
    //cargarScanPorTipo(tipoSeleccionado); //El "notifyListeners" ya se encuentra en el método cargarScansPorTipo, por es no se coloca aquí.
    //notifyListeners();
  }

} 