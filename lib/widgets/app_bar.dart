import 'package:flutter/widgets.dart';
import 'package:shopnew/res/dimens.dart';

import '../res/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});
  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppDimens.medium),
                bottomRight: Radius.circular(AppDimens.medium),
              ),
              color: AppColors.appbar,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    color: AppColors.shadow,
                    offset: Offset(0, 5))
              ]),
          child: child),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
