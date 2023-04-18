// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../colors.dart';
import '../data.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
        width: MediaQuery.of(context).size.width,
        color: MomoColors.uiColor,
        child: ListView(
          restorationId: 'settings_list_view',
          shrinkWrap: true,
          children: [
            for (String title
                in DummyDataService.getSettingsTitles(context)) ...[
              _SettingsItem(title),
              const Divider(
                color: MomoColors.dividerColor,
                height: 1,
              )
            ]
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
        child: Text(title),
      ),
    );
  }
}
