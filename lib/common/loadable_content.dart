import 'package:abo/common/common_error_view.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadableContent<T> extends StatelessWidget {
  const LoadableContent({
    super.key,
    required this.asyncValue,
    required this.content,
    this.loading,
    this.onRefresh,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(T) content;
  final Widget? loading;
  final VoidCallback? onRefresh;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;

  @override
  Widget build(BuildContext context) {
    final loadingView = loading ??
        const Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
    return asyncValue.when(
      skipLoadingOnReload: skipLoadingOnReload,
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      loading: () {
        return loadingView;
      },
      error: (err, stack) {
        logger.d(err.toString(), error: err);
        return CommonErrorView(
            err: err,
            onTap: () {
              if (onRefresh != null) {
                onRefresh!();
              }
            });
      },
      data: content,
    );
  }
}
