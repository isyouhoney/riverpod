import 'package:actual/layout/default_layout.dart';
import 'package:actual/riverpod/code_generation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    return DefaultLayout(title: 'CodeGenerationScreen', body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("State1 : $state1"),
        state2.when(
            data: (data) {
              return Text(
                "State2 : $data",
                textAlign: TextAlign.center,
              );
            },
            error: (err, stack) => Text(err.toString()),
            loading: () => CircularProgressIndicator()),
      ],
    ));
  }
}
