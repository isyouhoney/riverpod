import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

@Riverpod(keepAlive: false)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// family parameter를 일반 함수처럼 사용
class Parameter {
  final int number1;
  final int number2;

  Parameter({required this.number1, required this.number2});
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.number1 * parameter.number2,
);

@riverpod
int gStateMultiply(GStateMultiplyRef ref,
    {required int number1, required int number2}) {
  return number1 * number2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {
  // build 함수 내부에 초기 상태 지정
  @override
  int build() {
    return 0;
  }

  // 기능
  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
