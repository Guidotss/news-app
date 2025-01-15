import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/src/settings/env.dart';

import 'src/presentation/app.dart';

void main() async {
  try {
    await dotenv.load(fileName: ".env");
    Env.validateEnv();
  } catch (e) {
    print('Error loading .env file: $e');
  }
  runApp(const MyApp());
}

