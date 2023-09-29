import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

typedef ToastBuilder = Widget Function(BuildContext context, String message);

class AboToast {
  AboToast._privateConstructor();

  static final AboToast _instance = AboToast._privateConstructor();
  static AboToast get instance => _instance;

  void showToast(BuildContext? context, dynamic message, {ToastBuilder? toastBuilder}) {
    if (context == null || !context.mounted) {
      return;
    }

    if (message == null) {
      if (kDebugMode) {
        message = '[DEBUG] Empty toast message';
      } else {
        return;
      }
    }

    FToast().init(context).showToast(
      child: toastBuilder != null
          ? toastBuilder(context, message.toString())
          : _HansToastWidget(message: message.toString()),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 5),
    );
  }
}

class _HansToastWidget extends StatelessWidget {
  const _HansToastWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Text(
        message.toString(),
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
    ;
  }
}

/// Simple builder method to create a [TransitionBuilder]
/// and for the use in MaterialApp builder method
// ignore: non_constant_identifier_names
TransitionBuilder AboToastBuilder() {
  return (context, child) {
    return _AboToastHolder(
      child: child!,
    );
  };
}

/// Simple StatelessWidget which holds the child
/// and creates an [Overlay] to display the toast
/// which returns the Directionality widget with [TextDirection.ltr]
/// and [Overlay] widget
class _AboToastHolder extends StatelessWidget {
  const _AboToastHolder({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Overlay overlay = Overlay(
      initialEntries: <OverlayEntry>[
        OverlayEntry(
          builder: (BuildContext ctx) {
            return child;
          },
        ),
      ],
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: overlay,
    );
  }
}
