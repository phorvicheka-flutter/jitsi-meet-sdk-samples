import 'package:flutter/material.dart';
import '../../widgets/dialog_confirmation.dart';
import '../constants/app_colors.dart';
import '../constants/dimens.dart';
import '../constants/font_size.dart';
import 'device_util.dart';

abstract class DialogsUtil {
  static Future<void> showLoadingDialog(
    BuildContext context, {
    GlobalKey? key,
    String strLoading = '',
  }) async {
    // Check if the dialog is already showing using the provided key
    if (key != null && key.currentContext != null) {
      return;
    }

    Dialog dialog = Dialog(
      key: key,
      // The background color
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // The loading indicator
              const CircularProgressIndicator(),
              if (strLoading.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(strLoading),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
    return showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return dialog;
      },
    );
  }

  static Future<void> showErrorDialog(
    BuildContext context, {
    GlobalKey? key,
    String strOkButton = '확인',
    String strTitle = '에러',
    String strContent = '서버 오류가 발생했습니다.',
  }) async {
    // Check if the dialog is already showing using the provided key
    if (key != null && key.currentContext != null) {
      return;
    }

    final isTablet = DeviceUtil.isTablet(context);

    /// Set up the button
    Widget okButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isTablet ? 6 : 4),
          side: BorderSide(
            width: isTablet ? 2 : 1.6,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        padding: const EdgeInsets.all(Dimens.spaceSm),
        minimumSize: const Size(double.infinity, 0),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        strOkButton,
        style: TextStyle(
          color: Colors.white,
          fontSize: isTablet ? FontSize.xl : FontSize.md,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    // Set up the AlertDialog
    AlertDialog alert = AlertDialog(
      key: key,
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isTablet ? 12.0 : 8),
      ),
      title: Text(
        strTitle,
        style: TextStyle(
          color: AppColors.danger,
          fontSize: isTablet ? FontSize.xl : FontSize.md,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        strContent,
        style: TextStyle(
          color: AppColors.grey[900],
          fontSize: isTablet ? FontSize.xl : FontSize.md,
        ),
      ),
      actions: [
        Center(child: okButton),
      ],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /* static Future<void> showConfirmDialog(
    BuildContext context, {
    GlobalKey? key,
    String strCancelButton = '취소',
    String strConfirmButton = '확인',
    String strTitle = '작업 확인',
    String strContent = '이 작업을 실행하시겠습니까?',
    void Function()? onPressedConfirmButton,
  }) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(strCancelButton),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget confirmButton = TextButton(
      child: Text(strConfirmButton),
      onPressed: () {
        // close the confirm dialog
        Navigator.of(context).pop();
        if (onPressedConfirmButton != null) {
          onPressedConfirmButton();
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      key: key,
      title: Text(strTitle),
      content: Text(strContent),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );

    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  } */

  static Future<void> showConfirmDialog(
    BuildContext context, {
    String? message,
    VoidCallback? onYesPressed,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DialogConfirmation(
          message: message ?? '이 작업을 실행하시겠습니까?',
          labelYes: '확인',
          labelCancel: '취소',
          onYesPressed: onYesPressed,
        );
      },
    );
  }
}
