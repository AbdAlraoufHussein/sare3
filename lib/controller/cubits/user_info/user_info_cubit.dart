import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wael/core/services/authentication_service.dart';
import 'package:wael/data/model/api/models/auth_info_model.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoInitial());
  void getuserInfo()async{
    emit(UserInfoLoading());
    try {
      final userInfo = await AuthenticationService.getUserInfo();
      emit(UserInfoFetched(userInfo: userInfo));
    } catch (e) {
      emit(UserInfoFailure(errorMessage: e.toString()));
    }
  }
}
