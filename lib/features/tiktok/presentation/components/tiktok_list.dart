import 'package:flutter/material.dart';
import 'package:social/features/tiktok/domain/models/video.dart';
import 'package:social/features/tiktok/presentation/components/tiktok_item.dart';

class TiktokList extends StatefulWidget {
  final List<Video> videos;

  const TiktokList({super.key, required this.videos});

  @override
  State<TiktokList> createState() => _TiktokListState();
}

class _TiktokListState extends State<TiktokList> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final int page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
        print('----A---- $_currentPage');
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.videos.length,
      itemBuilder: (context, index) {
        return TiktokItem(
          video: widget.videos[index],
          // isCurrent: index == _currentPage,
        );
      },
    );
  }
}
