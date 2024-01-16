class Wallet {
  double balance;
  List<Transactions>? transactions;

  Wallet({required this.balance, this.transactions});
}

class Transactions {
  String date;
  String roomName;
  double joiningAmount;

  Transactions({
    required this.date,
    required this.roomName,
    required this.joiningAmount,
  });
}
