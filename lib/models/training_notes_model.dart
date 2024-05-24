import 'package:climb_logger/util/date_time_extensions.dart';
import 'package:climb_logger/util/sentiment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'training_notes_model.freezed.dart';
part 'training_notes_model.g.dart';

@freezed
class TrainingNotesModel with _$TrainingNotesModel {
  TrainingNotesModel._();

  bool get hasAnySentimentsSelected =>
      [mood, sleep, stress, diet, energy].any((s) => s != null);

  String get documentId =>
      dateTime.truncate().millisecondsSinceEpoch.toString();

  int? scoreOfMoodType(MoodType moodType) {
    switch (moodType) {
      case MoodType.mood:
        return moodScore;
      case MoodType.sleep:
        return sleepScore;
      case MoodType.stress:
        return stressScore;
      case MoodType.diet:
        return dietScore;
      case MoodType.energy:
        return energyScore;
    }
  }

  Sentiment? sentimentOfMoodType(MoodType moodType) {
    switch (moodType) {
      case MoodType.mood:
        return mood;
      case MoodType.sleep:
        return sleep;
      case MoodType.stress:
        return stress;
      case MoodType.diet:
        return diet;
      case MoodType.energy:
        return energy;
    }
  }

  int? get moodScore =>
      mood != null ? Sentiment.values.indexOf(mood!) + 1 : null;

  int? get sleepScore =>
      sleep != null ? Sentiment.values.indexOf(sleep!) + 1 : null;

  int? get stressScore =>
      stress != null ? Sentiment.values.indexOf(stress!) + 1 : null;

  int? get dietScore =>
      diet != null ? Sentiment.values.indexOf(diet!) + 1 : null;

  int? get energyScore =>
      energy != null ? Sentiment.values.indexOf(energy!) + 1 : null;

  String? get freeformNotes {
    if (notes != null && notes!.trim().isNotEmpty) {
      return notes!.trim();
    }

    return null;
  }

  factory TrainingNotesModel.newNotesForDate(DateTime dateTime) {
    return TrainingNotesModel(
      dateTime.truncate(),
      null,
      null,
      null,
      null,
      null,
      null,
    );
  }

  factory TrainingNotesModel(
    DateTime dateTime,
    String? notes,
    Sentiment? mood,
    Sentiment? sleep,
    Sentiment? stress,
    Sentiment? diet,
    Sentiment? energy,
  ) = _TrainingNotesModel;

  factory TrainingNotesModel.fromJson(json) =>
      _$TrainingNotesModelFromJson(json);
}
