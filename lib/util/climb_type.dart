enum ClimbType { boulder, sport }

extension ClimbTypeExtensions on ClimbType {
  String get label {
    switch (this) {
      case ClimbType.boulder:
        return "Boulder";
      case ClimbType.sport:
        return "Sport Climb";
    }
  }

  String get pluralLabel => "${label}s";
}
