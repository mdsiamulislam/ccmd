import 'dart:convert';
import 'package:flutter/services.dart';

class DataService {
  Future<Map<String, dynamic>> loadMockData() async {
    final String response = await rootBundle.loadString('assets/json/ccmd_mock_data.json');
    return json.decode(response);
  }
}
