
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/screens/home_screen.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

// Mock CounterCubit for testing
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		testWidgets('displays initial counter value', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('displays increment button', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.byIcon(Icons.add), findsOneWidget);
		});

		testWidgets('displays decrement button', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.byIcon(Icons.remove), findsOneWidget);
		});

		testWidgets('tapping increment button triggers cubit increment', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.add));
			verify(() => mockCounterCubit.increment()).called(1);
		});

		testWidgets('tapping decrement button triggers cubit decrement', (WidgetTester tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>.value(
						value: mockCounterCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byIcon(Icons.remove));
			verify(() => mockCounterCubit.decrement()).called(1);
		});
	});
}
