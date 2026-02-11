import 'dart:math';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Full-screen animated particle field that floats upward.
class ParticleBackground extends StatefulWidget {
  const ParticleBackground({super.key});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
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
            ? AppColors.cyberpunkPink.withAlpha(60 + _random.nextInt(60))
            : AppColors.electricBlue.withAlpha(60 + _random.nextInt(60)),
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

// ── Internal data class ──────────────────────────────────
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
