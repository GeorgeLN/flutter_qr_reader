import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    int? id;
    String? tipo;
    String valor;

    LatLng getLatLng() {
      final latlng = valor.substring(4).split(','); //Elimino el "geo:" de la cadena y la separo en el momento que encuentre una coma ",".
      final lat = double.parse( latlng[0] ); //Obtengo la latitud y la convierto en un double.
      final lng = double.parse( latlng[1]);

      return LatLng(lat, lng);
    }

    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    }) {
      if (valor.contains('http')) {
        tipo = 'http';
      }
      else {
        tipo = 'geo';
      }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
