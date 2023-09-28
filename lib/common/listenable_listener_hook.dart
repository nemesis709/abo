import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useListenableListener<T extends Listenable?>(T listenable, void Function() block) {
  use(_ListenableHook(listenable, block));
}

class _ListenableHook extends Hook<void> {
  const _ListenableHook(this.listenable, this.block);

  final Listenable? listenable;
  final Function() block;

  @override
  _ListenableStateHook createState() => _ListenableStateHook();
}

class _ListenableStateHook extends HookState<void, _ListenableHook> {
  @override
  void initHook() {
    super.initHook();
    hook.listenable?.addListener(_listener);
  }

  @override
  void didUpdateHook(_ListenableHook oldHook) {
    super.didUpdateHook(oldHook);
    if (hook.listenable != oldHook.listenable) {
      oldHook.listenable?.removeListener(_listener);
      hook.listenable?.addListener(_listener);
    }
  }

  @override
  void build(BuildContext context) {}

  void _listener() {
    hook.block();
  }

  @override
  void dispose() {
    hook.listenable?.removeListener(_listener);
  }

  @override
  String get debugLabel => 'useListenable';

  @override
  Object? get debugValue => hook.listenable;
}

void useEffectAddPostFrameCallback(Function() effect, [List<Object?>? keys]) {
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      effect();
    });
    return null;
  }, keys ?? []);
}
