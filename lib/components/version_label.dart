import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionLabel extends StatefulWidget {
  final bool showAppName;

  const VersionLabel({
    Key? key,
    this.showAppName = true,
  }) : super(key: key);

  @override
  State<VersionLabel> createState() => VersionLabelState();
}

class VersionLabelState extends State<VersionLabel> {
  final packageInfoFuture = PackageInfo.fromPlatform();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: FutureBuilder<PackageInfo>(
        future: packageInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final info = snapshot.data!;
            String appName = info.appName;
            String version = info.version;
            String buildNumber = info.buildNumber;
            if (widget.showAppName) {
              return Text("$appName v$version+$buildNumber");
            } else {
              return Text("v$version+$buildNumber");
            }
          }

          return const Text(" ");
        },
      ),
    );
  }
}
