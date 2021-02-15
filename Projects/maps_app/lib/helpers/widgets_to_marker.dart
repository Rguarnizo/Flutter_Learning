part of 'helpers.dart';



Future<BitmapDescriptor> getMarkerStartIcon(int seg) async {

  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  final size = new Size(350, 150);
  
  final markerStart = new MarkerStart(seg/60.floor());

  markerStart.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final data = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());

}

Future<BitmapDescriptor> getMarkerEndIcon(String description,double distance) async {

  final recorder = PictureRecorder();
  final canvas = Canvas(recorder);
  final size = new Size(350, 150);
  
  final markerStart = new MarkerEndPainter(description: description,distance: distance);

  markerStart.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final data = await image.toByteData(format: ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());

}