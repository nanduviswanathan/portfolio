import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'presentation/home/portfolio_home.dart';

/// Root widget — configures theme and routes.
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nandu Viswanathan — Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHome(),
    );
  }
}
