import 'package:flutter/material.dart';

/// Represents a portfolio project card.
class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;
  final List<Color> gradient;
  final IconData icon;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.gradient,
    required this.icon,
  });
}
