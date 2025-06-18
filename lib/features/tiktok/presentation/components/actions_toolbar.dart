import 'package:flutter/material.dart';
import 'package:social/core/components/cached_image.dart';
import 'package:social/features/tiktok/presentation/components/tiktok_social_action.dart';

class ActionsToolbar extends StatelessWidget {

  static const double actionWidgetSize = 60.0;
  static const double actionIconSize = 35.0;
  static const double shareActionIconSize = 25.0;
  static const double profileImageSize = 50.0;
  static const double plusIconSize = 20.0;

  final String numLikes;
  final String numComments;
  final String userImage;
  final String postId;

  const ActionsToolbar(
      this.numLikes,
      this.numComments,
      this.userImage,
      {super.key, required this.postId}
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        _getFollowAction(pictureUrl: userImage),
        TiktokSocialAction(icon: Icons.favorite, title: numLikes, isFav: true, postId: postId,),
        TiktokSocialAction(icon: Icons.chat, title: numComments, postId: postId, isComment: true,),
        TiktokSocialAction(icon: Icons.reply, title: 'Share', postId: postId,),
        _getMusicPlayerAction(userImage)
      ]),
    );
  }

  Widget _getFollowAction({required String pictureUrl}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        width: 60.0,
        height: 60.0,
        child:
        Stack(children: [_getProfilePicture(pictureUrl), _getPlusIcon()]));
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((actionWidgetSize / 2) - (plusIconSize / 2)),
      child: Container(
          width: plusIconSize,
          height: plusIconSize,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 43, 84),
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }

  Widget _getProfilePicture(userPic) {
    return Positioned(
        left: (actionWidgetSize / 2) - (profileImageSize / 2),
        child: Container(
            height: profileImageSize,
            width: profileImageSize,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(profileImageSize / 2)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: CachedImage(
                  imageUrl: userPic,
                )
            )
        )
    );
  }

  LinearGradient get musicGradient => LinearGradient(colors: [
    Colors.grey[800]!,
    Colors.grey[900]!,
    Colors.grey[900]!,
    Colors.grey[800]!
  ], stops: [
    0.0,
    0.4,
    0.6,
    1.0
  ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction(String userImage) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: actionWidgetSize,
        height: actionWidgetSize,
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(11.0),
              height: profileImageSize,
              width: profileImageSize,
              decoration: BoxDecoration(
                  gradient: musicGradient,
                  borderRadius: BorderRadius.circular(profileImageSize / 2)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10000.0),
                  child: CachedImage(
                    imageUrl: userImage,
                  ))),
        ]));
  }
}