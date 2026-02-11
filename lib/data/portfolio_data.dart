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
  static const String email = 'mailto:nanduvishwanathan@gmail.com';

  // ── Hero typewriter lines ────────────────────────────
  static const List<String> typewriterLines = [
    'Senior Software Engineer. 5+ Years.',
    'Flutter Specialist. iOS Native Dev. Node.js Wizard.',
    'Building Apps that Matter.',
  ];

  // ── About ────────────────────────────────────────────
  static const String bioLeading =
      "I'm a Senior Software Engineer with 5+ years of experience, specializing in ";
  static const String bioHighlight1 =
      'Flutter & native iOS development';
  static const String bioMid = ' with deep expertise in ';
  static const String bioHighlight2 =
      'IoT, BLE, and real-time communication';
  static const String bioTrailing =
      ". I build high-performance, scalable mobile applications — from "
      "FDA-compliant medical device monitors to smart thermostat controllers "
      "and real-time warehouse tracking systems.\n\n"
      "Currently a Senior Software Engineer at Gadgeon Smart Systems, I lead "
      "complex mobile projects integrating payment gateways, IoT protocols, "
      "and cloud platforms. I'm passionate about clean architecture (MVVM), "
      "mentoring developers, and shipping products that deliver seamless "
      "user experiences.";

  static const List<({String label, Color color})> skillChips = [
    (label: 'Flutter', color: AppColors.electricBlue),
    (label: 'Dart', color: AppColors.cyberpunkPink),
    (label: 'Swift', color: AppColors.electricBlue),
    (label: 'Firebase', color: AppColors.cyberpunkPink),
    (label: 'REST API', color: AppColors.electricBlue),
    (label: 'BLE', color: AppColors.cyberpunkPink),
    (label: 'MQTT', color: AppColors.electricBlue),
    (label: 'IoT', color: AppColors.cyberpunkPink),
    (label: 'MVVM', color: AppColors.electricBlue),
    (label: 'Stripe', color: AppColors.cyberpunkPink),
  ];

  // ── Tech Stack ───────────────────────────────────────
  static const List<TechItemModel> techStack = [
    TechItemModel(
      name: 'Flutter',
      icon: Icons.flutter_dash,
      color: AppColors.electricBlue,
    ),
    TechItemModel(
      name: 'Dart',
      icon: Icons.code,
      color: AppColors.cyberpunkPink,
    ),
    TechItemModel(
      name: 'Swift',
      icon: Icons.apple,
      color: Color(0xFFFA7343),
    ),
    TechItemModel(
      name: 'Firebase',
      icon: Icons.local_fire_department,
      color: Color(0xFFFFCA28),
    ),
    TechItemModel(
      name: 'REST API',
      icon: Icons.api,
      color: Color(0xFF61DAFB),
    ),
    TechItemModel(
      name: 'BLE',
      icon: Icons.bluetooth,
      color: Color(0xFF0082FC),
    ),
    TechItemModel(
      name: 'MQTT',
      icon: Icons.cell_tower,
      color: Color(0xFF660066),
    ),
    TechItemModel(
      name: 'IoT',
      icon: Icons.devices_other,
      color: Color(0xFF00B894),
    ),
    TechItemModel(
      name: 'Provider',
      icon: Icons.account_tree,
      color: Color(0xFF6C5CE7),
    ),
    TechItemModel(
      name: 'GetX',
      icon: Icons.speed,
      color: Color(0xFF8E44AD),
    ),
    TechItemModel(
      name: 'Git',
      icon: Icons.merge_type,
      color: Color(0xFFF05032),
    ),
    TechItemModel(
      name: 'Stripe',
      icon: Icons.payment,
      color: Color(0xFF635BFF),
    ),
  ];

  // ── Projects ─────────────────────────────────────────
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'Smart Thermostat Control',
      description:
          'A robust IoT mobile app enabling communication with smart thermostat '
          'devices via REST API & MQTT. Features real-time monitoring, GPS '
          'location sharing, weekly HVAC scheduling, pet monitoring, and '
          'integrated auto-payments via Stripe.',
      tags: ['Flutter', 'MQTT', 'IoT', 'REST API', 'Stripe'],
      gradient: [AppColors.cyberpunkPink, Color(0xFF8B0050)],
      icon: Icons.thermostat,
    ),
    ProjectModel(
      title: 'Medical Device Monitor',
      description:
          'An FDA-compliant application for monitoring patient data using BLE '
          'and REST API. Features offline-first architecture with auto-sync, '
          'therapy scheduling via local notifications, and a clean, intuitive '
          'Flutter UI built to stringent regulatory standards.',
      tags: ['Flutter', 'BLE', 'FDA', 'Offline-First'],
      gradient: [Color(0xFF10B981), Color(0xFF047857)],
      icon: Icons.health_and_safety,
    ),
    ProjectModel(
      title: 'Warehouse Asset Tracker',
      description:
          'A real-time asset tracking system with optimized shortest-path '
          'calculation. Built with MQTT for efficient real-time communication, '
          'REST API integration, and C++ modules for high-performance '
          'pathfinding algorithms.',
      tags: ['Flutter', 'MQTT', 'C++', 'Real-Time'],
      gradient: [AppColors.electricBlue, Color(0xFF0080AA)],
      icon: Icons.warehouse,
    ),
  ];

  // ── Social / Contact links ───────────────────────────
  static const List<({IconData icon, String label, String url, Color color})>
      socialLinks = [
    (
      icon: FontAwesomeIcons.github,
      label: 'GitHub',
      url: 'https://github.com/nanduviswanathan',
      color: AppColors.white,
    ),
    (
      icon: FontAwesomeIcons.linkedin,
      label: 'LinkedIn',
      url: 'https://www.linkedin.com/in/nanduviswanathan',
      color: Color(0xFF0A66C2),
    ),
    (
      icon: Icons.email,
      label: 'Email',
      url: 'mailto:nanduvishwanathan@gmail.com',
      color: AppColors.cyberpunkPink,
    ),
    (
      icon: Icons.phone,
      label: 'Call',
      url: 'tel:+919946421621',
      color: AppColors.electricBlue,
    ),
  ];

  static const String contactHeadline =
      "Have a Flutter project or an IoT app idea? Let's build it together.\n"
      "I'm always open to discussing exciting mobile development opportunities.";

  static const String footerText =
      '© 2026 Nandu Viswanathan. Built with Flutter & a lot of caffeine.';
}
