import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../routing/app_router.dart';
import '../../shared/design_system/dialogs/app_dialog.dart';

@lazySingleton
class ConnectivityDialogService {
  final AppRouter _appRouter;
  bool _isShowingDialog = false;

  ConnectivityDialogService(this._appRouter);

  bool get isShowingDialog => _isShowingDialog;

  Future<void> showNoInternetDialog() async {
    if (_isShowingDialog) {
      return;
    }

    final context = _appRouter.rootNavigatorKey.currentContext;
    if (context == null || !context.mounted) {
      return;
    }

    _isShowingDialog = true;

    try {
      await AppAlertDialog.show<bool>(
        context: context,
        title: 'Sin conexión a internet',
        message: 'En este momento no dispones de conexión a internet. Por favor, comprueba tu conexión y vuelve a intentar en unos minutos.',
        type: AppDialogType.warning,
        customIcon: Icons.wifi_off_rounded,
        primaryButtonText: 'Entendido',
        barrierDismissible: true,
      );
    } finally {
      _isShowingDialog = false;
    }
  }
}
