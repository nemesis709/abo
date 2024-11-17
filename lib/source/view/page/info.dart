import 'package:abo/common/common_constants.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도움말', style: context.textStyleB18b.copyWith(color: context.colorP10)),
        leading: InkWell(
          onTap: () => context.maybePop(),
          child: Icon(Icons.arrow_back_ios, size: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Title('ABO가 뭔가요?'),
              _Content('ABO는 Adonis + KBO의 합성어로, 프로야구 선수로 진행하는 시뮬레이션 게임입니다.'),
              _Title('어떻게 할 수 있나요?'),
              _Content('드래프트데이를 진행합니다.'),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(
    this.title,
  );

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap.h16,
        Text(
          'Q. $title',
          style: context.textStyleT16b.copyWith(color: context.colorP10),
        ),
        Gap.h8,
      ],
    );
  }
}

class _Content extends StatelessWidget {
  const _Content(this.content);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: context.textStyleT14r.copyWith(color: context.colorN10),
    );
  }
}
