import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social/core/components/cached_image.dart';
import 'package:social/core/components/custom_shadow.dart';
import 'package:social/core/components/video_item.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/presentation/components/user_section.dart';
import 'package:social/features/instagram/domain/models/insta.dart';
import 'package:social/features/instagram/presentation/components/insta_like_button.dart';
import 'package:social/features/instagram/presentation/cubit/insta_cubit.dart';

import '../../../../core/enums/post_type.dart';
import '../../../comments/presentation/components/comments_sheet.dart';
import '../../../comments/presentation/cubit/comments_cubit.dart';

class InstaItem extends StatefulWidget {
  final Insta insta;

  const InstaItem({super.key, required this.insta});

  @override
  State<InstaItem> createState() => _InstaItemState();
}

class _InstaItemState extends State<InstaItem> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.insta.images ?? [];
    final videos = widget.insta.videos ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: customMainBoxShadow(context: context),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserSection(
            userName: widget.insta.userName ?? '',
            userImage: widget.insta.userImage ?? '',
          ),
          16.ph,

          // if (images.isNotEmpty && videos.isNotEmpty)
            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length + videos.length,
                itemBuilder: (context, index) {
                  return index >= images.length ?
                      VideoItem(
                        link: videos[images.isEmpty ? index : (index % images.length)],
                        respectAspectRatio: true,
                      )
                      : CachedImage(
                    imageUrl: images[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),

          // Dot Indicator
          if (images.length > 1 || videos.length > 1) Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: images.length + videos.length,
                effect: WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
          ),

          16.ph,
          Row(
            children: [
              InstaLikeButton(
                postId: widget.insta.id ?? -1,
                likesNo: widget.insta.likesNo ?? 0,
              ),
              8.pw,
              InkWell(
                onTap: () { _onClickComments(context); },
                child: Row(
                  children: [
                    16.pw,
                    Icon(Icons.comment_outlined),
                    8.pw,
                    Text('${widget.insta.commentNo ?? 0}')
                  ],
                ),
              ),
            ],
          ),
          ((widget.insta.text ?? '').isEmpty ? 0 : 16).ph,
          (widget.insta.text ?? '').isEmpty ? const SizedBox()
              :
          Text(
            widget.insta.text ?? '',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  void _onClickComments(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (_) =>
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<InstaCubit>()),
                BlocProvider.value(value: context.read<CommentsCubit>()..getComments((widget.insta.id ?? -1).toString(), PostType.instagram)),
              ],
              child: CommentsSheet(
                postId: (widget.insta.id ?? -1).toString(),
                postType: PostType.instagram,
              ),
            )
    );
  }
}
