// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../colors.dart';
import '../data.dart';
import '../finance.dart';
import '../formatters.dart';

/// A page that shows a status overview.
class OverviewView extends StatefulWidget {
  const OverviewView({super.key});

  @override
  State<OverviewView> createState() => _OverviewViewState();
}

class _OverviewViewState extends State<OverviewView> {
  @override
  Widget build(BuildContext context) {
    final alerts = DummyDataService.getAlerts(context);
    var largeur = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      restorationId: 'overview_scroll_view',
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
        width: largeur,
        // height: MediaQuery.of(context).size.height,
        color: MomoColors.uiColor,
        child: Column(
          children: [
            _AlertsView(alerts: alerts.sublist(0, 1)),
            const SizedBox(height: 12),
            const _OverviewGrid(spacing: 12),
          ],
        ),
      ),
    );
  }
}

class _OverviewGrid extends StatelessWidget {
  const _OverviewGrid({required this.spacing});

  final double spacing;

  @override
  Widget build(BuildContext context) {
    final accountDataList = DummyDataService.getAccountDataList(context);

    return Wrap(
      runSpacing: spacing,
      children: [
        SizedBox(
          width: double.infinity,
          child: _FinancialView(
            title: '29 janv',
            total: sumAccountDataPrimaryAmount(accountDataList),
            financialItemViews:
                buildAccountDataListViews(accountDataList, context),
            buttonSemanticsLabel: 'See All Accounts',
            order: 1,
          ),
        ),
        // if (hasMultipleColumns) SizedBox(width: spacing),
        SizedBox(
          width: double.infinity,
          child: _FinancialView(
            title: '30 janv',
            total: sumAccountDataPrimaryAmount(accountDataList),
            financialItemViews:
                buildAccountDataListViews(accountDataList, context),
            buttonSemanticsLabel: 'See All Accounts',
            order: 1,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: _FinancialView(
            title: '01 Fév',
            total: sumAccountDataPrimaryAmount(accountDataList),
            financialItemViews:
                buildAccountDataListViews(accountDataList, context),
            buttonSemanticsLabel: 'See All Accounts',
            order: 1,
          ),
        ),
        // SizedBox(
        //   width: boxWidth,
        //   child: _FinancialView(
        //     title: 'Compte Supermarche',
        //     total: sumBillDataPrimaryAmount(billDataList),
        //     financialItemViews: buildBillDataListViews(billDataList, context),
        //     buttonSemanticsLabel: localizations.rallySeeAllBills,
        //     order: 2,
        //   ),
        // ),
        // SizedBox(
        //   width: boxWidth,
        //   child: _FinancialView(
        //     title: 'Compte autres',
        //     total: sumBillDataPrimaryAmount(billDataList),
        //     financialItemViews: buildBillDataListViews(billDataList, context),
        //     buttonSemanticsLabel: localizations.rallySeeAllBills,
        //     order: 2,
        //   ),
        // ),
        // _FinancialView(
        //   title: localizations.rallyBudgets,
        //   total: sumBudgetDataPrimaryAmount(budgetDataList),
        //   financialItemViews:
        //       buildBudgetDataListViews(budgetDataList, context),
        //   buttonSemanticsLabel: localizations.rallySeeAllBudgets,
        //   order: 3,
        // ),
      ],
    );
  }
}

class _AlertsView extends StatelessWidget {
  const _AlertsView({this.alerts});

  final List<AlertData>? alerts;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 5, bottom: 5),
      color: MomoColors.cardBackground,
      child: Column(
        children: [
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: MergeSemantics(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                  Text(
                    'Alertes transactions',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          for (AlertData alert in alerts!) ...[
            Container(color: MomoColors.gray, height: 1),
            const SizedBox(height: 5),
            _Alert(alert: alert),
          ]
        ],
      ),
    );
  }
}

class _Alert extends StatelessWidget {
  const _Alert({required this.alert});

  final AlertData alert;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SelectableText(alert.message!),
          ),
          SizedBox(
            width: 100,
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(alert.iconData, color: MomoColors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FinancialView extends StatelessWidget {
  const _FinancialView({
    this.title,
    this.total,
    this.financialItemViews,
    this.buttonSemanticsLabel,
    this.order,
  });

  final String? title;
  final String? buttonSemanticsLabel;
  final double? total;
  final List<FinancialEntityCategoryView>? financialItemViews;
  final double? order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: MomoColors.cardBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: SelectableText(title!),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SelectableText(
                  usdWithSignFormat(context).format(total),
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          ...financialItemViews!
              .sublist(0, math.min(financialItemViews!.length, 3)),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: () {},
            child: Text(
              'Tout Afficher',
              semanticsLabel: buttonSemanticsLabel,
            ),
          ),
        ],
      ),
    );
  }
}
