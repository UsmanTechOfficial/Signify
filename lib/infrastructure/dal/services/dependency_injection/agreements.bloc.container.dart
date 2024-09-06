import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/core/interfaces/agreements/agreements_repository.dart';
import 'package:dyno_sign/domain/core/usecases/agreements/get_all_agreements_usecase.dart';
import 'package:dyno_sign/infrastructure/dal/doas/agreements/agreements_dao.dart';
import 'package:dyno_sign/infrastructure/dal/services/api_services/api_helper.dart';
import 'package:dyno_sign/presentation/dashboard/views/agreements/bloc/agreements_bloc.dart';

class AgreementsBlocContainer {
  static Future<void> inject() async {
    getIt.registerLazySingleton<AgreementsRepository>(
        () => AgreementsDoa(getIt<ApiHelper>()));

    getIt.registerLazySingleton<GetAllAgreementsUseCase>(
        () => GetAllAgreementsUseCase(getIt<AgreementsRepository>()));

    getIt.registerFactory<AgreementsBloc>(
        () => AgreementsBloc(getIt<GetAllAgreementsUseCase>()));
  }
}
