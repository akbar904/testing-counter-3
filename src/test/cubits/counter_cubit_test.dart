
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

void main() {
	group('CounterCubit', () {
		blocTest<CounterCubit, int>(
			'emits [1] when increment is called',
			build: () => CounterCubit(),
			act: (cubit) => cubit.increment(),
			expect: () => [1],
		);

		blocTest<CounterCubit, int>(
			'emits [-1] when decrement is called from initial state',
			build: () => CounterCubit(),
			act: (cubit) => cubit.decrement(),
			expect: () => [-1],
		);

		blocTest<CounterCubit, int>(
			'emits [1, 0] when increment then decrement is called',
			build: () => CounterCubit(),
			act: (cubit) {
				cubit.increment();
				cubit.decrement();
			},
			expect: () => [1, 0],
		);
	});
}
