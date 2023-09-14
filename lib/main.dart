import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_organizer/screens/popup_screen.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: PopupScreen(),
      ),
    ),
  );
}
