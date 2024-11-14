import 'dart:math';

import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:flutter/material.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.fromLTRB(16, 32, 16, 48),
      this.title,
      this.minHeight,
      this.maxHeight,
      this.showHandle = true,
      this.footer,
      this.footerHeight = 48,
      this.scrollController,
      this.scrollPhysics})
      : assert(minHeight == null || maxHeight != null);

  final Widget child;
  final EdgeInsets padding;
  final String? title;
  final double? minHeight;
  final double? maxHeight;
  final bool showHandle;
  final Widget? footer;
  final double footerHeight;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    double bodyMaxHeight = (maxHeight ?? context.sizeHeight / 2) - padding.top - padding.bottom;
    if (showHandle) {
      bodyMaxHeight = bodyMaxHeight - 16 - 4;
    }

    final titleTextStyle = context.textStyleT14r;
    if (title != null) {
      bodyMaxHeight = bodyMaxHeight - titleTextStyle.height! - 24;
    }

    if (footer != null) {
      bodyMaxHeight = bodyMaxHeight - footerHeight - 32;
    }

    final BoxConstraints bodyConstraints = BoxConstraints(
        maxHeight: min(bodyMaxHeight, context.sizeHeight - context.viewInsetBottom), minHeight: minHeight ?? 0);
    return Padding(
      padding: EdgeInsets.only(bottom: context.viewInsetBottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding:
                EdgeInsets.fromLTRB(padding.left, 0, padding.right, context.viewInsetBottom > 100 ? 0 : padding.bottom),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              color: context.colorN100,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showHandle) ...[
                  Gap.h16,
                  const Align(
                    alignment: Alignment.center,
                    child: BottomSheetHandel(),
                  ),
                ],
                Padding(padding: EdgeInsets.fromLTRB(0, padding.top, 0, 0)),
                if (title != null) ...[
                  Align(alignment: Alignment.centerLeft, child: Text(title!, style: titleTextStyle)),
                  Gap.h24,
                ],
                Container(
                  constraints: bodyConstraints,
                  child: ScrollConfiguration(
                    behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: scrollPhysics,
                      child: DefaultTextStyle(
                        style: context.textStyleT14r,
                        child: child,
                      ),
                    ),
                  ),
                ),
                if (footer != null) ...[
                  Gap.h32,
                  footer!,
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetHandel extends StatelessWidget {
  const BottomSheetHandel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: context.colorN95,
      ),
    );
  }
}
