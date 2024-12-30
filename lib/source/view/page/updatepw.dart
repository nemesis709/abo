import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/common/logger/logger.dart';
import 'package:abo/source/controller/login_controller.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:html' as html;

@RoutePage()
class UpdatePWPage extends ConsumerStatefulWidget {
  const UpdatePWPage({super.key});

  @override
  ConsumerState<UpdatePWPage> createState() => _UpdatePWPageState();
}

class _UpdatePWPageState extends ConsumerState<UpdatePWPage> {
  late final TextEditingController passwordController;
  late final TextEditingController passwordValidateController;

  late final FocusNode passwordFocusNode;
  late final FocusNode passwordValidateFocusNode;

  @override
  void initState() {
    passwordController = TextEditingController();
    passwordValidateController = TextEditingController();

    passwordFocusNode = FocusNode();
    passwordValidateFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordValidateController.dispose();

    passwordFocusNode.dispose();
    passwordValidateFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(loginControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.router.back(),
          child: Icon(
            Icons.close,
            color: context.colorP10,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoadableContent(
            asyncValue: asyncValue,
            content: (asyncValue) {
              if (asyncValue != null) {
                context.replaceRoute(const HomeRoute());
              }

              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: '비밀번호를 입력해주세요',
                          hintStyle: context.bodyMedium?.copyWith(color: context.colorN80),
                        ),
                        scrollPadding: EdgeInsets.all(context.sizeWidth * 0.4),
                        onTapOutside: (_) => passwordFocusNode.unfocus(),
                      ),
                      Gap.h16,
                      TextFormField(
                        controller: passwordValidateController,
                        focusNode: passwordValidateFocusNode,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: '비밀번호를 입력해주세요',
                          hintStyle: context.bodyMedium?.copyWith(color: context.colorN80),
                        ),
                        scrollPadding: EdgeInsets.all(context.sizeWidth * 0.4),
                        onTapOutside: (_) => passwordValidateFocusNode.unfocus(),
                      ),
                      Gap.h48,
                      FilledButton(
                          style: context.buttonStyle48P10Outlined,
                          onPressed: passwordController.text != passwordValidateController.text
                              ? null
                              : () async {
                                  final update = await ref.read(loginControllerProvider.notifier).updatePW(
                                        extractTokenFromUrl(),
                                        passwordController.text,
                                      );

                                  if (update && context.mounted) {
                                    context.replaceRoute(const SignInRoute());
                                  }
                                },
                          child: const Text('비밀번호 변경')),
                      Gap.h48,
                    ]),
              );
            }),
      ),
    );
  }
}

String extractTokenFromUrl() {
  String currentUrl = html.window.location.href;
  Uri uri = Uri.parse(currentUrl);
  String fragment = uri.fragment.split('%23')[1];

  Map<String, String> queryParams = {};
  fragment.split('&').forEach((param) {
    var pair = param.split('=');
    if (pair.length == 2) {
      queryParams[pair[0]] = pair[1];
    }
  });

  String accessToken = queryParams['access_token'] ?? '';
  return accessToken;
}
