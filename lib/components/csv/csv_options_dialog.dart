import 'dart:io';

import 'package:climb_logger/components/dialogs/confirm_dialog.dart';
import 'package:climb_logger/util/csv_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class CsvOptionsDialog extends StatelessWidget {
  final CsvHelper helper;
  final File file;

  const CsvOptionsDialog({
    Key? key,
    required this.file,
    required this.helper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("CSV Downloaded"),
      content: Text(
        "You can email yourself "
        "your csv, or open the file with an app on your device. "
        "Or both, this dialog does not close when you select an option.\n\n"
        "Your CSV was saved here:\n\n"
        "${file.path}",
      ),
      actions: [
        TextButton(
          child: const Text("COPY PATH"),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: file.path));
          },
        ),
        TextButton(
          onPressed: () async {
            try {
              if (Platform.isIOS && !await FlutterMailer.canSendMail()) {
                await showConfirmationDialog(
                  context,
                  title: "Mail App not Found",
                  message: "On iOS, this functionality is not"
                      " available unless you have Mail installed."
                      " Apps like gmail do not work (it's not my fault)",
                  showCancelButton: false,
                );
                return;
              }

              final mailOptions = MailOptions(
                subject: 'Climbing Logbook CSV',
                attachments: [file.path],
                isHTML: false,
              );

              await FlutterMailer.send(mailOptions);
            } on PlatformException catch (e) {
              showConfirmationDialog(
                context,
                title: "Error",
                message: e.message,
                showCancelButton: false,
              );
            }
          },
          child: const Text("EMAIL"),
        ),
        TextButton(
          onPressed: () => helper.openFile(file.path),
          child: const Text("OPEN"),
        ),
      ],
    );
  }
}
