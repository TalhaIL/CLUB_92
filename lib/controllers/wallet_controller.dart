import 'package:club_92/models/wallet_model.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  Wallet walletData = Wallet(
    balance: 56.00,
    transactions: [
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'Basics Of User Interface',
        joiningAmount: 9,
      ),
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'World Camera Day | First Camera',
        joiningAmount: 6,
      ),
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'Basics Of User Interface',
        joiningAmount: 12,
      ),
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'World Camera Day | First Camera',
        joiningAmount: 8,
      ),
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'Basics Of User Interface',
        joiningAmount: 9,
      ),
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'World Camera Day | First Camera',
        joiningAmount: 6,
      ),
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'Basics Of User Interface',
        joiningAmount: 12,
      ),
      Transactions(
        date: '20 June, 10.00 am',
        roomName: 'World Camera Day | First Camera',
        joiningAmount: 8,
      )
    ],
  );
}
