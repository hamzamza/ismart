import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissin() async {
  final status = await Permission.camera.status;
  if (status.isDenied) {}
  if (await Permission.location.isRestricted) {}
}
// 
