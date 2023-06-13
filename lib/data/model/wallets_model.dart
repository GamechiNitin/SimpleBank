class WalletModel {
  int? id;
  String? userName;
  String? balance;
  String? walletType;
  Bank? bank;
  List<TransactionModel>? transactionModel;

  WalletModel({
    this.balance,
    this.transactionModel,
    this.userName,
    this.bank,
    this.id,
    this.walletType,
  });
}

class TransactionModel {
  int? id;
  String? date;
  String? transactionStatus;
  String? message;
  String? balance;
  String? amount;
  String? currency;
  TransactionModel({
    this.id,
    this.date,
    this.transactionStatus,
    this.message,
    this.balance,
    this.amount,
    this.currency,
  });
}

class Bank {
  int? id;
  String? bankName;
  String? accountType;
  String? shortBankName;
  String? balance;
  String? lastAmount;
  String? percenttage;
  Bank({
    this.id,
    this.bankName,
    this.accountType,
    this.shortBankName,
    this.balance,
    this.lastAmount,
    this.percenttage,
  });
}
