import 'package:vendor_flutter/BaseBloc/base_bloc.dart';
import 'package:vendor_flutter/UI/Wallet/wallet_event.dart';
import 'package:vendor_flutter/UI/Wallet/wallet_model.dart';
import 'package:vendor_flutter/UI/Wallet/wallet_repository.dart';
import 'package:vendor_flutter/UI/Wallet/wallet_state.dart';
import 'package:vendor_flutter/Utils/preference_utils.dart';

class WalletBloc extends BaseBloc<WalletEvent, WalletState> {
  WalletBloc() : super(WalletState.onInit());

  PreferenceUtils preferenceUtils = PreferenceUtils();

  WalletListRepository walletListRepository = WalletListRepository();

  @override
  void init() {
    super.init();
    onWalletApi();
  }

  @override
  Stream<WalletState> mapEventToState(WalletEvent event) async* {
    if (event is OnWalletApiHit) {
      if (event.transactionModel.statusCode == 1) {
        yield WalletState.onHomeSuccess(true, false, event.transactionModel);
      } else {
        yield WalletState.onHomeFailure(false, true, event.transactionModel);
      }
    }
  }

  void onWalletApi() async {
    try {
      // Future.delayed(Duration(seconds: 2));
      print("sdfcvgbhnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
      TransactionModel transactionModel =
          await walletListRepository.walletApi("");
      print("ProductList Resp value" + transactionModel.toString());
      add(OnWalletApiHit(transactionModel));
    } catch (e) {
      print(e.toString() + "There is something wrong......");
    }
  }
}
