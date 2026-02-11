import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/url_helper.dart';
import '../../data/portfolio_data.dart';
import '../widgets/animated_entrance.dart';
import '../widgets/hover_scale_button.dart';
import '../widgets/section_title.dart';
import '../widgets/section_wrapper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SectionWrapper(
      child: AnimatedEntrance(
        child: Column(
          children: [
            const SectionTitle(number: '04.', title: "Let's Connect"),
            Text(
              PortfolioData.contactHeadline,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.grey,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 40),

            // ── Social buttons (from data) ───────────────
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: PortfolioData.socialLinks
                  .map((link) => _ContactButton(
                        icon: link.icon,
                        label: link.label,
                        url: link.url,
                        color: link.color,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 48),

            // ── Big CTA ──────────────────────────────────
            HoverScaleButton(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => launchExternalUrl(PortfolioData.email),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: AppColors.neonGradient,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.cyberpunkPink.withAlpha(60),
                          blurRadius: 24,
                          spreadRadius: 2,
                          offset: const Offset(-4, 0),
                        ),
                        BoxShadow(
                          color: AppColors.electricBlue.withAlpha(60),
                          blurRadius: 24,
                          spreadRadius: 2,
                          offset: const Offset(4, 0),
                        ),
                      ],
                    ),
                    child: Text(
                      'Say Hello!',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile ? 16 : 18,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Private: Social icon button ──────────────────────────
class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  final Color color;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScaleButton(
      hoverScale: 1.15,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => launchExternalUrl(url),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.cardBg,
              border: Border.all(color: color.withAlpha(60)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 32),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
