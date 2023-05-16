import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class PlayerPage extends HookWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("선수 정보"),
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
