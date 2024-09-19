import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    on<UpdateProfileImage>(pickImage);
  }

  Future<void> pickImage(UpdateProfileImage event, Emitter<ProfileState> emit) async {
    final ImagePicker imagePicker = ImagePicker();

    try {
      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ProfileImageSelectedSuccess(pickedFile.path));
      } else {
        emit(ProfileImageSelectedFailure("No Image Selected"));
      }
    } catch (e) {
      emit(ProfileImageSelectedFailure('Failed to pick image: $e'));
    }
  }
}
