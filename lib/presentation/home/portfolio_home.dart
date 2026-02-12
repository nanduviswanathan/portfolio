import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/services/resume_generator.dart';
import '../../core/theme/app_colors.dart';
import '../../data/portfolio_data.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/tech_stack_section.dart';
import '../widgets/hover_scale_button.dart';
import '../widgets/particle_background.dart';

/// The single-page portfolio scaffold.
/// Owns the scroll controller, navigation keys, and app bar.
class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for scroll-to navigation
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(isMobile),
      body: Stack(
        children: [
          const ParticleBackground(),
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                HeroSection(key: _heroKey),
                AboutSection(key: _aboutKey),
                TechStackSection(key: _techKey),
                ProjectsSection(key: _projectsKey),
                ContactSection(key: _contactKey),
                const SizedBox(height: 40),
                _Footer(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  // ── App bar ────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar(bool isMobile) {
    return AppBar(
      backgroundColor: AppColors.background.withAlpha(200),
      elevation: 0,
      centerTitle: false,
      title: ShaderMask(
        shaderCallback: (bounds) =>
            AppColors.neonGradient.createShader(bounds),
        child: Text(
          '<NV/>',
          style: GoogleFonts.firaCode(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      actions: isMobile ? _mobileMenu() : _desktopNav(),
    );
  }

  List<Widget> _mobileMenu() {
    return [
      PopupMenuButton<String>(
        icon: const Icon(Icons.menu, color: AppColors.electricBlue),
        color: AppColors.surface,
        onSelected: (value) {
          if (value == 'resume') {
            ResumeGenerator.downloadResume();
            return;
          }
          final map = {
            'home': _heroKey,
            'about': _aboutKey,
            'tech': _techKey,
            'projects': _projectsKey,
            'contact': _contactKey,
          };
          final key = map[value];
          if (key != null) _scrollTo(key);
        },
        itemBuilder: (_) => const [
          PopupMenuItem(value: 'home', child: Text('Home')),
          PopupMenuItem(value: 'about', child: Text('About')),
          PopupMenuItem(value: 'tech', child: Text('Tech Stack')),
          PopupMenuItem(value: 'projects', child: Text('Projects')),
          PopupMenuItem(value: 'contact', child: Text('Contact')),
          PopupMenuItem(
            value: 'resume',
            child: Text('Download Resume'),
          ),
        ],
      ),
    ];
  }

  List<Widget> _desktopNav() {
    return [
      _NavButton(label: 'Home', onTap: () => _scrollTo(_heroKey)),
      _NavButton(label: 'About', onTap: () => _scrollTo(_aboutKey)),
      _NavButton(label: 'Tech', onTap: () => _scrollTo(_techKey)),
      _NavButton(label: 'Projects', onTap: () => _scrollTo(_projectsKey)),
      _NavButton(label: 'Contact', onTap: () => _scrollTo(_contactKey)),
      _NavButton(
        label: 'Resume',
        onTap: () => ResumeGenerator.downloadResume(),
        highlight: true,
      ),
      const SizedBox(width: 16),
    ];
  }

  // ── FAB ────────────────────────────────────────────────
  Widget _buildFab() {
    return HoverScaleButton(
      child: FloatingActionButton.extended(
        onPressed: () => _scrollTo(_contactKey),
        backgroundColor: AppColors.cyberpunkPink,
        icon: const Icon(Icons.rocket_launch, color: Colors.white),
        label: Text(
          "Let's Talk",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// NAV BUTTON (desktop only, private to this file)
// ─────────────────────────────────────────────────────────
class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool highlight;

  const _NavButton({
    required this.label,
    required this.onTap,
    this.highlight = false,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    // Highlighted style (Resume button)
    if (widget.highlight) {
      return MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: _hovered ? AppColors.cyberpunkPink : AppColors.electricBlue,
              ),
              color: _hovered ? AppColors.cyberpunkPink.withAlpha(30) : Colors.transparent,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.download,
                  size: 14,
                  color: _hovered ? AppColors.cyberpunkPink : AppColors.electricBlue,
                ),
                const SizedBox(width: 6),
                Text(
                  widget.label,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _hovered ? AppColors.cyberpunkPink : AppColors.electricBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Default nav button
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: _hovered ? AppColors.electricBlue : AppColors.white,
              shadows: _hovered
                  ? [
                      Shadow(
                        color: AppColors.electricBlue.withAlpha(150),
                        blurRadius: 12,
                      )
                    ]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// FOOTER (private to this file)
// ─────────────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: AppColors.surface.withAlpha(120),
      child: Center(
        child: Text(
          PortfolioData.footerText,
          style: GoogleFonts.poppins(color: AppColors.grey, fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
