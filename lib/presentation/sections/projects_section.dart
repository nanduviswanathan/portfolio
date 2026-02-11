import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/project_model.dart';
import '../../data/portfolio_data.dart';
import '../widgets/animated_entrance.dart';
import '../widgets/section_title.dart';
import '../widgets/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final projects = PortfolioData.projects;

    return SectionWrapper(
      padding:
          EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 0 : 20),
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
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return AnimatedEntrance(
                  delay: Duration(milliseconds: 150 * index),
                  child: _ProjectCard(project: projects[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ── Private: Project card with tilt + lift on hover ──────
class _ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final g = widget.project.gradient;

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
          color: AppColors.cardBg,
          border: Border.all(
            color: _hovered ? g[0].withAlpha(150) : Colors.white.withAlpha(15),
            width: 1.5,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: g[0].withAlpha(50),
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
                    colors: g,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(color: g[0].withAlpha(80), blurRadius: 16),
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
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  widget.project.description,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.grey,
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
                          color: g[0].withAlpha(25),
                          border: Border.all(color: g[0].withAlpha(80)),
                        ),
                        child: Text(
                          tag,
                          style: GoogleFonts.firaCode(
                            fontSize: 11,
                            color: g[0],
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
