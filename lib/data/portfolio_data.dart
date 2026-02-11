import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/theme/app_colors.dart';
import 'models/project_model.dart';
import 'models/tech_item_model.dart';

/// ─────────────────────────────────────────────────────────
/// Single source of truth for ALL portfolio content.
/// Edit this file to update your portfolio — no digging
/// through widget trees.
/// ─────────────────────────────────────────────────────────
abstract final class PortfolioData {
  // ── Personal ─────────────────────────────────────────
  static const String name = 'Nandu\nViswanathan.';
  static const String greeting = "Hey there! I'm";
  static const String email = 'mailto:hello@nanduv.dev';

  // ── Hero typewriter lines ────────────────────────────
  static const List<String> typewriterLines = [
    'Architecting Clouds & Crafting Apps.',
    'Flutter Developer. Node.js Wizard.',
    'Cloud Architect. Problem Solver.',
  ];

  // ── About ────────────────────────────────────────────
  static const String bioLeading =
      "I'm a passionate full-stack engineer who lives at the intersection of ";
  static const String bioHighlight1 = 'beautiful front-end experiences';
  static const String bioMid = ' and ';
  static const String bioHighlight2 = 'scalable cloud infrastructure';
  static const String bioTrailing =
      ". From pixel-perfect Flutter apps to globally distributed Node.js APIs "
      "and robust AWS/GCP architectures — I ship the whole stack.\n\n"
      "I believe great products are born when design thinking meets engineering "
      "excellence. Whether it's orchestrating Kubernetes clusters, designing "
      "serverless pipelines, or crafting micro-interactions in Flutter — I bring "
      "the same energy and obsessive attention to detail.";

  static const List<({String label, Color color})> skillChips = [
    (label: 'Flutter', color: AppColors.electricBlue),
    (label: 'Node.js', color: AppColors.cyberpunkPink),
    (label: 'AWS', color: AppColors.electricBlue),
    (label: 'GCP', color: AppColors.cyberpunkPink),
    (label: 'React', color: AppColors.electricBlue),
    (label: 'Docker', color: AppColors.cyberpunkPink),
    (label: 'Kubernetes', color: AppColors.electricBlue),
    (label: 'Firebase', color: AppColors.cyberpunkPink),
  ];

  // ── Tech Stack ───────────────────────────────────────
  static const List<TechItemModel> techStack = [
    TechItemModel(name: 'Flutter', icon: Icons.flutter_dash, color: AppColors.electricBlue),
    TechItemModel(name: 'Dart', icon: Icons.code, color: AppColors.cyberpunkPink),
    TechItemModel(name: 'Node.js', icon: Icons.dns, color: Color(0xFF68A063)),
    TechItemModel(name: 'React', icon: Icons.web, color: Color(0xFF61DAFB)),
    TechItemModel(name: 'AWS', icon: Icons.cloud, color: Color(0xFFFF9900)),
    TechItemModel(name: 'GCP', icon: Icons.cloud_queue, color: Color(0xFF4285F4)),
    TechItemModel(name: 'Docker', icon: Icons.directions_boat, color: Color(0xFF2496ED)),
    TechItemModel(name: 'Kubernetes', icon: Icons.hub, color: Color(0xFF326CE5)),
    TechItemModel(name: 'Firebase', icon: Icons.local_fire_department, color: Color(0xFFFFCA28)),
    TechItemModel(name: 'PostgreSQL', icon: Icons.storage, color: Color(0xFF336791)),
    TechItemModel(name: 'MongoDB', icon: Icons.eco, color: Color(0xFF47A248)),
    TechItemModel(name: 'GraphQL', icon: Icons.auto_graph, color: Color(0xFFE10098)),
  ];

  // ── Projects ─────────────────────────────────────────
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'CloudSync Dashboard',
      description:
          'A real-time cloud monitoring dashboard built with Flutter Web & '
          'Firebase, featuring live metrics, alerts, and beautiful charts.',
      tags: ['Flutter Web', 'Firebase', 'Charts'],
      gradient: [AppColors.cyberpunkPink, Color(0xFF8B0050)],
      icon: Icons.dashboard,
    ),
    ProjectModel(
      title: 'NodeForge API',
      description:
          'A high-performance REST & GraphQL API gateway running on AWS Lambda '
          'with auto-scaling and zero-downtime deployments.',
      tags: ['Node.js', 'GraphQL', 'AWS Lambda'],
      gradient: [AppColors.electricBlue, Color(0xFF0080AA)],
      icon: Icons.api,
    ),
    ProjectModel(
      title: 'FlutterFolio',
      description:
          'A beautiful cross-platform portfolio builder app with drag-and-drop '
          'widgets, export to PDF, and custom themes.',
      tags: ['Flutter', 'Dart', 'Hive'],
      gradient: [Color(0xFF7C3AED), Color(0xFF4C1D95)],
      icon: Icons.apps,
    ),
    ProjectModel(
      title: 'InfraBot',
      description:
          'An intelligent Slack bot that manages cloud infrastructure — spin up '
          'VMs, check billing, deploy updates — all via chat.',
      tags: ['Node.js', 'GCP', 'Slack API'],
      gradient: [Color(0xFFFF6B35), Color(0xFFCC4400)],
      icon: Icons.smart_toy,
    ),
    ProjectModel(
      title: 'MediTrack',
      description:
          'A HIPAA-compliant mobile health app for tracking medications, '
          'appointments, and health metrics with offline-first architecture.',
      tags: ['Flutter', 'SQLite', 'BLoC'],
      gradient: [Color(0xFF10B981), Color(0xFF047857)],
      icon: Icons.health_and_safety,
    ),
  ];

  // ── Social / Contact links ───────────────────────────
  static const List<({IconData icon, String label, String url, Color color})>
      socialLinks = [
    (
      icon: FontAwesomeIcons.github,
      label: 'GitHub',
      url: 'https://github.com/nanduv',
      color: AppColors.white,
    ),
    (
      icon: FontAwesomeIcons.linkedin,
      label: 'LinkedIn',
      url: 'https://linkedin.com/in/nanduv',
      color: Color(0xFF0A66C2),
    ),
    (
      icon: FontAwesomeIcons.xTwitter,
      label: 'Twitter',
      url: 'https://twitter.com/nanduv',
      color: AppColors.white,
    ),
    (
      icon: Icons.email,
      label: 'Email',
      url: 'mailto:hello@nanduv.dev',
      color: AppColors.cyberpunkPink,
    ),
  ];

  static const String contactHeadline =
      "Got a project in mind? Want to collaborate on something awesome?\n"
      "I'm always open to discussing new ideas and opportunities.";

  static const String footerText =
      '© 2026 Nandu Viswanathan. Built with Flutter & a lot of caffeine.';
}
