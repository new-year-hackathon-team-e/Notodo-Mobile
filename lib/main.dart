import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/common/provider/ProviderObserver.dart';
import 'package:notodo/screens/MainScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MaterialApp(
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
