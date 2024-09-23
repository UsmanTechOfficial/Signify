part of 'for_me_assign_fields_bloc.dart';

sealed class ForMeAssignFieldsEvent extends Equatable {
  const ForMeAssignFieldsEvent();

  @override
  List<Object?> get props => [];
}

class DocumentPreviewRequested extends ForMeAssignFieldsEvent {
  const DocumentPreviewRequested();

  @override
  List<Object> get props => [];
}

class DocumentSelected extends ForMeAssignFieldsEvent {
  final int index;

  const DocumentSelected(this.index);

  @override
  List<Object> get props => [index];
}
