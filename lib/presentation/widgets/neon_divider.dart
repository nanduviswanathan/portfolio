import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// A glowing neon-style horizontal line divider.
class NeonDivider extends StatelessWidget {
  final Color color;

  const NeonDivider({super.key, this.color = AppColors.cyberpunkPink});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          gradient: LinearGradient(
            colors: [color.withAlpha(0), color, color.withAlpha(0)],
          ),
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(100),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}
