import 'package:climb_logger/components/bottom_banner_ad.dart';
import 'package:climb_logger/components/confirm_back.dart';
import 'package:climb_logger/components/user_input/grade_select.dart';
import 'package:climb_logger/components/user_input/tags_multi_select.dart';
import 'package:climb_logger/components/user_input/wall_type_radio.dart';
import 'package:climb_logger/models/project_model.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/theme/ui_constants.dart';
import 'package:climb_logger/util/ascent_type.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/climb_type.dart';
import 'package:climb_logger/util/grading_system.dart';
import 'package:climb_logger/util/wall_type.dart';
import 'package:flutter/material.dart';

class ProjectCreationScreen extends StatefulWidget {
  final ProjectModel? initialData;

  const ProjectCreationScreen({
    Key? key,
    required this.initialData,
  }) : super(key: key);

  @override
  State<ProjectCreationScreen> createState() => ProjectCreationScreenState();
}

class ProjectCreationScreenState extends State<ProjectCreationScreen> {
  bool userHasChangedForm = false;
  bool get isEditing => widget.initialData != null;

  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late final String initialName;
  late ClimbType climbType;
  late GradingSystem boulderGrades;
  late GradingSystem sportGrades;
  late String gradeLabel;
  late WallType wallType;
  var tags = <String>[];

  @override
  void initState() {
    final settings = context.bloc.state.settings;
    climbType = settings.climbType;
    boulderGrades = settings.boulderingGradingSystem;
    sportGrades = settings.sportGradingSystem;
    wallType = settings.wallType;
    initialName = widget.initialData?.name ?? "";

    setGradeLabelToFirstItem();
    final initialData = widget.initialData;

    if (initialData != null) {
      climbType = initialData.climbType;
      wallType = initialData.wallType;
      gradeLabel = initialData.gradeLabel;
      tags = initialData.tags;
      nameController.text = initialData.name;
    }

    super.initState();
  }

  bool get shouldPromptForBack {
    return userHasChangedForm || initialName != nameController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ConfirmBack(
        shouldPrompt: shouldPromptForBack,
        dialogTitle: isEditing ? "Discard Changes?" : "Discard Project?",
        child: Scaffold(
          bottomNavigationBar: const BottomBannerAd(),
          floatingActionButton: buildFloatingActionButton(context),
          appBar: AppBar(
            title: Text(
                isEditing ? "Edit Project $initialName" : "Create Project"),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: Navigator.of(context).settings,
              ),
            ],
          ),
          body: ListView(
            padding: kListViewPadding,
            children: [
              buildIntroHeader(),
              buildClimbNameEntry(),
              const Divider(),
              buildGradeSelect(),
              const Divider(),
              buildWallTypeRadio(),
              const Divider(),
              buildTagsMultiSelect(),
            ],
          ),
        ),
      ),
    );
  }

  WallTypeRadio buildWallTypeRadio() {
    return WallTypeRadio(
      key: const Key("WallTypeRadio"),
      wallType: wallType,
      onChanged: (a) {
        setState(() {
          wallType = a;
          userHasChangedForm = true;
        });
      },
    );
  }

  TagsMultiSelect buildTagsMultiSelect() {
    return TagsMultiSelect(
      key: const Key("TagsMultiSelect"),
      selected: tags,
      ascentType: AscentType.project,
      onChanged: (t) {
        setState(() {
          tags = t;
          userHasChangedForm = true;
        });
      },
    );
  }

  GradeSelect buildGradeSelect() {
    return GradeSelect(
      key: const Key("GradeSelect"),
      selected: gradeLabel,
      onGradeChanged: (g) {
        setState(() {
          gradeLabel = g;
          userHasChangedForm = true;
        });
      },
      onClimbTypeChanged: (c) {
        setState(() {
          climbType = c;
          userHasChangedForm = true;
        });
      },
      climbType: climbType,
      ascentType: AscentType.project,
    );
  }

  Padding buildClimbNameEntry() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        autofocus: false,
        decoration: const InputDecoration(
          label: Text("Climb Name"),
        ),
        controller: nameController,
        validator: (s) {
          if (s == null || s.trim().isEmpty) {
            return "You must name your project";
          }

          return null;
        },
      ),
    );
  }

  ListTile buildIntroHeader() {
    return ListTile(
      title: const Text("Projects"),
      subtitle: Text(isEditing
          ? "When you edit a projects grade, wall type or tags, all logbook entries for it will be updated too."
          : "A project groups logbook entries for the same climb. "
              "When you log an attempt on your project, all of the"
              " settings like grade and wall type will be taken from what you select here."),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          Navigator.pop(
            context,
            ProjectModel(
              gradeLabel,
              nameController.text.trim(),
              climbType,
              wallType,
              widget.initialData?.createdAt ?? DateTime.now(),
              widget.initialData?.relatedLogbookEntryIds ?? [],
              tags,
              [],
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text("You must name your project"),
            ),
          );
        }
      },
      label: const Text("Save"),
      icon: Icon(isEditing ? Icons.edit : Icons.save),
    );
  }

  void setGradeLabelToFirstItem() {
    switch (climbType) {
      case ClimbType.boulder:
        gradeLabel = boulderGrades.labels.first;
        break;
      case ClimbType.sport:
        gradeLabel = sportGrades.labels.first;
        break;
    }
  }
}
