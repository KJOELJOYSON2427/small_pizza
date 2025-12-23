import '../../domain/entities/user_entity.dart';



class UserModel extends UserEntity{

  const  UserModel({
    required super.id,
    required super.email,
    super.name,
    super.photoUrl,
     required super.isEmailVerified,
  });

   /// 🔥 Factory from Firebase User
   /// 
   factory UserModel.fromFirebaseUser(user){
    return UserModel(
      id: user.uid,
       email: user.email ?? '',
       name: user.displayName,
        photoUrl: user.photoURL,
        isEmailVerified: user.emailVerified,
      );
   }
}