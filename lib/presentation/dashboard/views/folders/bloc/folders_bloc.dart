import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../infrastructure/dal/models/new_folder.model.dart';
import '../../../widgets/filters.dart';

part 'folders_event.dart';

part 'folders_state.dart';

class FoldersBloc extends Bloc<FoldersEvent, FoldersState> {
  StatusFilters selectedStatusFilter = StatusFilters.all;
  DateFilters selectedDateFilters = DateFilters.all;

  final List<NewFolderModel> foldersList = [];

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
        return TemplatesModel(name: 'Invoice Temp $index', description: 'none');
      },
    );
    final folder = NewFolderModel(name: event.folderName.name, slug: 'Amir', templates: template);

    emit(CreateFolderState(folder));
  }
}
