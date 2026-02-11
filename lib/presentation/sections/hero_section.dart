import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/url_helper.dart';
import '../../data/portfolio_data.dart';
import '../widgets/animated_entrance.dart';
import '../widgets/hover_scale_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return SizedBox(
      height: size.height,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Greeting ───────────────────────────────
              AnimatedEntrance(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  PortfolioData.greeting,
                  style: GoogleFonts.firaCode(
                    fontSize: isMobile ? 16 : 20,
                    color: AppColors.electricBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // ── Name ───────────────────────────────────
              AnimatedEntrance(
                delay: const Duration(milliseconds: 600),
                child: ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.neonGradient.createShader(bounds),
                  child: Text(
                    PortfolioData.name,
                    style: GoogleFonts.montserrat(
                      fontSize: isMobile ? 48 : 80,
                      fontWeight: FontWeight.w900,
                      height: 1.05,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ── Typewriter ─────────────────────────────
              AnimatedEntrance(
                delay: const Duration(milliseconds: 900),
                child: SizedBox(
                  height: isMobile ? 40 : 50,
                  child: DefaultTextStyle(
                    style: GoogleFonts.firaCode(
                      fontSize: isMobile ? 18 : 28,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 1500),
                      animatedTexts: PortfolioData.typewriterLines
                          .map((line) => TypewriterAnimatedText(
                                line,
                                speed: const Duration(milliseconds: 60),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // ── CTA Buttons ────────────────────────────
              AnimatedEntrance(
                delay: const Duration(milliseconds: 1200),
                child: Row(
                  children: [
                    _HeroButton(
                      label: 'View Projects',
                      filled: true,
                      onTap: () {
                        Scrollable.ensureVisible(
                          context,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOutCubic,
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                    _HeroButton(
                      label: 'Get in Touch',
                      filled: false,
                      onTap: () => launchExternalUrl(PortfolioData.email),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Private: Hero CTA Button ─────────────────────────────
class _HeroButton extends StatelessWidget {
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _HeroButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScaleButton(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: filled ? AppColors.pinkGradient : null,
              border:
                  filled ? null : Border.all(color: AppColors.electricBlue, width: 2),
              boxShadow: [
                BoxShadow(
                  color: filled
                      ? AppColors.cyberpunkPink.withAlpha(80)
                      : AppColors.electricBlue.withAlpha(40),
                  blurRadius: filled ? 20 : 16,
                  spreadRadius: filled ? 1 : 0,
                ),
              ],
            ),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
