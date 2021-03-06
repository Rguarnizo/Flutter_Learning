import 'package:flutter/material.dart';

import 'package:qr_reader/src/models/scan_,model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(ScanModel scan,context) async {
  
  if(scan.tipo == 'http'){

  if (await canLaunch(scan.valor)) {
    await launch(scan.valor);
  } else {
    throw 'Could not launch ${scan.valor}';
  }
  }else {
    Navigator.pushNamed(context, 'Mapa',arguments: scan);
  }
}
