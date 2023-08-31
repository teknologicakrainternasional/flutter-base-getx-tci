import 'package:base_flutter_tci/_core/constants/app_flavor.dart';
import 'package:base_flutter_tci/_core/my_app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  AppFlavor(
    flavor: Flavor.prod,
    baseUrl: 'http://103.166.210.179:8180',
  );
  runApp(const MyApp());
}