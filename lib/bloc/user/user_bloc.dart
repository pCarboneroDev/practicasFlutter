import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practicas_flutter/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()){
    on<ActivateUser>((event, emit) => emit(UserSetState(event.usuario)));

    on<BorrarUsuario>((event, emit) => emit(const UserInitialState()));

    on<CambiarEdad>((event, emit) {
      if(!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.edad)));
    });

    on<AgregarProfesion>((event, emit) {
      if(!state.existUser) return;
      final profesiones = state.user!.profesiones;
      profesiones.add(event.profesion);
      emit(UserSetState(state.user!.copyWith(profesiones: profesiones)));
    });
  }
}