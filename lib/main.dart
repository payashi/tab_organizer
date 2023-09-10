import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_organizer/screens/popup_screen.dart';

void main() async {
  await dotenv.load();
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: PopupScreen(),
      ),
    ),
  );
}
