import 'package:flutter/material.dart';

import '../component/text_style.dart';
import '../res/strings.dart';

class RegistrationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegistrationAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(size.width, size.height * 0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            const Text(
              AppStrings.register,
              style: LightAppTextStyle.title,
            )
          ],
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * .1);
}
