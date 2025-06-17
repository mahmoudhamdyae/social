import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/core/resources/assets_manager.dart';

class EmptyComments extends StatelessWidget {
  const EmptyComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsManager.empty,
          width: MediaQuery.sizeOf(context).width / 2,
        ),
        32.ph,
        Text(
          'No comments on this post yet',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
        )
      ],
    );
  }
}
