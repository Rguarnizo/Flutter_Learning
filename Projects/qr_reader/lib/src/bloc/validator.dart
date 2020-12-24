


import 'dart:async';

import 'package:qr_reader/src/providers/db_provider.dart';

class Validators{

  final validarGeo = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: (data, sink) {
      
      final geoScans = data.where((s) => s.tipo == 'geo').toList();

      sink.add(geoScans);

    },
  );

  final validarHttp = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: (data, sink) {
      
      final geoScans = data.where((s) => s.tipo == 'http').toList();

      sink.add(geoScans);

    },
  );

}