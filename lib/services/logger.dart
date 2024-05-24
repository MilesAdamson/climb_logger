import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _kSentryDSN = '';

class Logger {
  static Future<void> init() {
    return SentryFlutter.init(
      (options) {
        options.dsn = _kSentryDSN;
        options.tracesSampleRate = 1.0;
      },
    );
  }

  static void captureInfo(e) {
    if (kDebugMode) {
      print("$e");
    }
  }

  static void captureException(e, s) async {
    if (kDebugMode) {
      print("$e\n$s");
    } else {
      try {
        await Sentry.captureException(e, stackTrace: s);
      } catch (e, s) {
        debugPrint("Logger failed to capture: $e\n$s");
      }
    }
  }
}
