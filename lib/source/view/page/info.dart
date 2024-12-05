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
              _Title('ABO란?'),
              _Content(
                  'ABO는 Adonis + KBO의 합성어로, ABO는 사용자가 직접 선택한 프로야구 선수들로 구성된 가상의 팀이 실제 경기 일정에 따라 경쟁하는 스포츠 게임 서비스입니다. 실제 KBO 리그의 일정과 데이터를 기반으로 진행되어 현실감 넘치는 재미를 제공합니다.'),
              _Title('어떻게 할 수 있나요?'),
              _SubTitle('팀 구성'),
              _Content('유저는 자신만의 팀을 구성하기 위해 KBO 선수 풀에서 선수를 선택할 수 있습니다.\n각 팀은 다양한 포지션의 선수들로 균형 있게 구성해야 합니다.'),
              _SubTitle('점수 시스템'),
              _Content('각 선수의 RE24 팩터를 기반으로 점수를 계산합니다.\nRE24는 각 선수의 경기 내 기여도를 수치화한 값으로, 실제 야구 통계 데이터를 활용합니다.'),
              _SubTitle('경기 진행'),
              _Content('경기 일정은 KBO 리그의 실제 일정을 따릅니다.\n각 경기에서 양 팀 선수들의 점수를 합산하여 승패를 결정합니다.'),
              _SubTitle('실시간 데이터 반영'),
              _Content('KBO 경기 결과가 반영되어 선수의 RE24가 업데이트됩니다.\n유저는 트레이드를 통해 선수를 교체할 수 있습니다.'),
              _Title('FAQ'),
              _SubTitle('RE24가 무엇인가요?'),
              _Content(
                  'RE24는 "Run Expectancy 24 Base/Out States"의 약자로, 주자 상황과 아웃 카운트에 따라 선수가 팀 득점에 얼마나 기여했는지를 나타내는 통계 지표입니다.'),
              _SubTitle('점수는 어떻게 계산되나요?'),
              _Content('각 선수의 RE24 값에 100을 곱한 값이 점수로 반영됩니다. 모든 선수를 합산한 팀 점수가 경기 결과를 결정합니다.'),
              _SubTitle('경기 일정은 어디서 확인할 수 있나요?'),
              _Content('앱의 "경기 일정" 메뉴에서 실제 KBO 리그와 동일한 스케줄을 확인할 수 있습니다.'),
              _SubTitle('선수 데이터는 얼마나 자주 업데이트되나요?'),
              _Content('선수의 데이터는 KBO 리그 경기 결과에 따라 매일 업데이트됩니다.'),
              _SubTitle('ABO로 야구의 새로운 재미를 경험하세요!'),
              _Content('선수들의 성적을 예측하고, 전략적으로 팀을 구성하여 리그를 제패하세요.'),
              Gap.h64,
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

class _SubTitle extends StatelessWidget {
  const _SubTitle(this.content);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: context.textStyleT14b.copyWith(color: context.colorN10),
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
