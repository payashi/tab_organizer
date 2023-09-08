import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_organizer/providers/category_info_notifier.dart';

class PersonalityScreen extends HookConsumerWidget {
  const PersonalityScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(categoryInfoNotifier).when(
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: (error, _) => Scaffold(
              body: Center(
                child: Text(
                  error.toString(),
                ),
              ),
            ),
        data: (info) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '技術系の記事をたくさん開いているあなたは...',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Image.asset('assets/engineer.png', width: 180),
                  ),
                  ...info.groupTitles.keys
                      .map(
                        (groupId) => ListTile(
                          title: Text(info.groupTitles[groupId] ?? ''),
                          trailing:
                              Text('${info.tabs[groupId]?.length ?? 0} tabs'),
                        ),
                      )
                      .toList(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('タブ一覧へ戻る'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
