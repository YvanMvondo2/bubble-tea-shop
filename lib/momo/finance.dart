// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../layout/custom_outline.dart';
import '../layout/text_scale.dart';
import 'charts/pie_chart.dart';
import 'charts/vertical_fraction_bar.dart';
import 'colors.dart';
import 'data.dart';
import 'formatters.dart';

class FinancialEntityView extends StatelessWidget {
  const FinancialEntityView({
    super.key,
    required this.heroLabel,
    required this.heroAmount,
    required this.wholeAmount,
    required this.segments,
    required this.financialEntityCards,
  });

  /// The amounts to assign each item.
  final List<RallyPieChartSegment> segments;
  final String heroLabel;
  final double heroAmount;
  final double wholeAmount;
  final List<FinancialEntityCategoryView> financialEntityCards;

  @override
  Widget build(BuildContext context) {
    final maxWidth = pieChartMaxSize + (cappedTextScale(context) - 1.0) * 100.0;
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                // We decrease the max height to ensure the [RallyPieChart] does
                // not take up the full height when it is smaller than
                // [kPieChartMaxSize].
                maxHeight: math.min(
                  constraints.biggest.shortestSide * 0.9,
                  maxWidth,
                ),
              ),
              child: Center(
                child: CustomOutline(
                  strokeWidth: 4,
                  radius: 80,
                  padding: const EdgeInsets.all(4),
                  width: 200,
                  height: 200,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.yellow,
                        Colors.yellow.withOpacity(0),
                        Colors.blue.withOpacity(0.1),
                        Colors.blue,
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
                        image: AssetImage('assets/images/check.jpeg'),
                      ),
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 24),
          Container(
            height: 1,
            constraints: BoxConstraints(maxWidth: maxWidth),
            color: MomoColors.inputBackground,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            color: MomoColors.cardBackground,
            child: Column(
              children: financialEntityCards,
            ),
          ),
        ],
      );
    });
  }
}

class DetailsUser extends StatelessWidget {
  const DetailsUser({
    super.key,
    required this.heroLabel,
    // required this.heroAmount,
    required this.wholeAmount,
    required this.segments,
    required this.financialEntityCards,
  });

  /// The amounts to assign each item.
  final List<RallyPieChartSegment> segments;
  final String heroLabel;
  // final double heroAmount;
  final double wholeAmount;
  final List<DetailCardView> financialEntityCards;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: CustomOutline(
                strokeWidth: 4,
                radius: 80,
                padding: const EdgeInsets.all(4),
                width: 150,
                height: 150,
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
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.bottomLeft,
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            color: MomoColors.gray,
          ),
          Container(
            color: MomoColors.cardBackground,
            child: Column(
              children: financialEntityCards,
            ),
          ),
        ],
      ),
    );
  }
}

/// A reusable widget to show balance information of a single entity as a card.
class DetailCardView extends StatelessWidget {
  const DetailCardView({
    super.key,
    required this.indicatorColor,
    required this.indicatorFraction,
    required this.title,
    required this.subtitle,
    required this.semanticsLabel,
    required this.amount,
    required this.suffix,
  });

  final Color indicatorColor;
  final double indicatorFraction;
  final String title;
  final String subtitle;
  final String semanticsLabel;
  final String amount;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: VerticalFractionBar(
                    color: indicatorColor,
                    fraction: indicatorFraction,
                  ),
                ),
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: textTheme.bodyMedium!.copyWith(fontSize: 16),
                          ),
                          Text(
                            subtitle,
                            style: textTheme.bodyMedium!
                                .copyWith(color: MomoColors.black),
                          ),
                        ],
                      ),
                      // Text(
                      //   amount,
                      //   style: textTheme.bodyLarge!.copyWith(
                      //     fontSize: 20,
                      //     color: MomoColors.gray,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Container(
                //   constraints: const BoxConstraints(minWidth: 32),
                //   padding: const EdgeInsetsDirectional.only(start: 12),
                //   child: suffix,
                // ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
            color: MomoColors.dividerColor,
          ),
        ],
      ),
    );
  }
}

/// A reusable widget to show balance information of a single entity as a card.
class FinancialEntityCategoryView extends StatefulWidget {
  const FinancialEntityCategoryView({
    super.key,
    required this.indicatorColor,
    required this.indicatorFraction,
    required this.title,
    required this.subtitle,
    required this.semanticsLabel,
    required this.amount,
    required this.suffix,
  });

  final Color indicatorColor;
  final double indicatorFraction;
  final String title;
  final String subtitle;
  final String semanticsLabel;
  final String amount;
  final Widget suffix;

  @override
  State<FinancialEntityCategoryView> createState() =>
      _FinancialEntityCategoryViewState();
}

class _FinancialEntityCategoryViewState
    extends State<FinancialEntityCategoryView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        button: true,
        enabled: true,
        label: widget.semanticsLabel,
      ),
      excludeSemantics: true,
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 350),
        transitionType: ContainerTransitionType.fade,
        openBuilder: (context, openContainer) =>
            FinancialEntityCategoryDetailsPage(),
        openColor: MomoColors.primaryBackground,
        closedColor: MomoColors.primaryBackground,
        closedElevation: 0,
        closedBuilder: (context, openContainer) {
          return TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.black),
            onPressed: openContainer,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 32,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: VerticalFractionBar(
                          color: widget.indicatorColor,
                          fraction: widget.indicatorFraction,
                        ),
                      ),
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: textTheme.bodyMedium!
                                      .copyWith(fontSize: 16),
                                ),
                                Text(
                                  widget.subtitle,
                                  style: textTheme.bodyMedium!
                                      .copyWith(color: MomoColors.black),
                                ),
                              ],
                            ),
                            Text(
                              widget.amount,
                              style: textTheme.bodyLarge!.copyWith(
                                fontSize: 20,
                                color: MomoColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(minWidth: 32),
                        padding: const EdgeInsetsDirectional.only(start: 12),
                        child: widget.suffix,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: MomoColors.dividerColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Data model for [FinancialEntityCategoryView].
class FinancialEntityCategoryModel {
  const FinancialEntityCategoryModel(
    this.indicatorColor,
    this.indicatorFraction,
    this.title,
    this.subtitle,
    this.usdAmount,
    this.suffix,
  );

  final Color indicatorColor;
  final double indicatorFraction;
  final String title;
  final String subtitle;
  final double usdAmount;
  final Widget suffix;
}

FinancialEntityCategoryView buildFinancialEntityFromAccountData(
  AccountData model,
  int accountDataIndex,
  BuildContext context,
) {
  final amount = usdWithSignFormat(context).format(model.primaryAmount);
  final shortAccountNumber = model.accountNumber.substring(6);
  return FinancialEntityCategoryView(
    suffix: const Icon(Icons.chevron_right, color: Colors.grey),
    title: model.name,
    subtitle: '• • • • • • $shortAccountNumber',
    semanticsLabel:
        '${model.name}, lorem $shortAccountNumber, lorem ipsum $amount',
    indicatorColor: MomoColors.accountColor(accountDataIndex),
    indicatorFraction: 1,
    amount: amount,
  );
}

DetailCardView buildFinancialEntityFromBillData(
  BillData model,
  int billDataIndex,
  BuildContext context,
) {
  final amount = usdWithSignFormat(context).format(model.primaryAmount);
  return DetailCardView(
    suffix: const Icon(Icons.chevron_right, color: Colors.white),
    title: model.name,
    subtitle: model.dueDate,
    semanticsLabel:
        '${model.name}, lorem ${model.dueDate}, lorem ipsum $amount',
    indicatorColor: MomoColors.billColor(billDataIndex),
    indicatorFraction: 1,
    amount: amount,
  );
}

FinancialEntityCategoryView buildFinancialEntityFromBudgetData(
  BudgetData model,
  int budgetDataIndex,
  BuildContext context,
) {
  final amountUsed = usdWithSignFormat(context).format(model.amountUsed);
  final primaryAmount = usdWithSignFormat(context).format(model.primaryAmount);
  final amount =
      usdWithSignFormat(context).format(model.primaryAmount - model.amountUsed);

  return FinancialEntityCategoryView(
    suffix: Text(
      'finance',
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: MomoColors.black, fontSize: 10),
    ),
    title: model.name,
    subtitle: '$amountUsed / $primaryAmount',
    semanticsLabel:
        'Budget ${model.name} avec ${model.amountUsed} utilisés sur ${model.primaryAmount}, $amount restants',
    indicatorColor: MomoColors.budgetColor(budgetDataIndex),
    indicatorFraction: model.amountUsed / model.primaryAmount,
    amount: amount,
  );
}

List<FinancialEntityCategoryView> buildAccountDataListViews(
  List<AccountData> items,
  BuildContext context,
) {
  return List<FinancialEntityCategoryView>.generate(
    items.length,
    (i) => buildFinancialEntityFromAccountData(items[i], i, context),
  );
}

List<DetailCardView> buildBillDataListViews(
  List<BillData> items,
  BuildContext context,
) {
  return List<DetailCardView>.generate(
    items.length,
    (i) => buildFinancialEntityFromBillData(items[i], i, context),
  );
}

List<FinancialEntityCategoryView> buildBudgetDataListViews(
  List<BudgetData> items,
  BuildContext context,
) {
  return <FinancialEntityCategoryView>[
    for (int i = 0; i < items.length; i++)
      buildFinancialEntityFromBudgetData(items[i], i, context)
  ];
}

class FinancialEntityCategoryDetailsPage extends StatelessWidget {
  FinancialEntityCategoryDetailsPage({super.key});

  final List<DetailedEventData> items =
      DummyDataService.getDetailedEventItems();

  @override
  Widget build(BuildContext context) {
    // final isDesktop = isDisplayDesktop(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Details de la transaction',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 200,
          //   width: double.infinity,
          //   child: RallyLineChart(events: items),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.zero,
              child: ListView(
                shrinkWrap: true,
                children: [
                  for (DetailedEventData detailedEventData in items)
                    _DetailedEventCard(
                      title: detailedEventData.title,
                      date: detailedEventData.date,
                      amount: detailedEventData.amount,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailedEventCard extends StatelessWidget {
  const _DetailedEventCard({
    required this.title,
    required this.date,
    required this.amount,
  });

  final String title;
  final DateTime date;
  final double amount;

  @override
  Widget build(BuildContext context) {
    // final isDesktop = isDisplayDesktop(context);
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      onPressed: () {},
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _EventTitle(title: title),
                    // _EventDate(date: date),
                  ],
                ),
                _EventAmount(amount: amount),
              ],
            ),
          ),
          SizedBox(
            height: 1,
            child: Container(
              color: MomoColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _EventAmount extends StatelessWidget {
  const _EventAmount({required this.amount});

  final double amount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      usdWithSignFormat(context).format(amount),
      style: textTheme.bodyLarge!.copyWith(
        fontSize: 20,
        color: MomoColors.black,
      ),
    );
  }
}

// class _EventDate extends StatelessWidget {
//   const _EventDate({required this.date});

//   final DateTime date;

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Text(
//       shortDateFormat(context).format(date),
//       semanticsLabel: longDateFormat(context).format(date),
//       style: textTheme.bodyMedium!.copyWith(color: MomoColors.gray60),
//     );
//   }
// }

class _EventTitle extends StatelessWidget {
  const _EventTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: textTheme.bodyMedium!.copyWith(fontSize: 16),
    );
  }
}
