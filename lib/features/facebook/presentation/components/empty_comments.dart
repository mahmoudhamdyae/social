import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';

class EmptyComments extends StatelessWidget {
  const EmptyComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No comments yet',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),
        ),
        8.ph,
        Text(
          'Be the first to comment.',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54
          ),
        )
      ],
    );
  }
}
