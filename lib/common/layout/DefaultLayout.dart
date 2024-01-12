import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? floatingActionButton;
  final List<Widget>? actions;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.floatingActionButton,
    super.key,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: renderAppBar(),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: actions,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title!,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        foregroundColor: Colors.black,
      );
    }
  }
}
