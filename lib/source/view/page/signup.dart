import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
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
class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();

    final emailFocusNode = useFocusNode();
    final nameFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    useEffect(() {
      nameFocusNode.requestFocus();
      return;
    }, []);

    final asyncValue = ref.watch(loginControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=> context.popRoute(),
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
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: context.sizeWidth,
                        height: 40,
                        child: TextFormField(
                          controller: nameController,
                          focusNode: nameFocusNode,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: '이름을 입력해주세요',
                          ),
                          textInputAction: TextInputAction.next,
                          scrollPadding:
                              EdgeInsets.all(context.sizeWidth * 0.4),
                          onTapOutside: (_) => nameFocusNode.unfocus(),
                        ),
                      ),
                      Gap.h16,
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
                      Gap.h8,
                      FilledButton(
                          style: context.buttonStyle40P10Outlined,
                          onPressed: () async {
                            await ref
                                .read(loginControllerProvider.notifier)
                                .signUp(
                                  emailController.value.text,
                                  passwordController.value.text,
                                  nameController.value.text,
                                );
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
