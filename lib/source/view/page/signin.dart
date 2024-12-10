import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/gen/assets.gen.dart';
import 'package:abo/source/controller/login_controller.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  bool persistent = false;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    final asyncValue = ref.watch(loginControllerProvider);
    if (asyncValue.valueOrNull != null) {
      emailFocusNode.requestFocus();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValue = ref.watch(loginControllerProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoadableContent(
            asyncValue: asyncValue,
            content: (asyncValue) {
              if (asyncValue != null) {
                context.replaceRoute(const HomeRoute());
              }

              return SizedBox(
                height: context.sizeHeight,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: context.sizeWidth * 0.5,
                        height: context.sizeWidth * 0.5,
                        child: Assets.images.logo.svg(),
                      ),
                      Gap.h24,
                      TextFormField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '이메일을 입력해주세요',
                          hintStyle: context.bodyMedium?.copyWith(color: context.colorN80),
                        ),
                        textInputAction: TextInputAction.next,
                        scrollPadding: EdgeInsets.all(context.sizeWidth * 0.4),
                        onTapOutside: (_) => emailFocusNode.unfocus(),
                      ),
                      Gap.h16,
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
                      InkWell(
                        onTap: () => setState(() {
                          persistent = !persistent;
                        }),
                        child: Row(
                          children: [
                            Checkbox(
                              value: persistent,
                              onChanged: (_) => setState(() {
                                persistent = !persistent;
                              }),
                            ),
                            Gap.w8,
                            Text('자동 로그인'),
                          ],
                        ),
                      ),
                      Spacer(),
                      FilledButton(
                          style: context.buttonStyle48P10,
                          onPressed: () async {
                            final auth = await ref.read(loginControllerProvider.notifier).signIn(
                                  emailController.value.text,
                                  passwordController.value.text,
                                  persistent,
                                );

                            if (auth == true && context.mounted) {
                              context.replaceRoute(const HomeRoute());
                            }
                          },
                          child: const Text('로그인')),
                      Gap.h8,
                      FilledButton(
                          style: context.buttonStyle48P10Outlined,
                          onPressed: () async {
                            final bool? result = await context.pushRoute<bool?>(const SignUpRoute());

                            if (result == true && context.mounted) {
                              context.replaceRoute(HomeRoute());
                            }
                          },
                          child: const Text('회원가입')),
                      Gap.h48,
                    ]),
              );
            }),
      ),
    );
  }
}
