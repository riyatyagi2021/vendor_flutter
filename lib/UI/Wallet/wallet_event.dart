import 'package:vendor_flutter/UI/Wallet/wallet_model.dart';

abstract class WalletEvent {}

class OnWalletApiHit extends WalletEvent {
  TransactionModel transactionModel;
  OnWalletApiHit(this.transactionModel);
}
