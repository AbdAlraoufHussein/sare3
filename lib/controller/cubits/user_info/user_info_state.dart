part of 'user_info_cubit.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}
final class UserInfoLoading extends UserInfoState {}
final class UserInfoFetched extends UserInfoState {
  final AuthInfoModel userInfo;

  UserInfoFetched({required this.userInfo});
}
final class UserInfoFailure extends UserInfoState {
  final String errorMessage;

  UserInfoFailure({required this.errorMessage});
}
