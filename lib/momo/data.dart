import 'package:flutter/material.dart';
import 'formatters.dart';

/// Calculates the sum of the primary amounts of a list of [AccountData].
double sumAccountDataPrimaryAmount(List<AccountData> items) =>
    sumOf<AccountData>(items, (item) => item.primaryAmount);

/// Calculates the sum of the primary amounts of a list of [BillData].
double sumBillDataPrimaryAmount(List<BillData> items) =>
    sumOf<BillData>(items, (item) => item.primaryAmount);

/// Calculates the sum of the primary amounts of a list of [BillData].
double sumBillDataPaidAmount(List<BillData> items) => sumOf<BillData>(
      items.where((item) => item.isPaid).toList(),
      (item) => item.primaryAmount,
    );

/// Calculates the sum of the primary amounts of a list of [BudgetData].
double sumBudgetDataPrimaryAmount(List<BudgetData> items) =>
    sumOf<BudgetData>(items, (item) => item.primaryAmount);

/// Calculates the sum of the amounts used of a list of [BudgetData].
double sumBudgetDataAmountUsed(List<BudgetData> items) =>
    sumOf<BudgetData>(items, (item) => item.amountUsed);

/// Utility function to sum up values in a list.
double sumOf<T>(List<T> list, double Function(T elt) getValue) {
  var sum = 0.0;
  for (var elt in list) {
    sum += getValue(elt);
  }
  return sum;
}

/// A data model for an account.
///
/// The [primaryAmount] is the balance of the account in USD.
class AccountData {
  const AccountData({
    required this.name,
    required this.primaryAmount,
    required this.accountNumber,
  });

  /// The display name of this entity.
  final String name;

  /// The primary amount or value of this entity.
  final double primaryAmount;

  /// The full displayable account number.
  final String accountNumber;
}

/// A data model for a bill.
///
/// The [primaryAmount] is the amount due in USD.
class BillData {
  const BillData({
    required this.name,
    required this.primaryAmount,
    required this.dueDate,
    this.isPaid = false,
  });

  /// The display name of this entity.
  final String name;

  /// The primary amount or value of this entity.
  final double primaryAmount;

  /// The due date of this bill.
  final String dueDate;

  /// If this bill has been paid.
  final bool isPaid;
}

/// A data model for a budget.
///
/// The [primaryAmount] is the budget cap in USD.
class BudgetData {
  const BudgetData({
    required this.name,
    required this.primaryAmount,
    required this.amountUsed,
  });

  /// The display name of this entity.
  final String name;

  /// The primary amount or value of this entity.
  final double primaryAmount;

  /// Amount of the budget that is consumed or used.
  final double amountUsed;
}

/// A data model for an alert.
class AlertData {
  AlertData({this.message, this.iconData});

  /// The alert message to display.
  final String? message;

  /// The icon to display with the alert.
  final IconData? iconData;
}

class DetailedEventData {
  const DetailedEventData({
    required this.title,
    required this.date,
    required this.amount,
  });

  final String title;
  final DateTime date;
  final double amount;
}

/// A data model for data displayed to the user.
class UserDetailData {
  UserDetailData({
    required this.title,
    required this.value,
  });

  /// The display name of this entity.
  final String title;

  /// The value of this entity.
  final String value;
}

/// A data model for data displayed to the user.
class ProviderDetailData {
  ProviderDetailData({
    required this.title,
    required this.value,
  });

  /// The display name of this entity.
  final String title;

  /// The value of this entity.
  final String value;
}

/// Class to return dummy data lists.
///
/// In a real app, this might be replaced with some asynchronous service.
class DummyDataService {
  static List<AccountData> getAccountDataList(BuildContext context) {
    return <AccountData>[
      const AccountData(
        name: 'Bike 307',
        primaryAmount: 500,
        accountNumber: '1234561234',
      ),
      const AccountData(
        name: 'Bike 237',
        primaryAmount: 850,
        accountNumber: '8888885678',
      ),
      // const AccountData(
      //   name: 'Bike 937',
      //   primaryAmount: 250,
      //   accountNumber: '8888885678',
      // ),
    ];
  }

  static List<UserDetailData> getAccountDetailList(BuildContext context) {
    return <UserDetailData>[
      UserDetailData(
        title: 'localizations.rallyAccountDetailDataAnnualPercentageYield',
        value: percentFormat(context).format(0.001),
      ),
      UserDetailData(
        title: 'localizations.rallyAccountDetailDataInterestRate',
        value: usdWithSignFormat(context).format(1676.14),
      ),
      UserDetailData(
        title: 'localizations.rallyAccountDetailDataInterestYtd',
        value: usdWithSignFormat(context).format(81.45),
      ),
      UserDetailData(
        title: 'localizations.rallyAccountDetailDataInterestPaidLastYear',
        value: usdWithSignFormat(context).format(987.12),
      ),
      UserDetailData(
        title: 'localizations.rallyAccountDetailDataNextStatement',
        value: '25 December 2023',
      ),
      UserDetailData(
        title: 'Name',
        value: 'Philip Cao',
      ),
    ];
  }

  static List<DetailedEventData> getDetailedEventItems() {
    return <DetailedEventData>[
      DetailedEventData(
        title: 'Bepanda - Bonamoussadi',
        date: DateTime.utc(2023, 1, 24),
        amount: -250,
      ),
      DetailedEventData(
        title: 'Kotto - Pk14',
        date: DateTime.utc(2023, 1, 5),
        amount: -500,
      ),
      DetailedEventData(
        title: 'Bepanda - Bonamoussadi',
        date: DateTime.utc(2023, 1, 24),
        amount: -250,
      ),
      DetailedEventData(
        title: 'Kotto - Pk14',
        date: DateTime.utc(2023, 1, 5),
        amount: -500,
      ),
    ];
  }

  static List<BillData> getBillDataList(BuildContext context) {
    return <BillData>[
      const BillData(
        name: 'Name',
        primaryAmount: 45.36,
        dueDate: 'NFOR CARLTON MBUNWE',
      ),
      const BillData(
        name: 'Matricule',
        primaryAmount: 45.36,
        dueDate: 'Bike 237',
      ),
      const BillData(
        name: 'Entreprise',
        primaryAmount: 1200,
        dueDate: '....8768',
        isPaid: true,
      ),
      const BillData(
        name: 'Telephone',
        primaryAmount: 87.33,
        dueDate: '..65565',
      ),
      const BillData(
        name: 'Syndicat',
        primaryAmount: 400,
        dueDate: '..65465',
      ),
      const BillData(
        name: 'Region',
        primaryAmount: 87.33,
        dueDate: 'Littoral',
      ),
      const BillData(
        name: 'Subdivision',
        primaryAmount: 400,
        dueDate: 'lorem ipsum dolore',
      ),
    ];
  }

  static List<UserDetailData> getBillDetailList(BuildContext context,
      {required double dueTotal, required double paidTotal}) {
    // final localizations = GalleryLocalizations.of(context)!;
    return <UserDetailData>[
      UserDetailData(
        title: 'Transport',
        value: usdWithSignFormat(context).format(paidTotal + dueTotal),
      ),
    ];
  }

  static List<BudgetData> getBudgetDataList(BuildContext context) {
    // final localizations = GalleryLocalizations.of(context)!;
    return <BudgetData>[

    ];
  }

  static List<UserDetailData> getBudgetDetailList(BuildContext context,
      {required double capTotal, required double usedTotal}) {
    // final localizations = GalleryLocalizations.of(context)!;
    return <UserDetailData>[
      UserDetailData(
        title: 'localizations.rallyBudgetDetailTotalCap',
        value: usdWithSignFormat(context).format(capTotal),
      ),
    ];
  }

    static List<ProviderDetailData> getProvidersDetailList(BuildContext context,
      {required double capTotal, required double usedTotal}) {
    return <ProviderDetailData>[
      ProviderDetailData(
        title: 'localizations.rallyBudgetDetailTotalCap',
        value: usdWithSignFormat(context).format(capTotal),
      ),
      ProviderDetailData(
        title: 'localizations.rallyBudgetDetailAmountUsed',
        value: usdWithSignFormat(context).format(usedTotal),
      ),
      ProviderDetailData(
        title: 'localizations.rallyBudgetDetailAmountLeft',
        value: usdWithSignFormat(context).format(capTotal - usedTotal),
      ),
    ];
  }

  static List<String> getSettingsTitles(BuildContext context) {
    // final localizations = GalleryLocalizations.of(context)!;
    return <String>[
      'Fournir mon compte',
      'Documents fiscaux',
      'Code secret et fonctionalité Momo +',
      'Notifications',
      'Modifier mon profil',
      'Parametres sans papiers',
      'Contacter une personne de confiance',
      'Aide',
      'Se deconnecter',
    ];
  }

  static List<AlertData> getAlerts(BuildContext context) {
    return <AlertData>[
      AlertData(
        message: 'Vous avez effectué une nouvelle transaction sur votre compte MoMo. Veuillez vérifier votre compte pour confirmer la transaction',
        iconData: Icons.sort,
      ),
    ];
  }
}
