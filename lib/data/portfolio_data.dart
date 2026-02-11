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
      'Flutter, native iOS & Node.js';
  static const String bioMid = ' with deep expertise in ';
  static const String bioHighlight2 =
      'IoT, BLE, and AWS serverless architectures';
  static const String bioTrailing =
      ". I build high-performance mobile apps end-to-end — from "
      "pixel-perfect Flutter UIs to Node.js-powered AWS Lambda backends "
      "with Cognito auth and API Gateway.\n\n"
      "Currently a Senior Software Engineer at Gadgeon Smart Systems, I lead "
      "complex projects integrating payment gateways, IoT protocols, and "
      "cloud platforms. From FDA-compliant medical monitors to smart "
      "thermostat controllers — I ship the full stack. Passionate about "
      "clean architecture (MVVM), mentoring developers, and delivering "
      "seamless user experiences.";

  static const List<({String label, Color color})> skillChips = [
    (label: 'Flutter', color: AppColors.electricBlue),
    (label: 'Dart', color: AppColors.cyberpunkPink),
    (label: 'Node.js', color: AppColors.electricBlue),
    (label: 'Swift', color: AppColors.cyberpunkPink),
    (label: 'AWS Lambda', color: AppColors.electricBlue),
    (label: 'Firebase', color: AppColors.cyberpunkPink),
    (label: 'REST API', color: AppColors.electricBlue),
    (label: 'BLE', color: AppColors.cyberpunkPink),
    (label: 'MQTT', color: AppColors.electricBlue),
    (label: 'IoT', color: AppColors.cyberpunkPink),
    (label: 'Cognito', color: AppColors.electricBlue),
    (label: 'MVVM', color: AppColors.cyberpunkPink),
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
      name: 'Node.js',
      icon: Icons.dns,
      color: Color(0xFF68A063),
    ),
    TechItemModel(
      name: 'Swift',
      icon: Icons.apple,
      color: Color(0xFFFA7343),
    ),
    TechItemModel(
      name: 'AWS Lambda',
      icon: Icons.cloud,
      color: Color(0xFFFF9900),
    ),
    TechItemModel(
      name: 'Cognito',
      icon: Icons.verified_user,
      color: Color(0xFFDD344C),
    ),
    TechItemModel(
      name: 'API Gateway',
      icon: Icons.api,
      color: Color(0xFF6C3DCC),
    ),
    TechItemModel(
      name: 'Firebase',
      icon: Icons.local_fire_department,
      color: Color(0xFFFFCA28),
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
      name: 'Git',
      icon: Icons.merge_type,
      color: Color(0xFFF05032),
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
          'An FDA-compliant app for monitoring patient data via BLE. '
          'Built Node.js AWS Lambda functions to store device data in AWS '
          'databases, with Cognito auth and API Gateway. Features offline-first '
          'architecture with auto-sync, therapy scheduling, and a clean '
          'Flutter UI to stringent regulatory standards.',
      tags: ['Flutter', 'BLE', 'Node.js', 'AWS Lambda', 'Cognito'],
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
      "Need a Flutter app with a serverless backend? An IoT solution end-to-end?\n"
      "I'm always open to discussing exciting development opportunities.";

  static const String footerText =
      '© 2026 Nandu Viswanathan. Built with Flutter & a lot of caffeine.';
}
