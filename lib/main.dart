import 'package:flutter/material.dart';
import 'package:tab_organizer/chrome_api.dart';
import 'package:tab_organizer/models/chrome_tab.dart';

void main() {
  // runApp(const HomeScreen());
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: FutureBuilder<List<ChromeTab>>(
                initialData: const [],
                future: queryTabs(QueryOptions()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, idx) => ListTile(
                        title: Text('$idx: ${snapshot.data![idx].title}'),
                      ),
                    );
                  } else {
                    return const Text('no data');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
