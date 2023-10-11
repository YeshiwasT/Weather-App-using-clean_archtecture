import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_form_event.dart';
part 'signup_form_state.dart';

class SignupFormBloc extends Bloc<SignupFormEvent, SignupForm> {
  SignupFormBloc()
      : super(
          const SignupForm(
            email: '',
            userName: '',
            phoneNumber: '',
            password: '',
          ),
        ) {
    on<ChangeEmailEvent>(_onChangeEmail);
    on<ChangePassEvent>(_onChangePassword);
    on<ChangeUserNameEvent>(_onChangeUserName);
    on<ChangePhoneNumberEvent>(_onChangePhoneNumber);
    on<ChangeUserIdEvent>(_onChangeUserId);
    // on<ChangeDepartmentEvent>(_onChangeDepartment);
    // on<ChangeMajorEvent>(_onChangeMajor);
  }

  void _onChangeEmail(ChangeEmailEvent event, Emitter<SignupForm> emit) async {
    emit(state.copyWith(email: event.email));
  }

  void _onChangeUserName(
      ChangeUserNameEvent event, Emitter<SignupFormState> emit) async {
    emit(state.copyWith(userName: event.userName));
  }

  void _onChangePhoneNumber(
      ChangePhoneNumberEvent event, Emitter<SignupFormState> emit) async {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _onChangeUserId(
      ChangeUserIdEvent event, Emitter<SignupFormState> emit) async {
    emit(state.copyWith(userId: event.userId));
  }

  void _onChangePassword(
      ChangePassEvent event, Emitter<SignupFormState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  // void _onChangeOTP(ChangeOTPEvent event, Emitter<SignupFormState> emit) async {
  //   emit(state.copyWith(otp: event.otp));
  // }
}
