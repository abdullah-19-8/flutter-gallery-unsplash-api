import 'package:flutter/material.dart';

class DownloadArchive extends StatefulWidget {
  const DownloadArchive({Key? key}) : super(key: key);

  @override
  State<DownloadArchive> createState() => _DownloadArchiveState();
}

class _DownloadArchiveState extends State<DownloadArchive> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No download archive'),
    );
  }
}
