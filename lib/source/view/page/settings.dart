import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/view/controller/settings_controller.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '설정',
          style: context.textStyleH20b.copyWith(color: context.colorP10),
        ),
      ),
      body: LoadableContent(
          asyncValue: asyncValue,
          content: (asyncValue) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    asyncValue?.displayName ?? '',
                    style:
                        context.textStyleH20b.copyWith(color: context.colorN20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () async {},
                      child: Row(
                        children: [
                          Text('정보 변경',
                              style: context.textStyleT14r
                                  .copyWith(color: context.colorN20)),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () async {
                        await notifier.signOut();
                      },
                      child: Row(
                        children: [
                          Text('로그아웃',
                              style: context.textStyleT14r
                                  .copyWith(color: context.colorN20)),
                        ],
                      )),
                ),
              ],
            );
          }),
    );
  }
}
