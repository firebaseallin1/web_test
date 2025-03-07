
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../const/asset_consts.dart';

class EnvLoader {
  static final Map<String, String> _env = {};

  static Future<void> loadEnv() async {
    try {
      final envString = await rootBundle.loadString(AssetConst.envLoaderFile);
      for (var line in envString.split('\n')) {
        if (line.trim().isNotEmpty && line.contains('=')) {
          final parts = line.split('=');
          final key = parts[0].trim();
          final value = parts.sublist(1).join('=').trim();
          _env[key] = value;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error loading .env file: $e");
      }
    }
  }

  static String? get(String key) => _env[key];
}
