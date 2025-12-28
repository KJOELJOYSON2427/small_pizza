import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:small_pizza/features/auth/domain/entities/user_profile_entity.dart';
import 'package:small_pizza/features/auth/domain/usecases/create_user_profile_usecase.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final CreateUserProfileUseCase createUserProfileUseCase;

  UserProfileBloc(this.createUserProfileUseCase) : super(UserProfileInitial()) {
    on<CreateUserProfileEvent>(_onCreateProfile);
  }

  Future<void> _onCreateProfile(
    CreateUserProfileEvent event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(UserProfileLoading());

    try {
      await createUserProfileUseCase.call(event.profile);
      emit(UserProfileCreated());
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }
}
