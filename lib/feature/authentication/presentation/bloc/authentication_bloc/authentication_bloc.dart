import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart' hide UserCredential;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_clean_archtecture/core/error/error.dart';
import 'package:test_clean_archtecture/core/error/failure.dart';
import 'package:test_clean_archtecture/core/usecase/usecase.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/entites/entities.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/usecase/login_usecase.dart';
import 'package:test_clean_archtecture/feature/authentication/domain/usecase/signup_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignupUsecase signupUsecase;
  final LoginUsecase loginUsecase;

  AuthenticationBloc({
    required this.signupUsecase,
    required this.loginUsecase,
  }) : super(AuthenticationInitial()) {
    on<SignupEvent>(_onSignup);
    on<LoginEvent>(_onLogin);
  }

  void _onSignup(SignupEvent event, Emitter<AuthenticationState> emit) async {
    print("object hellloooooo");
    emit(const SignupState(status: AuthStatus.loading));
    final failureOrSignup = await signupUsecase(
      SignupParams(
        email: event.email,
        password: event.password,
        firstName: event.firstName,
        lastName: event.lastName,
        // otp: event.otp,
      ),
    );
    emit(_eitherSignupOrFailure(failureOrSignup));
  }

  AuthenticationState _eitherSignupOrFailure(
      Either<Failure, UserCredential> failureOrSignup) {
    final res = failureOrSignup.fold(
        (l) => SignupState(
              status: AuthStatus.error,
              errorMessage: _mapLoginFailureToMessage(l),
            ),
        (r) => SignupState(
              status: AuthStatus.loaded,
              userCredential: r,
            ));
    print("objectlll");
    print(res.userCredential?.firstName);
    return res;
  }

  void _onLogin(LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(const LoggedInState(status: AuthStatus.loading));
    final failureOrUserCredential = await loginUsecase(
      LoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    emit(_eitherLoginOrError(failureOrUserCredential));
  }

  AuthenticationState _eitherLoginOrError(
      Either<Failure, UserCredential> failureOrUserCredential) {
    return failureOrUserCredential.fold(
      (failure) => LoggedInState(
        status: AuthStatus.error,
        errorMessage: _mapLoginFailureToMessage(failure),
      ),
      (userCredential) => LoggedInState(
        status: AuthStatus.loaded,
        userCredential: userCredential,
      ),
    );
  }

  String _mapLoginFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return loginFailureMessage;
      case NetworkFailure:
        return networkFailureMessage;
      case CacheFailure:
        return loginCacheFailureMessage;
      default:
        return unknownFailureMessage;
    }
  }

  String _mapSignupFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return signupFailureMessage;
      case CacheFailure:
        return signupCacheFailureMessage;
      case NetworkFailure:
        return networkFailureMessage;
      default:
        return unknownFailureMessage;
    }
  }
}
