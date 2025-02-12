import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/enum/authenum.dart';
import 'package:oruphones/helper/hive.dart';
import 'package:oruphones/model/auth/createotp.dart';
import 'package:oruphones/repository/auth_repo/authrepo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  final HiveService _hiveService;
  AuthBloc(this._authRepo, this._hiveService) : super(AuthInitial()) {
    on<CreateOTPEvent>(_createOtp);
    on<VerifyOTPEvent>(_verifyOtp);
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
      //save the data in hive
      _hiveService.save(response);
      emit(AuthSuccessState());
      //isloggedIn ->get CSRF tokken [http://40.90.224.241:5000/isLoggedIn]
      //update name [http://40.90.224.241:5000/update]
    } catch (e) {
      emit(
        AuthErrorState(
          errorMessage: e.toString(),
          errorSource: AuthENUM.verifyOTP,
        ),
      );
    }
  }
}
