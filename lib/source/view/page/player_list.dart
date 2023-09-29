import 'package:abo/ui/route/app_router.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class PlayerListPage extends HookWidget {
  const PlayerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('선수 정보',
          style: context.textStyleH20b.copyWith(color: context.colorP10),
        ),
        actions: [
          IconButton(onPressed: ()=> context.pushRoute(SearchRoute()), icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('내 선수'),
          Text('이대호'),
          Text('이대호'),
          Text('이대호'),
          Text('이대호'),
          Text('이대호'),
          Text('이대호'),
          Text('이대호'),
        ],
      )),
    );
  }
}
