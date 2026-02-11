import 'package:flutter/material.dart';

/// Centralized color palette for the entire portfolio.
/// Cyberpunk dark theme with neon accents.
abstract final class AppColors {
  // ── Backgrounds ──────────────────────────────────────
  static const Color background = Color(0xFF0D0D0D);
  static const Color surface = Color(0xFF1A1A2E);
  static const Color cardBg = Color(0xFF16213E);

  // ── Neon Accents ─────────────────────────────────────
  static const Color cyberpunkPink = Color(0xFFFF007F);
  static const Color electricBlue = Color(0xFF00FFFF);

  // ── Neutrals ─────────────────────────────────────────
  static const Color white = Color(0xFFF0F0F0);
  static const Color grey = Color(0xFF8892B0);

  // ── Gradients (reusable) ─────────────────────────────
  static const LinearGradient neonGradient = LinearGradient(
    colors: [cyberpunkPink, electricBlue],
  );

  static const LinearGradient pinkGradient = LinearGradient(
    colors: [cyberpunkPink, Color(0xFFBF0060)],
  );
}
