import 'package:flutter/material.dart';

/// Represents a single technology in the Tech Stack grid.
class TechItemModel {
  final String name;
  final IconData icon;
  final Color color;

  const TechItemModel({
    required this.name,
    required this.icon,
    required this.color,
  });
}
