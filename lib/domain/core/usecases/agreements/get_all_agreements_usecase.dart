import 'package:dyno_sign/domain/core/interfaces/agreements/agreements_repository.dart';
import 'package:dyno_sign/infrastructure/dal/models/docs_model.dart';

class GetAllAgreementsUseCase {
  final AgreementsRepository _agreementsRepository;

  GetAllAgreementsUseCase(this._agreementsRepository);

  Future<List<DocsModel>> execute() async {
    return await _agreementsRepository.getAllAgreements();
  }
}
