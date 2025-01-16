import 'package:flutter_dotenv/flutter_dotenv.dart';


abstract class EnvAdapter {
  String getValue(String key);
  bool hasValue(String key);
}
class DotEnvAdapter implements EnvAdapter {
  @override
  String getValue(String key) {
    if (!hasValue(key)) {
      throw Exception('Environment variable $key not found');
    }
    return dotenv.get(key);
  }

  @override
  bool hasValue(String key) => dotenv.env.containsKey(key);
}

class Env {
  static final EnvAdapter _adapter = DotEnvAdapter();
  
  static String get newsApiKey => _adapter.getValue('NEWS_API_KEY');
  
  static void validateEnv() {
    final requiredVars = [
      "NEWS_API_KEY"
    ];
    
    final missingVars = requiredVars
        .where((key) => !_adapter.hasValue(key))
        .toList();
    
    if (missingVars.isNotEmpty) {
      throw Exception(
        'Missing required environment variables: ${missingVars.join(", ")}',
      );
    }
  }
}
