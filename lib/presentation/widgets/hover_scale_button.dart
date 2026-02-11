import 'package:flutter/material.dart';

/// Wraps any widget to give it a scale-up effect on mouse hover.
class HoverScaleButton extends StatefulWidget {
  final Widget child;
  final double hoverScale;

  const HoverScaleButton({
    super.key,
    required this.child,
    this.hoverScale = 1.08,
  });

  @override
  State<HoverScaleButton> createState() => _HoverScaleButtonState();
}

class _HoverScaleButtonState extends State<HoverScaleButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered ? widget.hoverScale : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutBack,
        child: widget.child,
      ),
    );
  }
}
