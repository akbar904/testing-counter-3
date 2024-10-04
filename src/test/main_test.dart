
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/main.dart';

void main() {
	group('Main App Initialization', () {
		testWidgets('App should have a MaterialApp widget', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			
			expect(find.byType(MaterialApp), findsOneWidget);
		});

		testWidgets('MaterialApp should have HomeScreen as initial route', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			
			final MaterialApp app = tester.widget(find.byType(MaterialApp));
			expect(app.home.runtimeType, HomeScreen);
		});
	});
}
