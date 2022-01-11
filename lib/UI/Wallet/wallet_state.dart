import 'package:vendor_flutter/UI/Wallet/wallet_model.dart';

class WalletState {
  final bool isSuccess;
  final bool isError;
  final TransactionModel model;

  WalletState._(this.isSuccess, this.isError, this.model);

  WalletState.onHomeSuccess(
      bool isSuccess, bool isError, TransactionModel model)
      : this._(isSuccess, false, model);

  WalletState.onHomeFailure(
      bool isSuccess, bool isError, TransactionModel model)
      : this._(false, isError, model);

  WalletState.onInit() : this._(false, false, TransactionModel());
}
