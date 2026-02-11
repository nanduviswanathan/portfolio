import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../widgets/animated_entrance.dart';
import '../widgets/hover_scale_button.dart';
import '../widgets/section_title.dart';
import '../widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SectionWrapper(
      child: Column(
        children: [
          const SectionTitle(number: '01.', title: 'About Me'),
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: [
                    _buildAvatar(),
                    const SizedBox(height: 32),
                    _buildBio(),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAvatar(),
                  const SizedBox(width: 48),
                  Expanded(child: _buildBio()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // ── Avatar placeholder with neon border ────────────────
  Widget _buildAvatar() {
    return AnimatedEntrance(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.neonGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.cyberpunkPink.withAlpha(80),
              blurRadius: 30,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: AppColors.electricBlue.withAlpha(60),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.surface,
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.neonGradient.createShader(bounds),
              child: const Icon(Icons.person, size: 80, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // ── Bio text + skill chips (driven by PortfolioData) ───
  Widget _buildBio() {
    return AnimatedEntrance(
      delay: const Duration(milliseconds: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.grey,
                height: 1.8,
              ),
              children: [
                TextSpan(text: PortfolioData.bioLeading),
                TextSpan(
                  text: PortfolioData.bioHighlight1,
                  style: GoogleFonts.poppins(
                    color: AppColors.electricBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: PortfolioData.bioMid),
                TextSpan(
                  text: PortfolioData.bioHighlight2,
                  style: GoogleFonts.poppins(
                    color: AppColors.cyberpunkPink,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: PortfolioData.bioTrailing),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: PortfolioData.skillChips
                .map((chip) => _SkillChip(label: chip.label, color: chip.color))
                .toList(),
          ),
        ],
      ),
    );
  }
}

// ── Private: Skill Chip ──────────────────────────────────
class _SkillChip extends StatelessWidget {
  final String label;
  final Color color;

  const _SkillChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return HoverScaleButton(
      hoverScale: 1.1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withAlpha(100)),
          color: color.withAlpha(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.firaCode(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
