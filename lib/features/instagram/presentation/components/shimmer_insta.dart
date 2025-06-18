import 'package:flutter/material.dart';
import 'package:social/core/components/shimmer_loading.dart';
import 'package:social/core/extensions/num_extensions.dart';

import '../../../../core/components/custom_shadow.dart';

class ShimmerInsta extends StatelessWidget {
  const ShimmerInsta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: customMainBoxShadow(context: context)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              // User Image
              ClipOval(
                child: ShimmerItem(
                  width: 40,
                  height: 40,
                ),
              ),
              16.pw,
              // User Name
              ShimmerItem(
                width: 80,
                height: 10,
              )
            ],
          ),
          16.ph,
          // Post
          ShimmerItem(
            width: MediaQuery.sizeOf(context).width,
            height: 250,
          ),
          16.ph,
          // Actions
          Row(
            children: const [
              Expanded(
                child: ShimmerItem(height: 30,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
