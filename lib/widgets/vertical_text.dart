import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(Assets.svg.back), const Text("data")],
          ),
          const Text("data")
        ],
      ),
    );
  }
}
