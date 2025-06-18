import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social/core/components/cached_image.dart';
import 'package:social/core/components/custom_shadow.dart';
import 'package:social/core/extensions/num_extensions.dart';
import 'package:social/features/facebook/presentation/components/user_section.dart';
import 'package:social/features/instagram/domain/models/insta.dart';

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

          if (images.isNotEmpty)
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return CachedImage(
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),

                // Dot Indicator
                if (images.length > 1) Positioned(
                  bottom: 8,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: images.length,
                    effect: const WormEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
