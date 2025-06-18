import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/instagram/domain/models/insta.dart';
import 'package:social/features/instagram/presentation/components/insta_item.dart';
import 'package:social/features/instagram/presentation/components/shimmer_insta.dart';

class InstaList extends StatelessWidget {

  final List<Insta> instas;
  final bool isLoading;
  const InstaList({super.key, required this.instas, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: isLoading ? 3 : instas.length,
      separatorBuilder: (BuildContext context, int index) => 8.ph,
      itemBuilder: (BuildContext context, int index) {
        return isLoading ? ShimmerInsta() : InstaItem(insta: instas[index]);
      },
    );
  }
}
