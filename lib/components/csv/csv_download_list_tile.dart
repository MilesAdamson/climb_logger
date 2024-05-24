import 'package:climb_logger/components/csv/csv_options_dialog.dart';
import 'package:climb_logger/components/dialogs/ad_dialog.dart';
import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/components/state_builder.dart';
import 'package:climb_logger/routing/navigator_extensions.dart';
import 'package:climb_logger/services/logger.dart';
import 'package:climb_logger/state/app_state.dart';
import 'package:climb_logger/state/events.dart';
import 'package:climb_logger/util/build_context_extensions.dart';
import 'package:climb_logger/util/csv_helper.dart';
import 'package:climb_logger/util/map_extensions.dart';
import 'package:flutter/material.dart';

enum _CsvOptions { import, download }

class CsvListTile extends StatelessWidget {
  const CsvListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder(builder: (context, state) {
      return ListTile(
        dense: true,
        leading: const Icon(Icons.download),
        title: const Text("CSV import/download"),
        onTap: () async {
          final option = await showDialog<_CsvOptions>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("CSV Options"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("CANCEL"),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(_CsvOptions.import),
                  child: const Text("IMPORT"),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(_CsvOptions.download),
                  child: const Text("DOWNLOAD"),
                ),
              ],
            ),
          );

          if (option == _CsvOptions.download) {
            downloadCSV(context, state);
          } else if (option == _CsvOptions.import) {
            importCSV(
              context,
            );
          }
        },
      );
    });
  }

  Future<void> importCSV(BuildContext context) async {
    final canContinue = await showInterstitialAd(
      context,
      "Importing from csv requires watching an ad.",
    );
    if (canContinue) {
      Navigator.of(context).csvImport();
    }
  }

  Future<void> downloadCSV(BuildContext context, AppState state) async {
    if (state.shouldShowAds) {
      final canContinue = await showInterstitialAd(
          context, "Exporting your logbook to csv requires watching an ad");

      if (!canContinue) return;
    }

    if (!state.hasLoadedAllLogbooks) {
      context.bloc.add(LoadAllLogbooksEvent());
      // HACK HACK
      await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    }

    try {
      final csvHelper = CsvHelper(
        context.bloc.state.logbookEntryMap.mapToData(),
        context.bloc.state.settings.tags,
      );

      final file = await csvHelper.download();
      await showDialog(
        context: context,
        builder: (context) {
          return CsvOptionsDialog(
            helper: csvHelper,
            file: file,
          );
        },
      );
    } on CsvException catch (e) {
      await showConfirmationDialog(
        context,
        showCancelButton: false,
        title: "Error",
        message: e.message,
      );
    } catch (e, s) {
      Logger.captureException(e, s);

      await showConfirmationDialog(
        context,
        showCancelButton: false,
        title: "Error",
        message: "Something went wrong. A crash report has been logged",
      );
    }
  }
}
