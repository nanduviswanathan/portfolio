import 'package:flutter_test/flutter_test.dart';
import 'package:nandu_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text('<NV/>'), findsOneWidget);
  });
}
