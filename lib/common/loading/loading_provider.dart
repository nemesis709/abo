import 'package:abo/common/loading/loading.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_provider.g.dart';

@Riverpod(keepAlive: true)
class LoadingNotifier extends _$LoadingNotifier {
  @override
  Loading build() {
    return Loading.finish();
  }

  void loading([String? message]) {
    state = Loading.loading(message);
  }

  void hide() {
    state = Loading.finish();
  }
}
