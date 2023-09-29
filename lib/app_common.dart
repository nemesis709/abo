import 'package:abo/common/data/result.dart';
import 'package:abo/common/loading/loading_provider.dart';
import 'package:abo/common/toast/toast.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

extension RefEx on Ref {
  AppRouter get route => read(appRouterProvider);

  void showToast(dynamic message) {
    AboToast.instance.showToast(route.navigatorKey.currentContext, message,
        toastBuilder: (BuildContext context, String message) {
      return _PaToastWidget(message: message);
    });
  }

  Future runInTryCatch<T>({
    required Future<T> Function() future,
    bool showErrorToast = true,
    bool showErrorDialog = false,
    Function? onPostError,
  }) async {
    try {
      return await future();
    } catch (error, stack) {
      if (showErrorToast) {
        showToast(error);
      }
      // else if (showErrorDialog) {
      //   await showConfirmDialog(error.toString());
      // }
      onPostError?.call();
    }
  }

  Future<Result<T>> runInProgress<T>(
    Future<Result<T>> Function() future, {
    String? message,
    bool showErrorToast = false,
    bool showErrorDialog = false,
  }) async {
    Result<T> result;
    if (exists(loadingNotifierProvider) != true) {
      result = await future();
    } else {
      try {
        read(loadingNotifierProvider.notifier).loading(message);
        result = await future();
      } finally {
        read(loadingNotifierProvider.notifier).hide();
      }
    }
    if (result.hasError && (showErrorToast || showErrorDialog)) {
      if (showErrorToast) {
        showToast(result.error);
      }
      // else if (showErrorDialog) {
      //   showConfirmDialog(result.error!.toString());
      // }
    }
    return result;
  }
//
// Future<void> showConfirmDialog(String message, {String? title, Widget? icon, String? buttonText}) {
//   return Dialogs.confirmDialog(message, title: title, icon: icon, buttonText: buttonText)
//       .show(route.navigatorKey.currentContext);
// }
//
// Future<bool?> showDeleteCancelDialog(String message, {String? title, Widget? icon}) {
//   return Dialogs.customDialog(
//     message,
//     noText: AppString.cancel,
//     yesText: AppString.delete,
//     title: title,
//     icon: icon,
//   ).show(route.navigatorKey.currentContext);
// }
//
// Future<bool?> showDialog(String message,
//     {required String noText, required String yesText, String? title, Widget? icon}) {
//   return Dialogs.customDialog(
//     message,
//     noText: noText,
//     yesText: yesText,
//     title: title,
//     icon: icon,
//   ).show(route.navigatorKey.currentContext);
// }
//
// Future<void> showConfirmBottomSheet(dynamic message) {
//   if (route.navigatorKey.currentContext == null || route.navigatorKey.currentContext!.mounted != true) {
//     return Future.value(null);
//   }
//   return route.navigatorKey.currentContext!.showConfirmBottomSheet(message);
// }
//
// Future<bool?> showDeleteCancelBottomSheet(String message, {String? title, Widget? body}) {
//   if (route.navigatorKey.currentContext == null || route.navigatorKey.currentContext!.mounted != true) {
//     return Future.value(null);
//   }
//   return route.navigatorKey.currentContext!.showDeleteCancelBottomSheet(message, title: title, body: body);
// }
//
// Future<bool?> showBottomSheet({
//   required BottomSheetButtonType buttonType,
//   required String yesText,
//   required String noText,
//   String? message,
//   String? title,
//   Widget? body,
//   double? maxHeight,
// }) {
//   if (route.navigatorKey.currentContext == null || route.navigatorKey.currentContext!.mounted != true) {
//     return Future.value(null);
//   }
//   return route.navigatorKey.currentContext!.showBottomSheet(
//     buttonType: buttonType,
//     yesText: yesText,
//     noText: noText,
//     message: message,
//     title: title,
//     body: body,
//     maxHeight: maxHeight,
//   );
// }
}

class _PaToastWidget extends StatelessWidget {
  const _PaToastWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: context.colorN20.withOpacity(0.9),
      ),
      child: Text(
        message.toString(),
        style: context.textStyleT14r.copyWith(color: context.colorN100),
      ),
    );
    ;
  }
}
