import 'package:api_test/screens/download_archive.dart';
import 'package:api_test/screens/favourite_screen.dart';
import 'package:api_test/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/gallery.dart';

class DefaultTabBar extends ConsumerWidget {
  const DefaultTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => ref.read(firebaseAuthProvider).signOut(),
                icon: const Icon(Icons.logout))
          ],
          title: const Text('Gallery'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.image,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.download,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Gallery(),
            const DownloadArchive(),
            const FavouriteScreen(),
          ],
        ),
      ),
    );
    // const Gallery();
  }
}
