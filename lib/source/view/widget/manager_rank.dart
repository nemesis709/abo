import 'package:abo/common/extension/formatter_extensions.dart';
import 'package:abo/common/loadable_content.dart';
import 'package:abo/source/domain/user_model.dart';
import 'package:abo/ui/theme/app_colors.dart';
import 'package:abo/ui/theme/text_theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManagerRank extends ConsumerWidget {
  const ManagerRank({
    super.key,
    required this.userController,
  });

  final AsyncValue<List<UserModel>> userController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadableContent(
        asyncValue: userController,
        content: (asyncValue) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 30),
                  SizedBox(width: 60),
                  SizedBox(
                    width: 30,
                    child: Center(
                      child: Text(
                        '경기',
                        style: context.textStyleL10b.copyWith(color: context.colorN60),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: Center(
                      child: Text(
                        '승',
                        style: context.textStyleL10b.copyWith(color: context.colorN60),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: Center(
                      child: Text(
                        '무',
                        style: context.textStyleL10b.copyWith(color: context.colorN60),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: Center(
                      child: Text(
                        '패',
                        style: context.textStyleL10b.copyWith(color: context.colorN60),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Text(
                        '승률',
                        style: context.textStyleL10b.copyWith(color: context.colorN60),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Center(
                      child: Text(
                        '포인트',
                        style: context.textStyleL10b.copyWith(color: context.colorN60),
                      ),
                    ),
                  ),
                ],
              ),
              ...asyncValue.mapIndexed((index, e) => _ManagerItem(index + 1, e)),
            ],
          );
        });
  }
}

class _ManagerItem extends StatelessWidget {
  const _ManagerItem(this.rank, this.userModel);

  final int rank;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              rank.toString(),
              style: context.textStyleT14r,
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              userModel.name,
              style: context.textStyleT14b,
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(
                userModel.game.toString(),
                style: context.textStyleT14r,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(
                userModel.win.toString(),
                style: context.textStyleT14r,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(
                userModel.draw.toString(),
                style: context.textStyleT14r,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            child: Center(
              child: Text(
                userModel.lose.toString(),
                style: context.textStyleT14r,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Center(
              child: Text(
                userModel.rate.toString(),
                style: context.textStyleT14r,
              ),
            ),
          ),
          SizedBox(
            width: 60,
            child: Center(
              child: Text(
                '${(userModel.point).formatCurrency()} P',
                style: context.textStyleT14r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
