import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/listenable_listener_hook.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/view/controller/login_controller.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persistent = useState(false);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    final asyncValue = ref.watch(loginControllerProvider);

    useEffectAddPostFrameCallback(() {
      if (asyncValue.valueOrNull?.currentUser != null) {
        emailFocusNode.requestFocus();
      }
      return;
    }, [asyncValue]);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoadableContent(
            asyncValue: asyncValue,
            content: (asyncValue) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: context.sizeWidth * 0.5,
                        height: context.sizeWidth * 0.5,
                        color: context.colorP10,
                      ),
                      Gap.h24,
                      SizedBox(
                        width: context.sizeWidth,
                        height: 40,
                        child: TextFormField(
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            hintText: '이메일을 입력해주세요',
                          ),
                          textInputAction: TextInputAction.next,
                          scrollPadding:
                              EdgeInsets.all(context.sizeWidth * 0.4),
                          onTapOutside: (_) => emailFocusNode.unfocus(),
                        ),
                      ),
                      Gap.h16,
                      SizedBox(
                        width: context.sizeWidth,
                        height: 40,
                        child: TextFormField(
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            hintText: '비밀번호를 입력해주세요',
                          ),
                          scrollPadding:
                              EdgeInsets.all(context.sizeWidth * 0.4),
                          onTapOutside: (_) => passwordFocusNode.unfocus(),
                        ),
                      ),
                      Gap.h16,
                      InkWell(
                        onTap: () => persistent.value = !persistent.value,
                        child: Row(
                          children: [
                            Checkbox(
                                value: persistent.value,
                                onChanged: (_) =>
                                    persistent.value = !persistent.value),
                            Gap.w8,
                            Text('자동 로그인'),
                          ],
                        ),
                      ),
                      Gap.h16,
                      FilledButton(
                          style: context.buttonStyle40P10,
                          onPressed: () async {
                            final auth = await ref
                                .read(loginControllerProvider.notifier)
                                .signIn(
                                  emailController.value.text,
                                  passwordController.value.text,
                                  persistent.value,
                                );

                            if (auth == true && context.mounted) {
                              context.replaceRoute(const HomeRoute());
                            }
                          },
                          child: const Text('로그인')),
                      Gap.h8,
                      FilledButton(
                          style: context.buttonStyle40P10Outlined,
                          onPressed: () =>
                              context.pushRoute(const SignUpRoute()),
                          child: const Text('회원가입')),
                      Gap.h48,
                    ]),
              );
            }),
      ),
    );
  }
}
