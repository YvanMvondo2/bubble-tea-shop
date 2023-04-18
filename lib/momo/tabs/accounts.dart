// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:momo_go/momo/tabs/sidebar.dart';

import '../charts/pie_chart.dart';
import '../data.dart';
import '../finance.dart';

/// A page that shows a summary of accounts.
class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = DummyDataService.getAccountDataList(context);
    final detailItems = DummyDataService.getAccountDetailList(context);
    final balanceTotal = sumAccountDataPrimaryAmount(items);

    return TabWithSidebar(
      restorationId: 'accounts_view',
      mainView: FinancialEntityView(
        heroLabel: 'GalleryLocalizations.of(context)!.rallyAccountTotal',
        heroAmount: balanceTotal,
        segments: buildSegmentsFromAccountItems(items),
        wholeAmount: balanceTotal,
        financialEntityCards: buildAccountDataListViews(items, context),
      ),
      sidebarItems: [
        for (UserDetailData item in detailItems)
          SidebarItem(title: item.title, value: item.value)
      ],
    );
  }
}
