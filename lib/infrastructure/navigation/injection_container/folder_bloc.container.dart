import 'package:dyno_sign/presentation/blocs.dart';

import '../../../domain/consts/global_var.dart';

class FoldersBlocContainer {
  static inject() async {
    getIt.registerFactory<FoldersBloc>(() => FoldersBloc());
  }
}
