import 'package:abo/common/logger/logger.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class TradePage extends StatelessWidget {
  const TradePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = CustomLogger();

    final List<dynamic> myPlayer = ['고영표', '소형준', '엄상백'];
    final List<String> tradePlayer = <String>['박찬호', '이의리', '홍창기'];

    logger.d(myPlayer[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("트레이드",
          style: context.textStyleH20b.copyWith(color: context.colorP10),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 80),
          const Text("트레이드 블록"),
          SizedBox(
            height: 200,
            child: displayPlayer(tradePlayer),
          ),
          // const Text("내 선수"),
          // SizedBox(
          //   height: 200,
          //   child: displayPlayer(myPlayer),
          // ),
        ],
      )),
    );
  }

  Widget displayPlayer(List<dynamic> list) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text(list[index])),
          );
        });
  }
}
