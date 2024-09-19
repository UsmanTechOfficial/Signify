import 'package:dyno_sign/domain/consts/consts.dart';
import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/presentation/dashboard/views/profile/bloc/profile_bloc.dart';

class ProfileBlocBindings implements Bindings {
  @override
  void dependencies() async {
    getIt.registerFactory<ProfileBloc>(() => ProfileBloc());
  }
}
