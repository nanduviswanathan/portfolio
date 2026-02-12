import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../data/portfolio_data.dart';

/// Generates an ATS-friendly PDF resume matching the exact format
/// of the original resume: two-column section-label layout.
abstract final class ResumeGenerator {
  // ── Column widths (label | content) ────────────────────
  static const double _labelFlex = 1;
  static const double _contentFlex = 4;

  /// Build the PDF and trigger browser download.
  static Future<void> downloadResume() async {
    final pdf = await _buildPdf();
    await Printing.sharePdf(
      bytes: pdf,
      filename: 'Nandu Viswanathan_senior_software_engineer.pdf',
    );
  }

  // ─────────────────────────────────────────────────────
  // PDF construction
  // ─────────────────────────────────────────────────────
  static Future<Uint8List> _buildPdf() async {
    final doc = pw.Document(
      title: 'Nandu Viswanathan — Resume',
      author: 'Nandu Viswanathan',
    );

    // ── Styles ─────────────────────────────────────────
    final nameStyle = pw.TextStyle(
      fontSize: 20,
      fontWeight: pw.FontWeight.bold,
    );
    final titleStyle = pw.TextStyle(fontSize: 11, color: PdfColors.grey700);
    final contactStyle = pw.TextStyle(fontSize: 9, color: PdfColors.grey600);
    final sectionLabel = pw.TextStyle(
      fontSize: 10,
      fontWeight: pw.FontWeight.bold,
      color: PdfColors.grey800,
    );
    final bodyText = const pw.TextStyle(fontSize: 9.5);
    final boldText = pw.TextStyle(
      fontSize: 9.5,
      fontWeight: pw.FontWeight.bold,
    );
    final italicText = pw.TextStyle(
      fontSize: 9,
      fontStyle: pw.FontStyle.italic,
      color: PdfColors.grey700,
    );
    final bulletText = const pw.TextStyle(fontSize: 9);
    final skillCatStyle = pw.TextStyle(
      fontSize: 9,
      fontWeight: pw.FontWeight.bold,
    );
    final skillValStyle = const pw.TextStyle(fontSize: 9);

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 36, vertical: 30),
        build: (context) => [
          // ═══════════════════════════════════════════════
          // HEADER — Name, Title, Contact (centered)
          // ═══════════════════════════════════════════════
          pw.Center(child: pw.Text(PortfolioData.resumeName, style: nameStyle)),
          pw.SizedBox(height: 2),
          pw.Center(
            child: pw.Text(PortfolioData.resumeTitle, style: titleStyle),
          ),
          pw.SizedBox(height: 5),
          pw.Center(
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(PortfolioData.resumeLocation, style: contactStyle),
                _dot(),
                pw.Text(PortfolioData.resumePhone, style: contactStyle),
                _dot(),
                pw.Text(PortfolioData.resumeEmail, style: contactStyle),
                _dot(),
                pw.UrlLink(
                  destination: 'https://www.linkedin.com/in/nanduviswanathan',
                  child: pw.Text(
                    'https://www.linkedin.com/in/nanduviswanathan',
                    style: pw.TextStyle(fontSize: 9, color: PdfColors.blue800),
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 10),
          _thinLine(),

          // ═══════════════════════════════════════════════
          // SUMMARY
          // ═══════════════════════════════════════════════
          _sectionRow(
            label: 'Summary',
            sectionLabel: sectionLabel,
            child: pw.Text(PortfolioData.resumeSummary, style: bodyText),
          ),
          _thinLine(),

          // ═══════════════════════════════════════════════
          // EXPERIENCE
          // ═══════════════════════════════════════════════
          _sectionRow(
            label: 'Experience',
            sectionLabel: sectionLabel,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                for (
                  int i = 0;
                  i < PortfolioData.resumeExperience.length;
                  i++
                ) ...[
                  if (i > 0) pw.SizedBox(height: 10),
                  _experienceBlock(
                    PortfolioData.resumeExperience[i],
                    boldText,
                    italicText,
                    bulletText,
                  ),
                ],
              ],
            ),
          ),
          _thinLine(),

          // ═══════════════════════════════════════════════
          // EDUCATION
          // ═══════════════════════════════════════════════
          _sectionRow(
            label: 'Education',
            sectionLabel: sectionLabel,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Text(
                        PortfolioData.educationUniversity,
                        style: boldText,
                      ),
                    ),
                    pw.Text(PortfolioData.educationPeriod, style: italicText),
                  ],
                ),
                pw.SizedBox(height: 2),
                pw.Text(PortfolioData.educationDegree, style: bodyText),
              ],
            ),
          ),
          _thinLine(),

          // ═══════════════════════════════════════════════
          // PROJECTS
          // ═══════════════════════════════════════════════
          _sectionRow(
            label: 'Projects',
            sectionLabel: sectionLabel,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                for (
                  int i = 0;
                  i < PortfolioData.resumeProjects.length;
                  i++
                ) ...[
                  if (i > 0) pw.SizedBox(height: 8),
                  _projectBlock(
                    PortfolioData.resumeProjects[i],
                    boldText,
                    bulletText,
                  ),
                ],
              ],
            ),
          ),
          _thinLine(),

          // ═══════════════════════════════════════════════
          // SKILLS
          // ═══════════════════════════════════════════════
          _sectionRow(
            label: 'Skills',
            sectionLabel: sectionLabel,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                for (final cat in PortfolioData.resumeSkillCategories) ...[
                  pw.Text(cat.category, style: skillCatStyle),
                  pw.SizedBox(height: 1),
                  pw.Text(cat.skills, style: skillValStyle),
                  pw.SizedBox(height: 6),
                ],
              ],
            ),
          ),
          _thinLine(),

          // ═══════════════════════════════════════════════
          // LANGUAGES
          // ═══════════════════════════════════════════════
          _sectionRow(
            label: 'Languages',
            sectionLabel: sectionLabel,
            child: pw.Text(
              PortfolioData.resumeLanguages.join('\n'),
              style: bodyText,
            ),
          ),
        ],
      ),
    );

    return doc.save();
  }

  // ─────────────────────────────────────────────────────
  // HELPERS
  // ─────────────────────────────────────────────────────

  /// Two-column row: section label on the left, content on the right.
  /// This matches the original resume format exactly.
  static pw.Widget _sectionRow({
    required String label,
    required pw.TextStyle sectionLabel,
    required pw.Widget child,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 8),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Expanded(
            flex: _labelFlex.toInt(),
            child: pw.Text(label, style: sectionLabel),
          ),
          pw.SizedBox(width: 12),
          pw.Expanded(flex: _contentFlex.toInt(), child: child),
        ],
      ),
    );
  }

  /// Experience block: company, role, period, then plain paragraphs.
  static pw.Widget _experienceBlock(
    ResumeExperience exp,
    pw.TextStyle boldText,
    pw.TextStyle italicText,
    pw.TextStyle bulletText,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(exp.company, style: boldText),
        pw.Text(exp.role, style: italicText),
        pw.Text(exp.period, style: italicText),
        pw.SizedBox(height: 4),
        for (final b in exp.bullets)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 3),
            child: pw.Text(b, style: bulletText),
          ),
      ],
    );
  }

  /// Project block: title then plain paragraphs.
  static pw.Widget _projectBlock(
    ResumeProject project,
    pw.TextStyle boldText,
    pw.TextStyle bulletText,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(project.title, style: boldText),
        pw.SizedBox(height: 3),
        for (final b in project.bullets)
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 3),
            child: pw.Text(b, style: bulletText),
          ),
      ],
    );
  }

  /// Thin horizontal divider line.
  static pw.Widget _thinLine() {
    return pw.Divider(thickness: 0.5, color: PdfColors.grey300);
  }

  /// Small separator dot for the contact line.
  static pw.Widget _dot() {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(horizontal: 6),
      child: pw.Text(
        '·',
        style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
      ),
    );
  }
}
