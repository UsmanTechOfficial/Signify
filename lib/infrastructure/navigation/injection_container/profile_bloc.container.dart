import 'package:dyno_sign/domain/consts/consts.dart';
import 'package:dyno_sign/presentation/dashboard/views/profile/bloc/profile_bloc.dart';

class ProfileBlocContainer {
  static inject() async {
    getIt.registerFactory<ProfileBloc>(() => ProfileBloc());
  }
}
