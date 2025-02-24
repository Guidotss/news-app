import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/settings/settings.dart';

import 'src/presentation/app.dart';

void main() async {
  try {
    await dotenv.load(fileName: ".env");
    Env.validateEnv();
  } catch (e) {
    debugPrint('Error loading .env file: $e');
  }
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

