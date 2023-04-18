import 'package:flutter/material.dart';

import '../charts/pie_chart.dart';
import '../data.dart';
import '../finance.dart';
import 'sidebar.dart';

class BudgetsView extends StatefulWidget {
  const BudgetsView({super.key});

  @override
  State<BudgetsView> createState() => _BudgetsViewState();
}

class _BudgetsViewState extends State<BudgetsView>
    with SingleTickerProviderStateMixin {
  late double _rating;

  @override
  void initState() {
    _rating = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = DummyDataService.getBudgetDataList(context);
    final capTotal = sumBudgetDataPrimaryAmount(items);
    final usedTotal = sumBudgetDataAmountUsed(items);
    final detailItems = DummyDataService.getBudgetDetailList(
      context,
      capTotal: capTotal,
      usedTotal: usedTotal,
    );

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      // ),
      body: TabWithSidebar(
        restorationId: 'budgets_view',
        mainView: FinancialEntityView(
          heroLabel: 'GalleryLocalizations.of(context)!.rallyBudgetLeft',
          heroAmount: capTotal - usedTotal,
          segments: buildSegmentsFromBudgetItems(items),
          wholeAmount: capTotal,
          financialEntityCards: buildBudgetDataListViews(items, context),
        ),
        
        sidebarItems: const [
          SidebarItem(
            title: 'kjahfkjdfhkjfasasd', 
            value: 'sadasdasdsdsad'
          ),
          SidebarItem(
            title: 'kjahfkjdfhkjfasasd', 
            value: 'sadasdasdsdsad'
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow,
        onPressed: () {},
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


  // void showRating() => showDialog(
  //     context: context,
  //     builder: (BuildContext context) => AlertDialog(
  //         title: const Text('Rate the biker'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             const Text(
  //               'Please leave a star rating',
  //               style: TextStyle(fontSize: 20),
  //             ),
  //             const SizedBox(height: 32),
  //             RatingBar.builder(
  //               initialRating: _rating,
  //               minRating: 1,
  //               direction: Axis.horizontal,
  //               allowHalfRating: true,
  //               itemCount: 5,
  //               itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
  //               itemBuilder: (context, _) => const Icon(
  //                 Icons.star,
  //                 color: Colors.amber,
  //               ),
  //               onRatingUpdate: (value) {
  //                 this._rating = value;
  //               },
  //             )
  //           ],
  //         )));
}
