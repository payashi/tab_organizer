import 'package:flutter/material.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/category_info.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:tab_organizer/providers/category_info_notifier.dart';
import 'package:tab_organizer/screens/personality_screen.dart';

class PopupScreen extends HookConsumerWidget {
  const PopupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to tab update event
    document.on['tabUpdated'].listen((Event event) {
      ref.read(categoryInfoNotifier.notifier).fetchTabs();
    });

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
            final allTabs = info.tabs.entries
                .fold<List<ChromeTab>>([], (acc, el) => [...acc, ...el.value]);
            return Scaffold(
              body: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: allTabs.length,
                      itemBuilder: (context, idx) => _tile(allTabs[idx]),
                    ),
                  ),
                ],
              ),
              floatingActionButton: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    tooltip: '性格診断',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PersonalityScreen(),
                        ),
                      );
                    },
                    child: const Icon(Icons.face),
                  ),
                  const SizedBox(height: 16),
                  FloatingActionButton(
                    tooltip: '自動整理',
                    onPressed: () async {
                      await ref.read(categoryInfoNotifier.notifier).classify();
                    },
                    child: const Icon(Icons.auto_awesome),
                  ),
                ],
              ),
            );
          },
        );
  }

  Widget _tile(ChromeTab tab) {
    return ListTile(
      hoverColor: Colors.amber.shade50,
      tileColor: Colors.grey.shade50,
      leading: Image.network(
        tab.favIconUrl,
        width: 32,
        height: 32,
        errorBuilder: (context, object, _) => const Icon(
          Icons.public,
          size: 32,
        ),
      ),
      title: Text(
        tab.title,
        overflow: TextOverflow.ellipsis,
      ),
      // subtitle: Text('${tab.windowId}/${tab.groupId}/${tab.index}/${tab.id}'),
      subtitle: Text(
        tab.url,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () async {
        await hightlightTabs(TabsHighlightInfo(
          tabs: [tab.index],
          windowId: tab.windowId,
        ));
        await updateWindows(
          tab.windowId,
          WindowsUpdateInfo(drawAttention: true, focused: true),
        );
      },
    );
  }
}
