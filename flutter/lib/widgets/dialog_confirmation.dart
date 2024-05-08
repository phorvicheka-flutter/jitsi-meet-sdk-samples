import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../constants/font_family.dart';
import '../constants/font_size.dart';
import '../utils/device_util.dart';

class DialogConfirmation extends StatelessWidget {
  final String message;
  final String? labelYes;
  final String? labelCancel;
  final VoidCallback? onYesPressed;
  final VoidCallback? onCancelPressed;

  const DialogConfirmation({
    super.key,
    required this.message,
    this.labelYes,
    this.labelCancel,
    this.onYesPressed,
    this.onCancelPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = DeviceUtil.isTablet(context);

    return AlertDialog(
      backgroundColor: Colors.white, // Set background color to white
      elevation: 0, // Remove shadow
      shape: RoundedRectangleBorder(
        // Set rounded corners
        borderRadius: BorderRadius.circular(isTablet ? 12.0 : 8),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * (isTablet ? 0.5 : 0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: isTablet ? 50 : 30),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isTablet ? FontSize.xl : FontSize.md,
                  fontFamily: FontFamily.notoSansKR,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                if (labelCancel != null)
                  _buildButton(
                    context,
                    labelCancel!,
                    Colors.white,
                    Theme.of(context).colorScheme.primary,
                    onCancelPressed,
                  ),
                SizedBox(
                  width: isTablet ? Dimens.spaceSm : Dimens.spaceXs,
                ),
                if (labelYes != null)
                  _buildButton(
                    context,
                    labelYes!,
                    Theme.of(context).colorScheme.primary,
                    Colors.white,
                    onYesPressed,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    Color bgColor,
    Color textColor,
    VoidCallback? onPressed,
  ) {
    final isTablet = DeviceUtil.isTablet(context);

    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: bgColor,
          surfaceTintColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isTablet ? 6 : 4),
            side: BorderSide(
              width: isTablet ? 2 : 1.6,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isTablet ? FontSize.xlVariance1 : FontSize.smVariance1,
            fontFamily: FontFamily.notoSansKR,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
