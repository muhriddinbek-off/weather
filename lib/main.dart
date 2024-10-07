import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/app/app.dart';
import 'package:weather/data/storages/storages_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  StorageRepository();
  runApp(const App());
}
