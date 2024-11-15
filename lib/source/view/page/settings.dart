import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/formatter_extensions.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/settings_controller.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    super.initState();
    _fetchAppVersion();
  }

  Future<void> _fetchAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version; // 버전 정보
      buildNumber = packageInfo.buildNumber; // 빌드 번호
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(settingsControllerProvider);
    final notifier = ref.read(settingsControllerProvider.notifier);

    return Scaffold(
      body: LoadableContent(
          asyncValue: asyncValue,
          content: (user) {
            if (user == null) {
              context.replaceRoute(const SignInRoute());
            }

            final stat = user?.stat;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.paddingTop + 16,
                  ),
                  Row(
                    children: [
                      Icon(Icons.account_circle, size: 24, color: context.colorN60),
                      Gap.w8,
                      Text(
                        user?.name ?? '',
                        style: context.textStyleH20b.copyWith(color: context.colorN20),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: InkWell(
                      onTap: () => context.pushRoute(RankRoute()),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: context.colorP99,
                        ),
                        width: context.sizeWidth,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(user?.stat?.point ?? 0).formatCurrency()}P',
                              style: context.textStyleH16b.copyWith(color: context.colorN20),
                            ),
                            Gap.h12,
                            if (stat != null) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'G ${stat.game}',
                                    style: context.textStyleH16m,
                                  ),
                                  Text(
                                    'W ${stat.win}',
                                    style: context.textStyleH16m,
                                  ),
                                  Text(
                                    'D ${stat.draw}',
                                    style: context.textStyleH16m,
                                  ),
                                  Text(
                                    'L ${stat.lose}',
                                    style: context.textStyleH16m,
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                  _SettingTitle(text: '팀관리'),
                  _SettingItem(
                    text: '로스터 관리',
                    iconData: Icons.list,
                    onTap: () => context.navigateTo(PlayerRoasterRoute()),
                  ),
                  _SettingItem(
                    text: '트레이드 요청',
                    iconData: Icons.published_with_changes,
                    onTap: () async {
                      Uri uri = Uri(
                        scheme: 'sms', // sms:: 기능 내포
                        path: '01088498539',
                        queryParameters: <String, String>{
                          'body': '[ABO][트레이드]' // 송신하려는 문자 메세지 내용
                        },
                      );

                      if (await canLaunchUrl(uri)) {
                        // uri 호출이 가능한지
                        await launchUrl(uri); // 가능하다면 uri 호출
                      }
                    },
                  ),
                  _SettingTitle(text: '기타'),
                  _SettingItem(
                    text: '개발자에게 건의하기',
                    iconData: Icons.mail_outline,
                    onTap: () async {
                      Uri uri = Uri(
                        scheme: 'sms', // sms:: 기능 내포
                        path: '01088498539',
                        queryParameters: <String, String>{
                          'body': '[ABO][건의사항]' // 송신하려는 문자 메세지 내용
                        },
                      );

                      if (await canLaunchUrl(uri)) {
                        // uri 호출이 가능한지
                        await launchUrl(uri); // 가능하다면 uri 호출
                      }
                    },
                  ),
                  _SettingItem(
                    text: '로그아웃',
                    iconData: Icons.logout,
                    onTap: () async {
                      await notifier.signOut();
                    },
                  ),
                  _SettingItem(
                    text: '버전 정보 $version',
                    iconData: Icons.info_outline,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _SettingTitle extends StatelessWidget {
  const _SettingTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: context.textStyleB18b.copyWith(color: context.colorP10),
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.text,
    required this.iconData,
    this.onTap,
  });

  final String text;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Icon(iconData, size: 20),
              Gap.w8,
              Text(text, style: context.textStyleT16m.copyWith(color: context.colorN20)),
            ],
          ),
        ),
        Gap.h12,
      ],
    );
  }
}
