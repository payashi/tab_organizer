import 'package:flutter/material.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:tab_organizer/providers/category_info_provider.dart';
import 'package:tab_organizer/providers/tab_update_provider.dart';
import 'package:tab_organizer/screens/loading_screen.dart';
import 'package:tab_organizer/screens/personality_screen.dart';

class PopupScreen extends HookConsumerWidget {
  const PopupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to tab update event
    document.on['tabUpdated'].listen((Event event) {
      ref.read(categoryInfoProvider.notifier).fetchTabs();
      ref.read(tabUpdateProvider.notifier).update((state) => false);
    });

    return ref.watch(categoryInfoProvider).when(
          loading: () => const LoadingScreen(),
          error: (error, _) => Scaffold(
            body: Center(
              child: SelectableText(
                error.toString(),
              ),
            ),
          ),
          data: (info) {
            final infoTabs = info.tabs.entries.toList();
            final bool update = ref.watch(tabUpdateProvider);
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: infoTabs.map<Widget>((entry) {
                    final tabs = entry.value;
                    return ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(info.groupTitles[entry.key] ?? ''),
                      children: tabs.map((tab) => _tile(tab)).toList(),
                    );
                  }).toList(),
                ),
              ),
              floatingActionButton: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (update)
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
                      await ref.read(categoryInfoProvider.notifier).classify();
                      ref
                          .read(tabUpdateProvider.notifier)
                          .update((state) => true);
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
