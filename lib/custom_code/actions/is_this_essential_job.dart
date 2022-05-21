// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

// Begin custom action code
Future<bool> isThisEssentialJob(
  List<String> inputJobList,
  String selectedJob,
) async {
  bool result = inputJobList.contains(selectedJob) ? true : false;
  return result;
}
