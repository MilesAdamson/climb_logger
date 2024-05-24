import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/screens/new_version_screen.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class WhatsNewListTile extends StatefulWidget {
  const WhatsNewListTile({Key? key}) : super(key: key);

  @override
  State<WhatsNewListTile> createState() => MyWidgetState();
}

class MyWidgetState extends State<WhatsNewListTile> {
  final infoFuture = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: infoFuture,
      builder: (context, snapshot) {
        final info = snapshot.data;
        if (info == null || !versionContentMap.containsKey(info.version)) {
          return const SizedBox.shrink();
        }

        return ListTile(
          dense: true,
          leading: const Icon(Icons.info_outline),
          title: Text("What's new in ${info.version}"),
          onTap: () => Navigator.of(context).whatsNewInVersion(info.version),
        );
      },
    );
  }
}
