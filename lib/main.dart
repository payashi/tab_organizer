import 'package:flutter/material.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_organizer/providers/tab_list_provider.dart';

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
    return const Scaffold(
      body: Column(
        children: [
          TabListView(),
        ],
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
      leading: Image.network(
        tab.favIconUrl,
        width: 64,
        height: 64,
        errorBuilder: (context, object, _) =>
            const Icon(Icons.error, color: Colors.red),
      ),
      title: Text('[]${tab.title}'),
      // TODO: Focus the tab on clicked with tabs API
      // onTap: () => _launchUrl(),
    );
  }
}
