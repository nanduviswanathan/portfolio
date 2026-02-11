import 'package:url_launcher/url_launcher.dart';

/// Utility to launch external URLs safely.
Future<void> launchExternalUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
