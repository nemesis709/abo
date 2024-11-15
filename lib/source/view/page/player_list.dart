import 'package:abo/common/common_constants.dart';
import 'package:abo/common/extension/build_context_extension.dart';
import 'package:abo/common/extension/string_extensions.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/player_model.dart';
import 'package:abo/source/controller/player_controller.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/source/view/page/batter_stat.dart';
import 'package:abo/source/view/page/pitcher_stat.dart';
import 'package:abo/source/view/widget/default_bottom_sheet.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PlayerListPage extends ConsumerStatefulWidget {
  const PlayerListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerListPageState();
}

class _PlayerListPageState extends ConsumerState<PlayerListPage> with SingleTickerProviderStateMixin {
  late TabController controller;
  late TextEditingController textEditingController;
  late FocusNode focusNode;

  bool isSearch = false;
  String query = '';

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final players = ref.watch(playerControllerProvider(null));
    final notifier = ref.read(playerControllerProvider(null).notifier);

    return Scaffold(
        appBar: AppBar(
          title: isSearch
              ? TextFormField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  onChanged: (_) {
                    setState(() {
                      query = textEditingController.text;
                    });
                  },
                  onTapOutside: (_) {
                    focusNode.unfocus();
                    if (query.isEmptySpace) {
                      setState(() {
                        isSearch = false;
                      });
                    }
                  },
                  style: context.textStyleB14r,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: '선수명을 입력해주세요',
                    hintStyle: context.textStyleB14r.copyWith(color: context.colorN40),
                  ),
                )
              : Text(
                  '선수 명단',
                  style: context.textStyleH20b.copyWith(color: context.colorP10),
                ),
          leading: InkWell(
            onTap: () => context.maybePop(),
            child: Icon(Icons.arrow_back_ios, size: 18),
          ),
          actions: [
            isSearch
                ? InkWell(
                    onTap: () => setState(() {
                      query = '';
                      textEditingController.text = '';
                      focusNode.requestFocus();
                    }),
                    child: Icon(Icons.close, size: 24),
                  )
                : InkWell(
                    onTap: () => setState(() {
                      isSearch = true;
                      focusNode.requestFocus();
                    }),
                    child: Icon(Icons.search, size: 24),
                  ),
            Gap.w16,
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: isSearch && query.isNotEmptySpace
              ? [
                  _Header(),
                  Expanded(
                    child: LoadableContent(
                        asyncValue: players,
                        content: (content) {
                          return SingleChildScrollView(
                            child: Column(
                              children: content
                                  .where((e) => e.name.contains(query))
                                  .map((e) => _PlayerItem(
                                        playerInfo: e,
                                        userList: notifier.userList,
                                        query: query,
                                      ))
                                  .toList(),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: context.paddingBottom),
                ]
              : [
                  TabBar(controller: controller, tabs: [
                    Text('투수', style: context.textStyleT14b.copyWith(color: context.colorP10)),
                    Text('타자', style: context.textStyleT14b.copyWith(color: context.colorP10)),
                  ]),
                  Gap.h4,
                  _Header(),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        LoadableContent(
                            asyncValue: players,
                            content: (content) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: content
                                      .where((e) => e.isPitcher)
                                      .map((e) => _PlayerItem(
                                            playerInfo: e,
                                            userList: notifier.userList,
                                            query: '',
                                          ))
                                      .toList(),
                                ),
                              );
                            }),
                        LoadableContent(
                            asyncValue: players,
                            content: (content) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: content
                                      .where((e) => !e.isPitcher)
                                      .map((e) => _PlayerItem(
                                            playerInfo: e,
                                            userList: notifier.userList,
                                            query: '',
                                          ))
                                      .toList(),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: context.paddingBottom),
                ],
        ));
  }
}

class _PlayerItem extends StatelessWidget {
  const _PlayerItem({
    required this.playerInfo,
    required this.userList,
    required this.query,
  });

  final PlayerModel playerInfo;
  final List<UserModel> userList;
  final String query;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (playerInfo.isPitcher) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: PitcherStatPage(playerInfo: playerInfo));
              });
        } else {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return DefaultBottomSheet(
                    maxHeight: context.sizeHeight * 0.8,
                    minHeight: context.sizeHeight * 0.5,
                    child: BatterStatPage(playerInfo: playerInfo));
              });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            SizedBox(width: 80, child: Center(child: HighlightedText(text: playerInfo.name, highlightWord: query))),
            SizedBox(width: 40, child: Center(child: Text(playerInfo.team.name, style: context.textStyleT14r))),
            SizedBox(
              width: 60,
              child: Center(
                child: playerInfo.owner.isNotEmptySpace
                    ? Text(
                        userList.firstWhereOrNull((e) => e.uid == playerInfo.owner)?.name ?? '',
                        style: context.textStyleT14r,
                      )
                    : SizedBox(),
              ),
            ),
            const Spacer(),
            SizedBox(width: 80, child: Center(child: Text('1240 P', style: context.textStyleT14r))),
          ],
        ),
      ),
    );
  }
}

class HighlightedText extends StatelessWidget {
  final String text;
  final String highlightWord;

  const HighlightedText({
    super.key,
    required this.text,
    required this.highlightWord,
  });

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];

    text.splitMapJoin(
      highlightWord,
      onMatch: (match) {
        spans.add(TextSpan(
          text: match.group(0),
          style: context.textStyleT14b.copyWith(color: context.colorBlueJeans),
        ));
        return match.group(0)!;
      },
      onNonMatch: (nonMatch) {
        spans.add(TextSpan(
          text: nonMatch,
          style: context.textStyleT14b,
        ));
        return nonMatch;
      },
    );

    return Text.rich(TextSpan(children: spans));
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              '이름',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
        SizedBox(
          width: 40,
          child: Center(
            child: Text(
              '소속팀',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              '감독',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: 80,
          child: Center(
            child: Text(
              '포인트',
              style: context.textStyleL10b.copyWith(color: context.colorN60),
            ),
          ),
        ),
      ],
    );
  }
}
