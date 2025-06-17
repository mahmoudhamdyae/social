import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SubmitLoading extends StatelessWidget {
  final double size;
  final String? message;
  final String? subMessage;

  const SubmitLoading({
    super.key,
    this.size = 100,
    this.message,
    this.subMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: const LoadingIndicator(
            indicatorType: Indicator.orbit,
            colors: [Colors.white],
          ),
        ),
        if (message != null) ...[
          SizedBox(
            height: 12,
          ),
          Text(
            message!,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
        if (subMessage != null) ...[
          SizedBox(
            height: 12,
          ),
          Text(
            subMessage!,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

class FetchLoading extends StatelessWidget {
  final double size;
  final Color? color;

  const FetchLoading({
    super.key,
    this.size = 100,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: color == null
              ? [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).primaryColor
          ]
              : [color!],
        ),
      ),
    );
  }
}

class InlineLoading extends StatelessWidget {
  final Color? color;
  final double size;
  const InlineLoading({
    super.key,
    this.color,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: LoadingIndicator(
          indicatorType: Indicator.circleStrokeSpin,
          colors: [
            color ?? Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
    );
  }
}

class ImageLoading extends StatelessWidget {
  final Color? color;

  const ImageLoading({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: SizedBox(
          width: 60,
          height: 60,
          child: LoadingIndicator(
            indicatorType: Indicator.ballScale,
            colors: [
              color ?? Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
      ),
    );
  }
}