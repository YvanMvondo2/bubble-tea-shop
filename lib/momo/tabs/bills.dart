// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:momo_go/momo/tabs/sidebar.dart';

import 'package:url_launcher/url_launcher_string.dart';

import '../charts/pie_chart.dart';
import '../data.dart';
import '../finance.dart';

/// A page that shows a summary of bills.
class BillsView extends StatefulWidget {
  const BillsView({super.key});

  @override
  State<BillsView> createState() => _BillsViewState();
}

class _BillsViewState extends State<BillsView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var url = 'https://play.google.com/store/apps/details?id=com.consumerug&hl=fr&gl=US';
    final items = DummyDataService.getBillDataList(context);
    final dueTotal = sumBillDataPrimaryAmount(items);
    final paidTotal = sumBillDataPaidAmount(items);
    final detailItems = DummyDataService.getBillDetailList(
      context,
      dueTotal: dueTotal,
      paidTotal: paidTotal,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: TabWithSidebar(
        restorationId: 'bills_view',
        mainView: DetailsUser(
          heroLabel: 'Mr Francois',
          // heroAmount: 21,
          segments: buildSegmentsFromBillItems(items),
          wholeAmount: 15,
          financialEntityCards: buildBillDataListViews(items, context),
        ),
        sidebarItems: [
          for (UserDetailData item in detailItems)
            SidebarItem(title: item.title, value: item.value)
        ],
      ),
      // Text('asdsadasdasdsa'),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow,
        onPressed: () => openUrl(url, context),
        icon: const IconTheme(
          data: IconThemeData(color: Colors.blue),
          child: Icon(Icons.currency_exchange_outlined),
        ),
        label: Text(
          'Paiement'.toUpperCase(),
        ),
      ),
    );
  }

  Future<void> openUrl(promo, context) async {
    if (!await launchUrlString(
      promo,
      mode: LaunchMode.externalApplication,
    )) {
      await launchUrlString(promo);
    }
    throw Exception('Could not launch $promo');
  }
}
