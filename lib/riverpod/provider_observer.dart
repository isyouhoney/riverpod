import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver{
  @override

  // Logger 하위에 있는 모든 Provider들이 업데이트 됐을 때
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {

  }
  // Logger 하위에 Provider가 추가 됐을 때
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {

  }
  // Logger 하위에 Provider가 삭제 됐을 때
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {

  }

}