import 'package:flutter/material.dart';

/// Provides consistent responsive horizontal padding for every section.
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const SectionWrapper({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontal =
        width > 1200 ? width * 0.15 : (width > 768 ? 48.0 : 20.0);

    return Container(
      width: double.infinity,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: horizontal, vertical: 80),
      child: child,
    );
  }
}
