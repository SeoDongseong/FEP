// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> haveYouEnoughMoney(
  int totalMoney,
  int spendingAmount,
) async {
  bool result = totalMoney >= spendingAmount ? true : false;
  return result;
}
