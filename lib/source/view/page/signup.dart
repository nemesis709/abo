import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/controller/login_controller.dart';
import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late final TextEditingController emailController;
  late final TextEditingController nameController;
  late final TextEditingController passwordController;

  late final FocusNode emailFocusNode;
  late final FocusNode nameFocusNode;
  late final FocusNode passwordFocusNode;

  @override
  void initState() {
    emailController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();

    emailFocusNode = FocusNode();
    nameFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    nameFocusNode.dispose();
    passwordFocusNode.dispose();

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
                        autofocus: true,
                        controller: nameController,
                        focusNode: nameFocusNode,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: '이름을 입력해주세요',
                          hintStyle: context.bodyMedium?.copyWith(color: context.colorN80),
                        ),
                        textInputAction: TextInputAction.next,
                        scrollPadding: EdgeInsets.all(context.sizeWidth * 0.4),
                        onTapOutside: (_) => nameFocusNode.unfocus(),
                      ),
                      Gap.h16,
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
                      Gap.h48,
                      FilledButton(
                          style: context.buttonStyle48P10Outlined,
                          onPressed: () async {
                            final auth = await ref.read(loginControllerProvider.notifier).signUp(
                                  emailController.value.text,
                                  passwordController.value.text,
                                  nameController.value.text,
                                );

                            if (auth == true && context.mounted) {
                              context.maybePop();
                              context.replaceRoute(const HomeRoute());
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
