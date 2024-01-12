import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notodo/common/provider/ProviderObserver.dart';
import 'package:notodo/screens/MainScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Pretendard',
        ),
        home: const MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
