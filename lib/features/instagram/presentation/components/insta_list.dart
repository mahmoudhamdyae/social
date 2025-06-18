import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/instagram/domain/models/insta.dart';
import 'package:social/features/instagram/presentation/components/insta_item.dart';

class InstaList extends StatelessWidget {

  final List<Insta> instas;
  const InstaList({super.key, required this.instas});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: instas.length,
      separatorBuilder: (BuildContext context, int index) => 8.ph,
      itemBuilder: (BuildContext context, int index) {
        return InstaItem(insta: instas[index]);
      },
    );
  }
}
