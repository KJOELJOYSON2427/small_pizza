import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:small_pizza/features/auth/data/datasorces/auth_remote_data_source.dart';
import 'package:small_pizza/features/auth/data/datasorces/auth_remote_data_source_impl.dart';
import 'package:small_pizza/features/auth/data/datasorces/cloudinary_remote_data_source.dart';
import 'package:small_pizza/features/auth/data/datasorces/cloudinary_remote_data_sourceImpl.dart';
import 'package:small_pizza/features/auth/data/datasorces/user_profile_remote_data_source.dart';
import 'package:small_pizza/features/auth/data/datasorces/user_profile_remote_data_source_impl.dart';

import 'package:small_pizza/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:small_pizza/features/auth/data/repositories/cloudinary_repository_impl.dart';
import 'package:small_pizza/features/auth/data/repositories/user_profile_repository_impl.dart';
import 'package:small_pizza/features/auth/domain/repositories/auth_repository.dart';
import 'package:small_pizza/features/auth/domain/repositories/cloudinary_repository.dart';
import 'package:small_pizza/features/auth/domain/repositories/user_profile_repository.dart';
import 'package:small_pizza/features/auth/domain/usecases/auth_state_changes_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/create_user_profile_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/ensure_user_profile_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/login_with_facebook_usecase.dart'; // ← Already there, good
import 'package:small_pizza/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/logout_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/register_with_email_usecase.dart';
import 'package:small_pizza/features/auth/domain/usecases/update_user_profile_usecase.dart';
import 'package:small_pizza/features/auth/presentation/bloc/UserProfileBloc/user_profile_bloc.dart';
import 'package:small_pizza/features/auth/presentation/bloc/login_bloc.dart';
import 'package:small_pizza/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:small_pizza/features/auth/presentation/bloc/splash/splash_bloc.dart';
import 'package:small_pizza/features/food/data/datasorces/food_mock_datasource.dart';
import 'package:small_pizza/features/food/data/datasorces/food_mock_datasource_impl.dart';
import 'package:small_pizza/features/food/data/repositories/food_repository_impl.dart';
import 'package:small_pizza/features/food/domain/repositories/food_repository.dart';
import 'package:small_pizza/features/food/domain/usecases/get_popular_foods.dart';
import 'package:small_pizza/features/food/domain/usecases/get_recent_foods.dart';
import 'package:small_pizza/features/home/presentation/bloc/home_header/home_header_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_food/popular_foods_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_restaurants/popular_restaurants_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/recent_items/recent_food_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:small_pizza/features/restaurent/data/datasorces/restaurant_mock_datasource.dart';
import 'package:small_pizza/features/restaurent/data/datasorces/restaurant_mock_datasource_impl.dart';
import 'package:small_pizza/features/restaurent/data/repositories/restaurant_repository_impl.dart';
import 'package:small_pizza/features/restaurent/domain/repositories/restaurant_repository.dart';
import 'package:small_pizza/features/restaurent/domain/usecases/get_home_restaurants_usecase.dart';
import 'package:small_pizza/features/restaurent/domain/usecases/get_popular_restaurants_usecase.dart';
import 'package:small_pizza/features/restaurent/domain/usecases/get_popular_restaurants_with_page.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_restaurants/popular_restaurants_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // ── 1. External ───────────────────────────────────────────────
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  sl.registerLazySingleton<FacebookAuth>(() => FacebookAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Cloudinary
  sl.registerLazySingleton<CloudinaryPublic>(
    () => CloudinaryPublic(
      dotenv.env['CLOUDINARY_CLOUD_NAME']!,
      dotenv.env['CLOUDINARY_UPLOAD_PRESET']!,
      cache: false,
    ),
  );

  // Data Sources
  sl.registerLazySingleton<CloudinaryRemoteDataSource>(
    () => CloudinaryRemoteDataSourceImpl(sl<CloudinaryPublic>()),
  );
  sl.registerLazySingleton<RestaurantDataSource>(
    () => RestaurantMockDataSource(),
  );

  sl.registerLazySingleton<FoodMockDataSource>(() => FoodMockDatasourceImpl());
  // ── 2. Data Sources ───────────────────────────────────────────
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      sl<FirebaseAuth>(),
      sl<GoogleSignIn>(),
      sl<FacebookAuth>(),
    ),
  );

  sl.registerLazySingleton<UserProfileRemoteDataSource>(
    () => UserProfileRemoteDataSourceImpl(
      sl<FirebaseFirestore>(),
      cloudinaryRepository: sl(),
    ),
  );

  // ── 3. Repositories ───────────────────────────────────────────
  // Repositories
  sl.registerLazySingleton<CloudinaryRepository>(
    () => CloudinaryRepositoryImpl(sl<CloudinaryRemoteDataSource>()),
  );
  sl.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(sl<RestaurantDataSource>()),
  );

  sl.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(sl<FoodMockDataSource>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()),
  );

  sl.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(sl<UserProfileRemoteDataSource>()),
  );

  // ── 4. Use Cases  (MUST come before Blocs!) ───────────────────
  sl.registerLazySingleton<RegisterWithEmailUseCase>(
    () => RegisterWithEmailUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LoginWithEmailUseCase>(
    () => LoginWithEmailUseCase(sl<AuthRepository>()),
  );
  sl.registerLazySingleton<GetHomeRestaurantsUseCase>(
    () => GetHomeRestaurantsUseCase(sl<RestaurantRepository>()),
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

  sl.registerLazySingleton<CreateUserProfileUseCase>(
    () => CreateUserProfileUseCase(sl<UserProfileRepository>()),
  );

  sl.registerLazySingleton<EnsureUserProfileUseCase>(
    () => EnsureUserProfileUseCase(sl<UserProfileRepository>()),
  );

  sl.registerLazySingleton<GetUserProfileUseCase>(
    () => GetUserProfileUseCase(sl<UserProfileRepository>()),
  );

  sl.registerLazySingleton<UpdateUserProfileUseCase>(
    () => UpdateUserProfileUseCase(sl<UserProfileRepository>()),
  );

  sl.registerLazySingleton<GetPopularRestaurantsUseCase>(
    () => GetPopularRestaurantsUseCase(sl<RestaurantRepository>()),
  );

  sl.registerLazySingleton<GetPopularFoodsUseCase>(
    () => GetPopularFoodsUseCase(sl<FoodRepository>()),
  );

   sl.registerLazySingleton<GetRecentFoodsUseCase>(
    () => GetRecentFoodsUseCase(sl<FoodRepository>()),
  );
  
  sl.registerLazySingleton<GetPopularRestaurantsWithPageUseCase>(
  () => GetPopularRestaurantsWithPageUseCase(sl<RestaurantRepository>()),
);


  // ── 5. Blocs (last!) ──────────────────────────────────────────
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(
      loginWithEmail: sl<LoginWithEmailUseCase>(),
      loginWithGoogle: sl<LoginWithGoogleUseCase>(),
      loginWithFacebook: sl<LoginWithFacebookUseCase>(),
      ensureUserProfileUseCase: sl<EnsureUserProfileUseCase>(),
      getUserProfileUseCase: sl<GetUserProfileUseCase>(),
    ),
  );

  sl.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      sl<RegisterWithEmailUseCase>(),
      // If you later add more dependencies → add them here
    ),
  );

  sl.registerFactory<SplashBloc>(
    () => SplashBloc(authStateChangesUseCase: sl<AuthStateChangesUseCase>()),
  );
  sl.registerFactory<UserProfileBloc>(
    () => UserProfileBloc(
      sl<CreateUserProfileUseCase>(),
      // add others if needed (update, get, etc.)
    ),
  );
  sl.registerFactory<HomeHeaderBloc>(() => HomeHeaderBloc());
  

    sl.registerFactory<SearchBloc>(() => SearchBloc());

     sl.registerFactory<PopularRestaurantsBloc>(() => PopularRestaurantsBloc(sl<GetPopularRestaurantsUseCase>()));


    sl.registerFactory<PopularFoodsBloc>(() => PopularFoodsBloc(sl<GetPopularFoodsUseCase>()));
   
    sl.registerFactory<RecentFoodsBloc>(() => RecentFoodsBloc(sl<GetRecentFoodsUseCase>()));
   
      sl.registerFactory<PopularRestaurantsWithPageBloc>(() => PopularRestaurantsWithPageBloc(sl<GetPopularRestaurantsWithPageUseCase>()));

}
