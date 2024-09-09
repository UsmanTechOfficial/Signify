import '../../../domain/consts/consts.dart';
import '../../../presentation/dashboard/views/home/bloc/home_bloc.dart';

class HomeBlocContainer {
  static inject() async {
    getIt.registerFactory<HomeBloc>(() => HomeBloc());
  }
}
