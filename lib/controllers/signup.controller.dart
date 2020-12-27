import 'package:mvc_mvvm_mobx_masterclass_balta/models/user.model.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/repositories/account.repository.dart';
import 'package:mvc_mvvm_mobx_masterclass_balta/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository accountRepository;

  SignupController() {
    accountRepository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await accountRepository.createAccount(model);
    model.busy = false;

    return user;
  }
}
