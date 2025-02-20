import 'package:dyno_sign/domain/core/interfaces/bindings.dart';

import '../../../../domain/consts/consts.dart';
import '../../../../domain/core/interfaces/agreements/agreements_repository.dart';
import '../../../../domain/core/usecases/agreements/get_all_agreements_usecase.dart';
import '../../../../presentation/dashboard/views/agreements/bloc/agreements_bloc.dart';
import '../../../dal/doas/agreements/agreements_dao.dart';
import '../../../dal/services/api_services/api_helper.dart';

class AgreementsBlocBindings implements Bindings {
  @override
  void dependencies() {
    getIt.registerLazySingleton<AgreementsRepository>(
      () => AgreementsDoa(getIt<ApiHelper>()),
    );

    getIt.registerLazySingleton<GetAllAgreementsUseCase>(
      () => GetAllAgreementsUseCase(getIt<AgreementsRepository>()),
    );

    getIt.registerFactory<AgreementsBloc>(
      () => AgreementsBloc(getIt<GetAllAgreementsUseCase>()),
    );
  }
}
