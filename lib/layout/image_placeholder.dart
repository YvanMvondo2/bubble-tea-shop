// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

import 'custom_outline.dart';

/// An image that shows a [placeholder] widget while the target [image] is
/// loading, then fades in the new image when it loads.
///
/// This is similar to [FadeInImage] but the difference is that it allows you
/// to specify a widget as a [placeholder], instead of just an [ImageProvider].
/// It also lets you override the [child] argument, in case you want to wrap
/// the image with another widget, for example an [Ink.image].
class FadeInImagePlaceholder extends StatelessWidget {
  const FadeInImagePlaceholder({
    super.key,
    required this.image,
    required this.placeholder,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.fit,
  });

  /// The target image that we are loading into memory.
  final ImageProvider image;

  /// Widget displayed while the target [image] is loading.
  final Widget placeholder;

  /// What widget you want to display instead of [placeholder] after [image] is
  /// loaded.
  ///
  /// Defaults to display the [image].
  final Widget? child;

  /// The duration for how long the fade out of the placeholder and
  /// fade in of [child] should take.
  final Duration duration;

  /// See [Image.excludeFromSemantics].
  final bool excludeFromSemantics;

  /// See [Image.width].
  final double? width;

  /// See [Image.height].
  final double? height;

  /// See [Image.fit].
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CustomOutline(
      strokeWidth: 4,
      radius: 40,
      padding: const EdgeInsets.all(4),
      width: 80,
      height: 80,
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.yellow,
            Colors.yellow.withOpacity(0),
            Colors.blue.withOpacity(0.1),
            Colors.blue
          ],
          stops: const [
            0.2,
            0.4,
            0.6,
            1
          ]),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment.bottomLeft,
            image: AssetImage(
              'assets/images/logo.p',
            ),
          ),
        ),
      ),
    );
    // Image(
    //   image: image,
    //   excludeFromSemantics: excludeFromSemantics,
    //   width: width,
    //   height: height,
    //   fit: fit,
    //   frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
    //     if (wasSynchronouslyLoaded) {
    //       return this.child ?? child;
    //     } else {
    //       return AnimatedSwitcher(
    //         duration: duration,
    //         child: frame != null ? this.child ?? child : placeholder,
    //       );
    //     }
    //   },
    // );
  }
}
