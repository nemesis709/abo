import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class CommonErrorView extends StatelessWidget {
  const CommonErrorView({super.key, required this.err, this.onTap, this.textStyle});

  final Object err;
  final VoidCallback? onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              err.toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style: textStyle ?? context.textStyleB14b,
            )),
        if (onTap != null) ...[
          TextButton(
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.resolveWith((states) => Colors.transparent),
            ),
            onPressed: onTap,
            child: Text(
              'refresh',
              style: context.textStyleB12b.copyWith(color: context.colorVermillion),
            ),
          ),
        ],
      ],
    );
  }
}
