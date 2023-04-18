// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../colors.dart';

class TabWithSidebar extends StatelessWidget {
  const TabWithSidebar({
    super.key,
    this.restorationId,
    required this.mainView,
    required this.sidebarItems,
  });

  final Widget mainView;
  final List<Widget> sidebarItems;
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      restorationId: restorationId,
      child: mainView,
    );
  }
}

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.value,
    required this.title,
  });

  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        SelectableText(
          title,
          style: textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            color: MomoColors.black,
          ),
        ),
        const SizedBox(height: 8),
        SelectableText(
          value,
          style: textTheme.bodyLarge!
              .copyWith(fontSize: 20, color: MomoColors.black),
        ),
        const SizedBox(height: 8),
        Container(
          color: MomoColors.black,
          height: 1,
        ),
      ],
    );
  }
}
