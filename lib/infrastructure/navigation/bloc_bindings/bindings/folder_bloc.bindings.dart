import 'package:dyno_sign/domain/core/interfaces/bindings.dart';
import 'package:dyno_sign/presentation/blocs.dart';

import '../../../../domain/consts/global_var.dart';

class FoldersBlocBindings implements Bindings {
  @override
  void dependencies() async {
    getIt.registerFactory<FoldersBloc>(() => FoldersBloc());
  }
}
