import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: 'Type yout API key here');

  runApp(const MyApp());
}
