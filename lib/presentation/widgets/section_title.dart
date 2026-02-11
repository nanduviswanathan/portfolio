import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import 'neon_divider.dart';

/// Numbered section heading with a neon divider underneath.
class SectionTitle extends StatelessWidget {
  final String number;
  final String title;

  const SectionTitle({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: GoogleFonts.firaCode(
                fontSize: 18,
                color: AppColors.cyberpunkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const NeonDivider(),
        const SizedBox(height: 48),
      ],
    );
  }
}
