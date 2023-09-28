import 'package:abo/common/loadable_content.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod/riverpod.dart';

@RoutePage()
class PlayerPage extends HookWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("선수 정보",
          style: context.textStyleH20b.copyWith(color: context.colorP10),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                    Card(
            child: Column(
              children: [
                Image.network(
                    'https://lgcxydabfbch3774324.cdn.ntruss.com/KBO_IMAGE/person/middle/2022/71564.jpg'),
                Text("이대호"),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
