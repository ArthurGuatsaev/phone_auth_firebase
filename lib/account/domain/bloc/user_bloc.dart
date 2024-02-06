import 'package:bloc/bloc.dart';
import 'package:firebase_regist/account/domain/repositories/user_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _repository;
  UserBloc({required UserRepository repository})
      : _repository = repository,
        super(UserState(user: repository.user)) {
    _repository.authController?.stream.listen(
      (event) {
        if (event['userId'] == false) return;
        add(SaveNewUser(data: event));
      },
    );
    on<UpdateUserEvent>(updateUser);
    on<ReseteUserEvent>(reseteData);
    on<DeleteUserEvent>(deleteUser);
    on<SaveUserEvent>(saveUser);
    on<SaveNewUser>(saveNewUser);
    on<PickPhotoEvent>(pickPhoto);
  }
  updateUser(UpdateUserEvent event, Emitter<UserState> emit) async {
    if (event.id == null) {
      return _repository.authController?.add({'userId': false});
    }
    final user = await _repository.getUser(event.id!);
    emit(state.copyWith(user: user));
  }

  saveUser(SaveUserEvent event, Emitter<UserState> emit) async {
    await _repository.saveUser(event.user);
    add(UpdateUserEvent(id: event.user.userId));
  }

  deleteUser(DeleteUserEvent event, Emitter<UserState> emit) async {
    await _repository.deleteUser(event.user);
    add(UpdateUserEvent());
  }

  reseteData(ReseteUserEvent event, Emitter<UserState> emit) async {
    await _repository.resete();
    add(UpdateUserEvent());
  }

  saveNewUser(SaveNewUser event, Emitter<UserState> emit) async {
    final user = AccountUser(
        lastName: 'Настроить',
        name: 'Настроить',
        userId: event.data['userId'] as String);
    add(SaveUserEvent(user: user));
  }

  pickPhoto(PickPhotoEvent event, Emitter<UserState> emit) async {
    final path =
        await _repository.getNewImage(event.source, state.user!.userId!);
    add(SaveUserEvent(user: state.user!.copyWith(imagePath: path)));
  }
}
