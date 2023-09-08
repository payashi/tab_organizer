import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_organizer/providers/tab_list_provider.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

void main() {
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
      // final status = (event as CustomEvent).detail['changeInfo']['status'];
      // if (status == 'complete') {
      //   ref.read(tabListProvider.notifier).fetch();
      // }
      ref.read(tabListProvider.notifier).fetch();
    });
    return Scaffold(
      body: const Column(
        children: [
          TabListView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Future.delayed(const Duration(seconds: 1));
          await ref.read(tabListProvider.notifier).fetch();
        },
        child: const Icon(Icons.auto_awesome),
      ),
    );
  }
}

class TabListView extends HookConsumerWidget {
  const TabListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(tabListProvider).when(
          loading: CircularProgressIndicator.new,
          error: (error, _) => Text(error.toString()),
          data: (tabs) {
            return Flexible(
              child: ListView.builder(
                itemCount: tabs.length,
                itemBuilder: (context, idx) => _tile(tabs[idx]),
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
      onTap: () {
        hightlightTab(HighlightOptions(
          tabs: tab.index,
          windowId: tab.windowId,
        ));
      },
    );
  }
}
