import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/enum/authenum.dart';
import 'package:oruphones/core/singleton/usersingleton.dart';
import 'package:oruphones/helper/hive.dart';
import 'package:oruphones/model/auth/createotp.dart';
import 'package:oruphones/model/auth/user.dart';
import 'package:oruphones/repository/auth_repo/authrepo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  final HiveService _hiveService;
  AuthBloc(this._authRepo, this._hiveService) : super(AuthInitial()) {
    on<CreateOTPEvent>(_createOtp);
    on<VerifyOTPEvent>(_verifyOtp);
    on<UpdateUserNameEvent>(_updateUserName);
    on<UpdateUserEvent>(_updateUser);
    on<LogOutEvent>(_logOut);
  }

  Future<void> _createOtp(CreateOTPEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState(laodingSource: AuthENUM.createOTP));
    try {
      final otpResponse = await _authRepo.createOtp(event.data);
      emit(AuthOTPResponseState(otpResponse: otpResponse));
    } catch (e) {
      emit(
        AuthErrorState(
          errorMessage: e.toString(),
          errorSource: AuthENUM.createOTP,
        ),
      );
    }
  }

  Future<void> _verifyOtp(VerifyOTPEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState(laodingSource: AuthENUM.verifyOTP));
    try {
      print("CALL VERIFY OTP");
      final response = await _authRepo.validateOTP(event.data);
      //call the isloggedin endpoint -> get X-Csrf-token -> store in singleton
      final responseWithCsrf = await _authRepo.isLoggedIn(response.cookie!);

      UserSingleton(
        userName: responseWithCsrf.userName,
        mobileNumber: responseWithCsrf.mobileNumber,
        createdDate: responseWithCsrf.createdDate,
        isAccountExpired: responseWithCsrf.isAccountExpired,
        waOptIn: responseWithCsrf.waOptIn,
        cookie: responseWithCsrf.cookie!,
        crsfToken: responseWithCsrf.csrfToken!,
      );
      if (responseWithCsrf.userExist!) {
        _hiveService.save(responseWithCsrf);
        emit(AuthSuccessState(successSource: AuthENUM.userExist));
      } else {
        emit(AuthSuccessState(successSource: AuthENUM.newUser));
      }
    } catch (e) {
      print(e.toString());
      emit(
        AuthErrorState(
          errorMessage: e.toString(),
          errorSource: AuthENUM.verifyOTP,
        ),
      );
    }
  }

  Future<void> _updateUserName(
      UpdateUserNameEvent event, Emitter<AuthState> emit) async {
    emit(
      AuthLoadingState(laodingSource: AuthENUM.updataName),
    );

    try {
      final response = await _authRepo.updateUserName(event.name);
      print(response);
      final user = UserSingleton.user;
      user!.userName = event.name;
      final saveUser = User(
          userName: user.userName,
          mobileNumber: user.mobileNumber,
          isAccountExpired: user.isAccountExpired,
          createdDate: user.createdDate,
          waOptIn: user.waOptIn);
      _hiveService.save(saveUser);

      emit(AuthSuccessState(successSource: AuthENUM.updataName));
    } catch (e) {
      emit(
        AuthErrorState(
          errorMessage: e.toString(),
          errorSource: AuthENUM.updataName,
        ),
      );
    }
  }

  Future<void> _updateUser(
      UpdateUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState(laodingSource: AuthENUM.updateUser));
    try {
      final currentUser = _hiveService.user;

      final updatedUserData = await _authRepo.isLoggedIn(currentUser.cookie!);

      UserSingleton(
        userName: updatedUserData.userName,
        mobileNumber: updatedUserData.mobileNumber,
        createdDate: updatedUserData.createdDate,
        isAccountExpired: updatedUserData.isAccountExpired,
        waOptIn: updatedUserData.waOptIn,
        cookie: updatedUserData.cookie!,
        crsfToken: updatedUserData.csrfToken!,
      );

      _hiveService.save(updatedUserData);

      emit(AuthSuccessState(successSource: AuthENUM.updateUser));
    } catch (e) {
      emit(
        AuthErrorState(
          errorMessage: e.toString(),
          errorSource: AuthENUM.updataName,
        ),
      );
    }
  }

  //logout
  Future<void> _logOut(LogOutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState(laodingSource: AuthENUM.logout));
    try {
      final response = await _authRepo.logOut();
      print(response);
      UserSingleton.clear();
      await _hiveService.clear();
      emit(AuthSuccessState(successSource: AuthENUM.logout));
    } catch (e) {
      print("ERROR ${e.toString()}");
      AuthErrorState(
        errorMessage: e.toString(),
        errorSource: AuthENUM.logout,
      );
    }
  }
}
