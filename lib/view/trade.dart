import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:abo/logger/logger.dart';

class TradePage extends HookWidget {
  TradePage({Key? key}) : super(key: key);

  final logger = CustomLogger();

  final List<dynamic> myPlayer = ['고영표', '소형준', '엄상백'];
  final List<String> tradePlayer = <String>['박찬호', '이의리', '홍창기'];

  @override
  Widget build(BuildContext context) {
    logger.d(myPlayer[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("트레이드"),
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
          const Text("내 선수"),
          SizedBox(
            height: 200,
            child: displayPlayer(myPlayer),
          ),
        ],
      )),
    );
  }

  Widget displayPlayer(List<dynamic> list) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            child: Center(child: Text(list[index])),
          );
        });
  }
}
