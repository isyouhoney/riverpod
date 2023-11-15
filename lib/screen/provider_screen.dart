import 'package:actual/layout/default_layout.dart';
import 'package:actual/riverpod/provider.dart';
import 'package:actual/riverpod/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);

    return DefaultLayout(
        title: 'ProviderScreen',
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => FilterState.values
                  .map((e) => PopupMenuItem(
                        child: Text(e.name),
                        value: e,
                      ))
                  .toList(),
          onSelected: (value){
                ref.read(filterProvider.notifier).update((state) => value);
          },)
        ],
        body: ListView(
          children: state
              .map((e) => CheckboxListTile(
                  title: Text(e.name),
                  value: e.hasBought,
                  onChanged: (value) {
                    ref
                        .read(shoppingListProvider.notifier)
                        .toggleHasBought(name: e.name);
                  }))
              .toList(),
        ));
  }
}
