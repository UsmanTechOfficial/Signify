import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/consts/consts.dart';
import '../../../../../infrastructure/dal/models/new_folder.model.dart';

part 'folders_event.dart';
part 'folders_state.dart';

Set<int> selectedTemplates = <int>{};

class FoldersBloc extends Bloc<FoldersEvent, FoldersState> {
  StatusFilters selectedStatusFilter = StatusFilters.all;
  DateFilters selectedDateFilters = DateFilters.all;

  final List<FolderModel> foldersList = [];
  final List<TemplatesModel> templateList = [];

  final List<TemplatesModel> allTemplates = List.generate(
    10,
    (index) =>
        TemplatesModel(name: 'My Template ${index + 1}', desc: DateTime.now().toUtc().toString()),
  );

  FoldersBloc() : super(const FoldersInitialState()) {
    /// [SearchFoldersEvent]
    on<SearchFoldersEvent>(
      (event, emit) async {
        emit(const SearchLoadingState());
        final results = await _fetchSearch(event);

        if (results.isNotEmpty) {
          emit(SearchLoadedState(results));
        } else {
          emit(const SearchErrorState("No results found"));
        }
      },
    );

    /// [StatusFilterSelectionEvent]
    on<StatusFilterSelectionEvent>(
      (event, emit) {
        emit(StatusFilterSelectionState(event.selectedFilter));
      },
    );

    /// [DateFilterSelectionEvent]
    on<DateFilterSelectionEvent>(
      (event, emit) {
        emit(DateFilterSelectionState(event.selectedFilter));
      },
    );

    on<OnNewFolderEvent>(createNewFolder);
  }

  _fetchSearch(SearchFoldersEvent event) async {
    await Future.delayed(const Duration(seconds: 1));

    return ["Folders 1", "Folders 2", "Folders 3"]
        .where((folders) => folders.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
  }

  FutureOr<void> createNewFolder(OnNewFolderEvent event, Emitter<FoldersState> emit) {
    final template = List<TemplatesModel>.generate(
      2,
      (index) {
        return TemplatesModel(name: 'Invoice Temp $index', desc: 'none');
      },
    );
  }
}
