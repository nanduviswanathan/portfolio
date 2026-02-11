import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ─────────────────────────────────────────────────────────
// COLORS & THEME CONSTANTS
// ─────────────────────────────────────────────────────────
const Color kBackground = Color(0xFF0D0D0D);
const Color kSurface = Color(0xFF1A1A2E);
const Color kCyberpunkPink = Color(0xFFFF007F);
const Color kElectricBlue = Color(0xFF00FFFF);
const Color kWhite = Color(0xFFF0F0F0);
const Color kGrey = Color(0xFF8892B0);
const Color kCardBg = Color(0xFF16213E);

// ─────────────────────────────────────────────────────────
// MAIN ENTRY
// ─────────────────────────────────────────────────────────
void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nandu Viswanathan — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackground,
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
        colorScheme: const ColorScheme.dark(
          primary: kCyberpunkPink,
          secondary: kElectricBlue,
          surface: kSurface,
        ),
      ),
      home: const PortfolioHome(),
    );
  }
}

// ─────────────────────────────────────────────────────────
// HOME SCAFFOLD
// ─────────────────────────────────────────────────────────
class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
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

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(isMobile),
      body: Stack(
        children: [
          // Animated background particles
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
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isMobile) {
    return AppBar(
      backgroundColor: kBackground.withAlpha(200),
      elevation: 0,
      centerTitle: false,
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [kCyberpunkPink, kElectricBlue],
        ).createShader(bounds),
        child: Text(
          '<NV/>',
          style: GoogleFonts.firaCode(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      actions: isMobile
          ? [
              PopupMenuButton<String>(
                icon: const Icon(Icons.menu, color: kElectricBlue),
                color: kSurface,
                onSelected: (value) {
                  switch (value) {
                    case 'home':
                      _scrollTo(_heroKey);
                    case 'about':
                      _scrollTo(_aboutKey);
                    case 'tech':
                      _scrollTo(_techKey);
                    case 'projects':
                      _scrollTo(_projectsKey);
                    case 'contact':
                      _scrollTo(_contactKey);
                  }
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'home', child: Text('Home')),
                  PopupMenuItem(value: 'about', child: Text('About')),
                  PopupMenuItem(value: 'tech', child: Text('Tech Stack')),
                  PopupMenuItem(value: 'projects', child: Text('Projects')),
                  PopupMenuItem(value: 'contact', child: Text('Contact')),
                ],
              ),
            ]
          : [
              _NavButton(label: 'Home', onTap: () => _scrollTo(_heroKey)),
              _NavButton(label: 'About', onTap: () => _scrollTo(_aboutKey)),
              _NavButton(label: 'Tech', onTap: () => _scrollTo(_techKey)),
              _NavButton(
                  label: 'Projects', onTap: () => _scrollTo(_projectsKey)),
              _NavButton(
                  label: 'Contact', onTap: () => _scrollTo(_contactKey)),
              const SizedBox(width: 16),
            ],
    );
  }

  Widget _buildFab() {
    return HoverScaleButton(
      child: FloatingActionButton.extended(
        onPressed: () => _scrollTo(_contactKey),
        backgroundColor: kCyberpunkPink,
        icon: const Icon(Icons.rocket_launch, color: Colors.white),
        label: Text(
          "Let's Talk",
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24),
      color: kSurface.withAlpha(120),
      child: Center(
        child: Text(
          '© 2026 Nandu Viswanathan. Built with Flutter & a lot of caffeine.',
          style: GoogleFonts.poppins(color: kGrey, fontSize: 13),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// NAV BUTTON (DESKTOP)
// ─────────────────────────────────────────────────────────
class _NavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
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
              color: _hovered ? kElectricBlue : kWhite,
              shadows: _hovered
                  ? [Shadow(color: kElectricBlue.withAlpha(150), blurRadius: 12)]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// HOVER SCALE BUTTON WRAPPER
// ─────────────────────────────────────────────────────────
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

// ─────────────────────────────────────────────────────────
// PARTICLE BACKGROUND
// ─────────────────────────────────────────────────────────
class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    for (int i = 0; i < 60; i++) {
      _particles.add(_Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        speed: 0.0003 + _random.nextDouble() * 0.0008,
        radius: 1 + _random.nextDouble() * 2,
        color: _random.nextBool()
            ? kCyberpunkPink.withAlpha(60 + _random.nextInt(60))
            : kElectricBlue.withAlpha(60 + _random.nextInt(60)),
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        for (var p in _particles) {
          p.y -= p.speed;
          if (p.y < -0.05) {
            p.y = 1.05;
            p.x = _random.nextDouble();
          }
        }
        return CustomPaint(
          size: MediaQuery.of(context).size,
          painter: _ParticlePainter(_particles),
        );
      },
    );
  }
}

class _Particle {
  double x;
  double y;
  final double speed;
  final double radius;
  final Color color;

  _Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.radius,
    required this.color,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;

  _ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (var p in particles) {
      final paint = Paint()..color = p.color;
      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ─────────────────────────────────────────────────────────
// SECTION WRAPPER
// ─────────────────────────────────────────────────────────
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const SectionWrapper({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontal = width > 1200 ? width * 0.15 : (width > 768 ? 48.0 : 20.0);

    return Container(
      width: double.infinity,
      padding: padding ??
          EdgeInsets.symmetric(horizontal: horizontal, vertical: 80),
      child: child,
    );
  }
}

// ─────────────────────────────────────────────────────────
// ANIMATED ENTRANCE WRAPPER (FADE + SLIDE UP)
// ─────────────────────────────────────────────────────────
class AnimatedEntrance extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const AnimatedEntrance({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<AnimatedEntrance> createState() => _AnimatedEntranceState();
}

class _AnimatedEntranceState extends State<AnimatedEntrance>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _started = true;
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_started) {
      return Opacity(opacity: 0, child: widget.child);
    }
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// GLOWING NEON LINE DIVIDER
// ─────────────────────────────────────────────────────────
class NeonDivider extends StatelessWidget {
  final Color color;

  const NeonDivider({super.key, this.color = kCyberpunkPink});

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
            BoxShadow(color: color.withAlpha(100), blurRadius: 16, spreadRadius: 2),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────
// SECTION TITLE WIDGET
// ─────────────────────────────────────────────────────────
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
                color: kCyberpunkPink,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: kWhite,
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

// ═════════════════════════════════════════════════════════
// HERO SECTION
// ═════════════════════════════════════════════════════════
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
              AnimatedEntrance(
                delay: const Duration(milliseconds: 300),
                child: Text(
                  'Hey there! I\'m',
                  style: GoogleFonts.firaCode(
                    fontSize: isMobile ? 16 : 20,
                    color: kElectricBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedEntrance(
                delay: const Duration(milliseconds: 600),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [kCyberpunkPink, kElectricBlue],
                  ).createShader(bounds),
                  child: Text(
                    'Nandu\nViswanathan.',
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
              AnimatedEntrance(
                delay: const Duration(milliseconds: 900),
                child: SizedBox(
                  height: isMobile ? 40 : 50,
                  child: DefaultTextStyle(
                    style: GoogleFonts.firaCode(
                      fontSize: isMobile ? 18 : 28,
                      color: kGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 1500),
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Architecting Clouds & Crafting Apps.',
                          speed: const Duration(milliseconds: 60),
                        ),
                        TypewriterAnimatedText(
                          'Flutter Developer. Node.js Wizard.',
                          speed: const Duration(milliseconds: 60),
                        ),
                        TypewriterAnimatedText(
                          'Cloud Architect. Problem Solver.',
                          speed: const Duration(milliseconds: 60),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
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
                      onTap: () => _launchUrl('mailto:hello@nanduv.dev'),
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
              gradient: filled
                  ? const LinearGradient(
                      colors: [kCyberpunkPink, Color(0xFFBF0060)])
                  : null,
              border: filled
                  ? null
                  : Border.all(color: kElectricBlue, width: 2),
              boxShadow: filled
                  ? [
                      BoxShadow(
                        color: kCyberpunkPink.withAlpha(80),
                        blurRadius: 20,
                        spreadRadius: 1,
                      )
                    ]
                  : [
                      BoxShadow(
                        color: kElectricBlue.withAlpha(40),
                        blurRadius: 16,
                      )
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

// ═════════════════════════════════════════════════════════
// ABOUT SECTION
// ═════════════════════════════════════════════════════════
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

  Widget _buildAvatar() {
    return AnimatedEntrance(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [kCyberpunkPink, kElectricBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: kCyberpunkPink.withAlpha(80),
              blurRadius: 30,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: kElectricBlue.withAlpha(60),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: kSurface,
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [kCyberpunkPink, kElectricBlue],
              ).createShader(bounds),
              child: const Icon(Icons.person, size: 80, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

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
                color: kGrey,
                height: 1.8,
              ),
              children: [
                const TextSpan(
                    text:
                        "I'm a passionate full-stack engineer who lives at the intersection of "),
                TextSpan(
                  text: 'beautiful front-end experiences',
                  style: GoogleFonts.poppins(
                    color: kElectricBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'scalable cloud infrastructure',
                  style: GoogleFonts.poppins(
                    color: kCyberpunkPink,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const TextSpan(
                    text:
                        ". From pixel-perfect Flutter apps to globally distributed Node.js APIs and robust AWS/GCP architectures — I ship the whole stack.\n\n"),
                const TextSpan(
                    text:
                        "I believe great products are born when design thinking meets engineering excellence. Whether it's orchestrating Kubernetes clusters, designing serverless pipelines, or crafting micro-interactions in Flutter — I bring the same energy and obsessive attention to detail."),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _SkillChip(label: 'Flutter', color: kElectricBlue),
              _SkillChip(label: 'Node.js', color: kCyberpunkPink),
              _SkillChip(label: 'AWS', color: kElectricBlue),
              _SkillChip(label: 'GCP', color: kCyberpunkPink),
              _SkillChip(label: 'React', color: kElectricBlue),
              _SkillChip(label: 'Docker', color: kCyberpunkPink),
              _SkillChip(label: 'Kubernetes', color: kElectricBlue),
              _SkillChip(label: 'Firebase', color: kCyberpunkPink),
            ],
          ),
        ],
      ),
    );
  }
}

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

// ═════════════════════════════════════════════════════════
// TECH STACK SECTION
// ═════════════════════════════════════════════════════════
class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  static const _techItems = <_TechItem>[
    _TechItem('Flutter', Icons.flutter_dash, kElectricBlue),
    _TechItem('Dart', Icons.code, kCyberpunkPink),
    _TechItem('Node.js', Icons.dns, Color(0xFF68A063)),
    _TechItem('React', Icons.web, Color(0xFF61DAFB)),
    _TechItem('AWS', Icons.cloud, Color(0xFFFF9900)),
    _TechItem('GCP', Icons.cloud_queue, Color(0xFF4285F4)),
    _TechItem('Docker', Icons.directions_boat, Color(0xFF2496ED)),
    _TechItem('Kubernetes', Icons.hub, Color(0xFF326CE5)),
    _TechItem('Firebase', Icons.local_fire_department, Color(0xFFFFCA28)),
    _TechItem('PostgreSQL', Icons.storage, Color(0xFF336791)),
    _TechItem('MongoDB', Icons.eco, Color(0xFF47A248)),
    _TechItem('GraphQL', Icons.auto_graph, Color(0xFFE10098)),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        children: [
          const SectionTitle(number: '02.', title: 'Tech Stack'),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossCount = constraints.maxWidth > 900
                  ? 6
                  : constraints.maxWidth > 600
                      ? 4
                      : 3;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossCount,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: _techItems.length,
                itemBuilder: (context, index) {
                  final item = _techItems[index];
                  return AnimatedEntrance(
                    delay: Duration(milliseconds: 100 * index),
                    child: _TechCard(item: item),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TechItem {
  final String name;
  final IconData icon;
  final Color color;

  const _TechItem(this.name, this.icon, this.color);
}

class _TechCard extends StatefulWidget {
  final _TechItem item;

  const _TechCard({required this.item});

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          final pulseValue = _pulseController.value;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.identity()
              ..translate(0.0, _hovered ? -8.0 : sin(pulseValue * pi) * 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kCardBg,
              border: Border.all(
                color: _hovered
                    ? widget.item.color.withAlpha(180)
                    : widget.item.color.withAlpha(40),
                width: 1.5,
              ),
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                        color: widget.item.color.withAlpha(60),
                        blurRadius: 24,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.item.icon,
                  size: 40,
                  color: widget.item.color,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.item.name,
                  style: GoogleFonts.firaCode(
                    fontSize: 12,
                    color: kWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════
// PROJECTS SECTION
// ═════════════════════════════════════════════════════════
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static final _projects = <_ProjectData>[
    _ProjectData(
      title: 'CloudSync Dashboard',
      description:
          'A real-time cloud monitoring dashboard built with Flutter Web & Firebase, featuring live metrics, alerts, and beautiful charts.',
      tags: ['Flutter Web', 'Firebase', 'Charts'],
      gradient: [kCyberpunkPink, const Color(0xFF8B0050)],
      icon: Icons.dashboard,
    ),
    _ProjectData(
      title: 'NodeForge API',
      description:
          'A high-performance REST & GraphQL API gateway running on AWS Lambda with auto-scaling and zero-downtime deployments.',
      tags: ['Node.js', 'GraphQL', 'AWS Lambda'],
      gradient: [kElectricBlue, const Color(0xFF0080AA)],
      icon: Icons.api,
    ),
    _ProjectData(
      title: 'FlutterFolio',
      description:
          'A beautiful cross-platform portfolio builder app with drag-and-drop widgets, export to PDF, and custom themes.',
      tags: ['Flutter', 'Dart', 'Hive'],
      gradient: [const Color(0xFF7C3AED), const Color(0xFF4C1D95)],
      icon: Icons.apps,
    ),
    _ProjectData(
      title: 'InfraBot',
      description:
          'An intelligent Slack bot that manages cloud infrastructure — spin up VMs, check billing, deploy updates — all via chat.',
      tags: ['Node.js', 'GCP', 'Slack API'],
      gradient: [const Color(0xFFFF6B35), const Color(0xFFCC4400)],
      icon: Icons.smart_toy,
    ),
    _ProjectData(
      title: 'MediTrack',
      description:
          'A HIPAA-compliant mobile health app for tracking medications, appointments, and health metrics with offline-first architecture.',
      tags: ['Flutter', 'SQLite', 'BLoC'],
      gradient: [const Color(0xFF10B981), const Color(0xFF047857)],
      icon: Icons.health_and_safety,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return SectionWrapper(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 0 : 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
            child: const SectionTitle(number: '03.', title: 'Projects'),
          ),
          SizedBox(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: _projects.length,
              itemBuilder: (context, index) {
                return AnimatedEntrance(
                  delay: Duration(milliseconds: 150 * index),
                  child: _ProjectCard(project: _projects[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectData {
  final String title;
  final String description;
  final List<String> tags;
  final List<Color> gradient;
  final IconData icon;

  _ProjectData({
    required this.title,
    required this.description,
    required this.tags,
    required this.gradient,
    required this.icon,
  });
}

class _ProjectCard extends StatefulWidget {
  final _ProjectData project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: 320,
        margin: const EdgeInsets.only(right: 24, top: 8, bottom: 8),
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(_hovered ? -0.03 : 0)
          ..translate(0.0, _hovered ? -10.0 : 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kCardBg,
          border: Border.all(
            color: _hovered
                ? widget.project.gradient[0].withAlpha(150)
                : Colors.white.withAlpha(15),
            width: 1.5,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.project.gradient[0].withAlpha(50),
                    blurRadius: 32,
                    spreadRadius: 2,
                    offset: const Offset(0, 8),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withAlpha(60),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon header
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: LinearGradient(
                    colors: widget.project.gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.project.gradient[0].withAlpha(80),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Icon(
                  widget.project.icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.project.title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kWhite,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  widget.project.description,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: kGrey,
                    height: 1.6,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: widget.project.tags
                    .map(
                      (tag) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: widget.project.gradient[0].withAlpha(25),
                          border: Border.all(
                            color: widget.project.gradient[0].withAlpha(80),
                          ),
                        ),
                        child: Text(
                          tag,
                          style: GoogleFonts.firaCode(
                            fontSize: 11,
                            color: widget.project.gradient[0],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════
// CONTACT SECTION
// ═════════════════════════════════════════════════════════
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
              "Got a project in mind? Want to collaborate on something awesome?\nI'm always open to discussing new ideas and opportunities.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: kGrey,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _ContactButton(
                  icon: FontAwesomeIcons.github,
                  label: 'GitHub',
                  url: 'https://github.com/nanduv',
                  color: kWhite,
                ),
                _ContactButton(
                  icon: FontAwesomeIcons.linkedin,
                  label: 'LinkedIn',
                  url: 'https://linkedin.com/in/nanduv',
                  color: const Color(0xFF0A66C2),
                ),
                _ContactButton(
                  icon: FontAwesomeIcons.xTwitter,
                  label: 'Twitter',
                  url: 'https://twitter.com/nanduv',
                  color: kWhite,
                ),
                _ContactButton(
                  icon: Icons.email,
                  label: 'Email',
                  url: 'mailto:hello@nanduv.dev',
                  color: kCyberpunkPink,
                ),
              ],
            ),
            const SizedBox(height: 48),
            HoverScaleButton(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _launchUrl('mailto:hello@nanduv.dev'),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [kCyberpunkPink, kElectricBlue],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kCyberpunkPink.withAlpha(60),
                          blurRadius: 24,
                          spreadRadius: 2,
                          offset: const Offset(-4, 0),
                        ),
                        BoxShadow(
                          color: kElectricBlue.withAlpha(60),
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
          onTap: () => _launchUrl(url),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kCardBg,
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
                    color: kGrey,
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

// ─────────────────────────────────────────────────────────
// URL LAUNCHER HELPER
// ─────────────────────────────────────────────────────────
Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
