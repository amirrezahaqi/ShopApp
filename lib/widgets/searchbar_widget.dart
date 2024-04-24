import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';
import '../res/dimens.dart';
import '../res/strings.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.ontap});
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.large),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
                color: AppColors.shadow,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svg.search),
              const Text(
                AppStrings.searchProduct,
                style: LightAppTextStyle.hint,
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Image.asset(Assets.png.mainLogo.path),
              )
            ],
          ),
        ),
      ),
    );
  }
}
