// ignore_for_file: file_names

import 'package:flutter/material.dart';

class V113 extends StatefulWidget {
  const V113({Key? key}) : super(key: key);

  @override
  State<V113> createState() => _V113State();
}

class _V113State extends State<V113> {
  DateTime selectedDate = DateTime(2022, 4, 19);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "User Experience",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Previously, creating goals, projects and hangboard routines would"
            " not take you to them automatically. This "
            "could make it confusing as to where they are and if they were"
            " created successfully. Now, creating goals, projects and "
            "hangboard routines will open them once they are created.",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Project Beta",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Added a new feature to projects: beta! You can now log"
            " the beta for your project. Write down each step with"
            " as much or little detail as you need.",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Project Bug Fix",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            "Fixed a bug where editing a project or deleting its logbook"
            " entries could cause it to disappear from your project list.",
          ),
        ),
      ],
    );
  }
}
