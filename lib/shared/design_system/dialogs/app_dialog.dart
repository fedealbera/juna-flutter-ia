import 'package:flutter/material.dart';
import '../../../core/theme/tenant_manager.dart';
import '../../../core/di/injection.dart';
import '../buttons/app_button.dart';

enum AppDialogType { success, error, warning, info, confirm, danger }

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final Widget? content;
  final AppDialogType type;
  final String primaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryPressed;
  final IconData? customIcon;
  final Color? primaryButtonColor;
  final Color? customAccentColor;

  const AppAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.content,
    this.type = AppDialogType.info,
    required this.primaryButtonText,
    this.onPrimaryPressed,
    this.secondaryButtonText,
    this.onSecondaryPressed,
    this.customIcon,
    this.primaryButtonColor,
    this.customAccentColor,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    Widget? content,
    AppDialogType type = AppDialogType.info,
    required String primaryButtonText,
    VoidCallback? onPrimaryPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,
    IconData? customIcon,
    Color? primaryButtonColor,
    Color? customAccentColor,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppAlertDialog(
        title: title,
        message: message,
        content: content,
        type: type,
        primaryButtonText: primaryButtonText,
        onPrimaryPressed: onPrimaryPressed,
        secondaryButtonText: secondaryButtonText,
        onSecondaryPressed: onSecondaryPressed,
        customIcon: customIcon,
        primaryButtonColor: primaryButtonColor,
        customAccentColor: customAccentColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tenantManager = getIt<TenantManager>();
    final activeTenant = tenantManager.value;

    final Color resolvedAccentColor;
    final IconData iconData;

    switch (type) {
      case AppDialogType.success:
        resolvedAccentColor = Colors.green;
        iconData = customIcon ?? Icons.check_circle_outline_rounded;
        break;
      case AppDialogType.error:
        resolvedAccentColor = Colors.redAccent;
        iconData = customIcon ?? Icons.error_outline_rounded;
        break;
      case AppDialogType.warning:
        resolvedAccentColor = Colors.orange;
        iconData = customIcon ?? Icons.warning_amber_rounded;
        break;
      case AppDialogType.info:
        resolvedAccentColor = activeTenant.accentColorRef;
        iconData = customIcon ?? Icons.info_outline_rounded;
        break;
      case AppDialogType.confirm:
        resolvedAccentColor = activeTenant.accentColorRef;
        iconData = customIcon ?? Icons.help_outline_rounded;
        break;
      case AppDialogType.danger:
        resolvedAccentColor = Colors.redAccent;
        iconData = customIcon ?? Icons.warning_amber_rounded;
        break;
    }

    final Color accentColor = customAccentColor ?? resolvedAccentColor;

    const dialogBg = Color(0xFF161616);

    return AlertDialog(
      backgroundColor: dialogBg,
      elevation: 16,
      shadowColor: accentColor.withValues(alpha: 0.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: accentColor.withValues(alpha: 0.25),
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.08),
                shape: BoxShape.circle,
                border: Border.all(
                  color: accentColor.withValues(alpha: 0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withValues(alpha: 0.1),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                iconData,
                color: accentColor,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            if (content != null)
              content!
            else
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 24),
            if (secondaryButtonText != null)
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: secondaryButtonText!,
                      type: AppButtonType.outlined,
                      borderColor: Colors.white24,
                      textColor: Colors.grey.shade400,
                      onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(false),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppButton(
                      text: primaryButtonText,
                      color: primaryButtonColor ?? accentColor,
                      textColor: Colors.white,
                      onPressed: onPrimaryPressed ?? () => Navigator.of(context).pop(true),
                    ),
                  ),
                ],
              )
            else
              AppButton(
                text: primaryButtonText,
                color: primaryButtonColor ?? activeTenant.primaryColorRef,
                textColor: Colors.white,
                onPressed: onPrimaryPressed ?? () => Navigator.of(context).pop(true),
              ),
          ],
        ),
      ),
    );
  }
}
