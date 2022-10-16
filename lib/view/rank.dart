import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RankPage extends HookWidget {
  RankPage({Key? key}) : super(key: key);

  final List<String> manager = <String>['장세민', '장세훈', '정재민'];
  final List<String> player = <String>['고영표', '소형준', '엄상백'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("랭킹 보기"),
      ),
      body: Center(
          child: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 80),
              const Text("감독 랭킹"),
              SizedBox(
                height: 200,
                child: displayRank(manager),
              ),
              const Text("선수 랭킹"),
              SizedBox(
                height: 200,
                child: displayRank(player),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget displayRank(List<String> list) {
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
