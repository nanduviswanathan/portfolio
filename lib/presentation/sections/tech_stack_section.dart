import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/tech_item_model.dart';
import '../../data/portfolio_data.dart';
import '../widgets/animated_entrance.dart';
import '../widgets/section_title.dart';
import '../widgets/section_wrapper.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = PortfolioData.techStack;

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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return AnimatedEntrance(
                    delay: Duration(milliseconds: 100 * index),
                    child: _TechCard(item: items[index]),
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

// ── Private: Animated tech card with pulse + hover ───────
class _TechCard extends StatefulWidget {
  final TechItemModel item;

  const _TechCard({required this.item});

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
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
              ..translate(
                  0.0, _hovered ? -8.0 : sin(pulseValue * pi) * 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.cardBg,
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
                Icon(widget.item.icon, size: 40, color: widget.item.color),
                const SizedBox(height: 10),
                Text(
                  widget.item.name,
                  style: GoogleFonts.firaCode(
                    fontSize: 12,
                    color: AppColors.white,
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
