import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/new_version_info/V110.dart';
import 'package:climb_logger/components/new_version_info/V111.dart';
import 'package:climb_logger/components/new_version_info/V112.dart';
import 'package:climb_logger/components/new_version_info/V113.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:flutter/material.dart';

class NewVersionScreen extends StatelessWidget {
  final String version;

  const NewVersionScreen({
    Key? key,
    required this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBannerAd(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: Navigator.of(context).pop,
        label: const Text("Got it"),
        icon: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: Text("What's New in $version"),
      ),
      body: SingleChildScrollView(
        padding: kListViewPadding,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: versionContentMap[version]!,
        ),
      ),
    );
  }
}

final versionContentMap = {
  "1.1.0": V110(),
  "1.1.1": V111(),
  "1.1.2": const V112(),
  "1.1.3": const V113(),
};
