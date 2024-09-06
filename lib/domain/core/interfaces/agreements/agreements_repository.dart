import 'package:dyno_sign/infrastructure/dal/models/docs_model.dart';

abstract class AgreementsRepository {
  Future<List<DocsModel>> getAllAgreements();
}
