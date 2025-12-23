import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:small_pizza/features/auth/data/datasorces/auth_remote_data_source.dart';
import 'package:small_pizza/features/auth/data/datasorces/auth_remote_data_source_impl.dart';

import 'package:small_pizza/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:small_pizza/features/auth/domain/repositories/auth_repository.dart';
import 'package:small_pizza/features/auth/domain/usecases/auth_state_changes_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/login_with_facebook_usecase.dart'; // ← Already there, good
import 'package:small_pizza/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/logout_usecase.dart';
import 'package:small_pizza/features/auth/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ===================== External =====================
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  sl.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);

  // ===================== Data Source =====================
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      sl<FirebaseAuth>(),
      sl<GoogleSignIn>(),
      sl<FacebookAuth>(),
    ),
  );

  // ===================== Repository =====================
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()),
  );

  // ===================== Use Cases =====================
  // Register ALL use cases BEFORE the bloc
  sl.registerLazySingleton<LoginWithEmailUseCase>(
    () => LoginWithEmailUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LoginWithFacebookUseCase>(
    () => LoginWithFacebookUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<AuthStateChangesUseCase>(
    () => AuthStateChangesUseCase(sl<AuthRepository>()),
  );

  // ===================== Bloc =====================
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginWithEmail: sl<LoginWithEmailUseCase>(),
      loginWithGoogle: sl<LoginWithGoogleUseCase>(),
      loginWithFacebook: sl<LoginWithFacebookUseCase>(), // ← Now safe!
    ),
  );
}
