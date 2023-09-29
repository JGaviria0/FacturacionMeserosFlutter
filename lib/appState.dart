import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class MyAppState extends ChangeNotifier {
  final billdb = Hive.box("Bill");

  int consecutivo = 0;

  void saveBill(info) {
    consecutivo++;
  }
}
