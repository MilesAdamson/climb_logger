import 'package:climb_logger/util/project_view_model.dart';
import 'package:flutter/material.dart';

Future<ProjectViewModel?> selectProjectDialog(
  BuildContext context,
  List<ProjectViewModel> allProjects, {
  required bool showOnlyIncomplete,
}) async {
  assert(allProjects.isNotEmpty);

  final incomplete = allProjects.where((vm) => !vm.projectIsCompleted).toList();

  if (showOnlyIncomplete) {
    assert(incomplete.isNotEmpty);
  }

  if (incomplete.length == 1) {
    return incomplete.single;
  }

  return await showDialog<ProjectViewModel>(
    context: context,
    builder: (context) => SelectProjectDialog(
      selectableProjects: showOnlyIncomplete
          ? allProjects.where((vm) => !vm.projectIsCompleted).toList()
          : allProjects,
    ),
  );
}

class SelectProjectDialog extends StatefulWidget {
  final List<ProjectViewModel> selectableProjects;

  const SelectProjectDialog({
    Key? key,
    required this.selectableProjects,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SelectProjectDialogState();
}

class SelectProjectDialogState extends State<SelectProjectDialog> {
  late ProjectViewModel selected;

  @override
  void initState() {
    selected = widget.selectableProjects.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Project"),
      content: DropdownButton<ProjectViewModel>(
        value: selected,
        onChanged: (p) {
          if (p != null) {
            setState(() => selected = p);
          }
        },
        items: widget.selectableProjects
            .map(
              (vm) => DropdownMenuItem<ProjectViewModel>(
                child: Text(
                  vm.project.name,
                ),
                value: vm,
              ),
            )
            .toList(),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text("CANCEL"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(selected),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
