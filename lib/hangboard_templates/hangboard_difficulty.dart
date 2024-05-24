enum HangboardDifficulty { beginner, moderate, advanced, expert }

extension HangboardDifficultyExtension on HangboardDifficulty {
  String get title {
    switch (this) {
      case HangboardDifficulty.beginner:
        return "Beginner";
      case HangboardDifficulty.moderate:
        return "Moderate";
      case HangboardDifficulty.advanced:
        return "Advanced";
      case HangboardDifficulty.expert:
        return "Expert";
    }
  }

  String get subtitle {
    switch (this) {
      case HangboardDifficulty.beginner:
        return "Beginner: You have not done much hangboarding yet. These routines are easier and lower risk, designed to "
            "build good habits and proper form.";
      case HangboardDifficulty.moderate:
        return "Moderate: You have done some hangboarding, and want to develop the skills to train properly on it. "
            " These routines can potentially cause injury if you don't know your limits.";
      case HangboardDifficulty.advanced:
        return "Advanced: You have done plenty of hangboarding, and already have good habits and form."
            " These routines can potentially cause injury if you don't know your limits.";
      case HangboardDifficulty.expert:
        return "Expert: You are an elite climber. These routines are difficult and high risk, designed to "
            "push even the strongest climbers. Do not attempt these routines without knowing your body well.";
    }
  }

  bool greaterThanOrEqualTo(HangboardDifficulty other) =>
      HangboardDifficulty.values.indexOf(this) >=
      HangboardDifficulty.values.indexOf(other);

  int get score {
    switch (this) {
      case HangboardDifficulty.beginner:
        return 200;
      case HangboardDifficulty.moderate:
        return 400;
      case HangboardDifficulty.advanced:
        return 600;
      case HangboardDifficulty.expert:
        return 800;
    }
  }
}
