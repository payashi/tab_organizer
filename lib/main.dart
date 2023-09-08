import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_organizer/models/chrome_tab_group.dart';
import 'package:tab_organizer/providers/tab_list_provider.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

void main() async {
  await dotenv.load();
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: PopupScreen(),
      ),
    ),
  );
}

class PopupScreen extends HookConsumerWidget {
  const PopupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to tab update event
    document.on['tabUpdated'].listen((Event event) {
      ref.read(tabListProvider.notifier).fetchTabs();
    });
    return ref.watch(tabListProvider).when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Text(error.toString()),
          data: (tabs) {
            return Scaffold(
              body: Column(
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: tabs.length,
                      itemBuilder: (context, idx) => _tile(tabs[idx]),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  // await ref.read(tabListProvider.notifier).fetch();
                  final groupId = await groupTabs(
                      TabsGroupOptions(tabIds: [tabs[0].id, tabs[2].id]));
                  debugPrint(groupId.toString());
                  await updateTabGroups(
                    groupId,
                    TabGroupsUpdateProperties(
                      title: 'G1',
                      color: TabGroupColor.green.name,
                    ),
                  );
                },
                child: const Icon(Icons.auto_awesome),
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
      subtitle: Text('${tab.windowId}/${tab.groupId}/${tab.index}/${tab.id}'),
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
