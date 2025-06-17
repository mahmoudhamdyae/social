import 'package:flutter/material.dart';
import 'package:social/core/extensions/num_extensions.dart';

class UserSection extends StatelessWidget {

  final String userName;
  final String userImage;

  const UserSection({
    super.key,
    required this.userName,
    required this.userImage
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // User Image
        SizedBox(
          width: 40,
          height: 40,
          child: ClipOval(
            child: Image.network(
              userImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        16.pw,
        // User Name
        Text(
          userName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
