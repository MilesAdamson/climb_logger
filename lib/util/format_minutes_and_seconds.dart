String formatMinutesAndSeconds(int minutes, int seconds) {
  if (minutes == 0) {
    return "$seconds second${seconds == 1 ? "" : "s"}";
  }

  if (seconds == 0) {
    return "$minutes minute${minutes == 1 ? "" : "s"}";
  }

  return "$minutes minute${minutes == 1 ? "" : "s"}, $seconds second${seconds == 1 ? "" : "s"}";
}
