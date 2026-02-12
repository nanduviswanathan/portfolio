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
    ProjectModel(
      title: 'iEF Wearable Therapy Platform',
      description:
          'End-to-end mobile + cloud solution for a wearable medical device '
          'delivering Induced Electric Field (iEF) therapy for oncology '
          '(TNBC). Built the Flutter app connecting to the smart garment via '
          'BLE, with offline-first local storage and background cloud sync. '
          'Designed the full AWS serverless backend — Node.js Lambda functions, '
          'API Gateway, Amazon RDS — handling therapy logs, device mapping, '
          'and clinician dashboards with secure auth and data consistency.',
      tags: ['Flutter', 'Node.js', 'AWS Lambda', 'BLE', 'RDS'],
      gradient: [Color(0xFF7C3AED), Color(0xFF4C1D95)],
      icon: Icons.biotech,
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

  // ═══════════════════════════════════════════════════════
  // RESUME-ONLY DATA (used by PDF generator)
  // ═══════════════════════════════════════════════════════

  static const String resumeName = 'Nandu Viswanathan';
  static const String resumeTitle = 'Senior Software Engineer';
  static const String resumeLocation = 'Kochi, India';
  static const String resumePhone = '+91-9946421621';
  static const String resumeEmail = 'nanduvishwanathan@gmail.com';
  static const String resumeLinkedIn =
      'linkedin.com/in/nanduviswanathan';

  static const String resumeSummary =
      'Senior Software Engineer with 5+ years of experience in mobile '
      'application development, specializing in Flutter, native iOS, and '
      'Node.js serverless backends (AWS Lambda). Expertise in building '
      'high-performance, scalable applications with IoT/BLE integration, '
      'MVVM architecture, and Agile methodologies. Proven track record '
      'delivering FDA-compliant medical apps, IoT platforms, and cloud-connected '
      'mobile solutions. Passionate about clean code, mentoring teams, and '
      'shipping products that matter.';

  // ── Experience ─────────────────────────────────────────
  static const List<ResumeExperience> resumeExperience = [
    ResumeExperience(
      company: 'Gadgeon Smart Systems Pvt Limited',
      role: 'Senior Software Engineer',
      period: 'October 2024 – Present',
      bullets: [
        'Led design and deployment of complex mobile applications integrating payment gateways, IoT, and real-time communication, ensuring scalability and security.',
        'Built full-stack solution for iEF wearable therapy platform — Flutter app with BLE connectivity and Node.js AWS Lambda serverless backend with API Gateway, Cognito, and Amazon RDS.',
        'Mentored and guided junior developers, establishing best practices and fostering a collaborative team environment.',
        'Collaborated with stakeholders to align technical solutions with business objectives, delivering impactful software.',
      ],
    ),
    ResumeExperience(
      company: 'Gadgeon Smart Systems Pvt Limited',
      role: 'Software Engineer',
      period: 'September 2020 – September 2024',
      bullets: [
        'Designed, developed, and maintained mobile applications using Flutter and native iOS (Swift), delivering high-performance user-centric solutions.',
        'Built FDA-compliant medical device monitoring app with BLE communication, offline-first architecture, and auto-sync capabilities.',
        'Developed smart thermostat control app with REST API & MQTT, real-time monitoring, HVAC scheduling, and Stripe payment integration.',
        'Built real-time warehouse asset tracking system with MQTT, shortest-path algorithms, and C++ modules for enhanced performance.',
        'Implemented REST APIs and integrated third-party libraries to enhance application functionality and usability.',
        'Optimized application performance through debugging, profiling, and resolving bottlenecks.',
      ],
    ),
  ];

  // ── Education ──────────────────────────────────────────
  static const String educationDegree =
      'B.Tech in Computer Science and Engineering';
  static const String educationUniversity =
      'A P J Abdul Kalam Technological University';
  static const String educationPeriod = 'August 2016 – July 2020';

  // ── Resume Projects (detailed bullet points) ────────────
  static const List<ResumeProject> resumeProjects = [
    ResumeProject(
      title: 'Smart Thermostat Control Application',
      bullets: [
        'Developed a robust mobile application enabling seamless communication with smart thermostat devices through REST API and MQTT protocols, integrated with a cloud platform.',
        'Implemented comprehensive user and device management for efficient registration and onboarding processes.',
        'Enabled real-time device monitoring and alert delivery for critical updates and system events.',
        'Designed specialized features for pet monitoring, ensuring safety and comfort in various environments.',
        'Provided users with access to HVAC system details and control, facilitating optimal temperature management.',
        'Integrated GPS location sharing functionality for improved navigation and coordination.',
        'Built a temperature scheduling system, allowing users to automate weekly HVAC settings for energy efficiency and convenience.',
        'Incorporated auto payment features for seamless transactions and uninterrupted services.',
      ],
    ),
    ResumeProject(
      title: 'Medical Device Monitoring Application',
      bullets: [
        'Designed and developed an FDA-compliant application for monitoring patient data using BLE and REST API communication protocols, ensuring adherence to stringent regulatory standards.',
        'Focused on Flutter UI development, ensuring a clean, intuitive, and user-friendly interface.',
        'Integrated a local notification system for therapy scheduling, improving patient care and adherence.',
        'Implemented offline functionality with an auto-sync feature, enabling data to be stored locally and seamlessly uploaded to the server when an internet connection is available, ensuring continuity and accuracy.',
      ],
    ),
    ResumeProject(
      title: 'iEF Wearable Therapy Platform',
      bullets: [
        'Led development of a mobile + cloud solution for a wearable medical device delivering Induced Electric Field (iEF) therapy for oncology applications (TNBC).',
        'Built the Flutter application connecting to the smart garment wearable via BLE, with offline-first local storage and periodic background synchronization to cloud.',
        'Designed the full AWS serverless backend using Node.js deployed on AWS Lambda, integrated with API Gateway and Amazon RDS for structured relational data storage.',
        'Implemented secure BLE-to-cloud data pipeline for therapy logs, device mapping, and clinician dashboards.',
        'Designed an offline-first data synchronization strategy (local storage to periodic cloud upload) ensuring reliability and data consistency.',
        'Built scalable RESTful APIs with structured error handling, validation, and environment-based deployment.',
      ],
    ),
    ResumeProject(
      title: 'Warehouse Asset Tracking System',
      bullets: [
        'Built a real-time asset tracking application with optimized shortest-path calculation capabilities.',
        'Developed user-friendly interfaces and integrated MQTT for efficient real-time communication.',
        'Incorporated advanced functionalities like API integration and C++ modules for enhanced performance.',
      ],
    ),
  ];

  // ── Skills (categorized for resume) ────────────────────
  static const List<ResumeSkillCategory> resumeSkillCategories = [
    ResumeSkillCategory(
      category: 'Programming Languages and Frameworks',
      skills: 'Dart, Flutter SDK, Swift, Node.js',
    ),
    ResumeSkillCategory(
      category: 'Protocols and Communication',
      skills: 'IoT, Bluetooth Low Energy (BLE), MQTT',
    ),
    ResumeSkillCategory(
      category: 'State Management & Architecture',
      skills: 'Provider, GetX, MVVM, MVC',
    ),
    ResumeSkillCategory(
      category: 'Backend and APIs',
      skills:
          'REST API, Node.js, AWS Lambda, API Gateway, Amazon Cognito, Amazon RDS, '
          'Firebase: Firebase Authentication, Cloud Firestore, Firebase Analytics, '
          'Firebase Crashlytics',
    ),
    ResumeSkillCategory(
      category: 'Tools and Platforms',
      skills:
          'Xcode, Android Studio, VS Code, Version Control: Git, Bitbucket, '
          'Collaboration Tools: Atlassian Suite (Jira, Confluence)',
    ),
    ResumeSkillCategory(
      category: 'Deployment and Publishing',
      skills: 'Google Play Store and Apple App Store Publishing',
    ),
    ResumeSkillCategory(
      category: 'Specialized Integrations',
      skills: 'Stripe, Apple Push Notifications, Firebase Push Notifications',
    ),
  ];

  // ── Languages ──────────────────────────────────────────
  static const List<String> resumeLanguages = ['English', 'Malayalam'];
}

// ── Resume models (kept here to avoid extra files) ───────

class ResumeExperience {
  final String company;
  final String role;
  final String period;
  final List<String> bullets;

  const ResumeExperience({
    required this.company,
    required this.role,
    required this.period,
    required this.bullets,
  });
}

class ResumeProject {
  final String title;
  final List<String> bullets;

  const ResumeProject({required this.title, required this.bullets});
}

class ResumeSkillCategory {
  final String category;
  final String skills;

  const ResumeSkillCategory({required this.category, required this.skills});
}
