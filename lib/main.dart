import 'package:flutter/material.dart';
import 'package:ismart/common/services/secure_cache.dart';
import 'package:ismart/common/utils/logger.dart';
import 'package:ismart/common/utils/permissions.dart';
import 'package:ismart/ismart.dart';
import 'package:ismart/providers.dart';

void main() async {
  setupLogger();
  WidgetsFlutterBinding.ensureInitialized();
  requestPermissin();
  bool logedIn = await checklogin();
  runApp(RepositoryHolder(child: Ismart(isLogedIn: logedIn)));
}

checklogin() async {
  return SecureStorageMixin.checkifAlreadyLogedIn();
}
