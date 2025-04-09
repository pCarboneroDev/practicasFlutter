import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practicas_flutter/models/tarjeta_credito.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(PagarState()) {
    on<PagarEvent>((event, emit) {});

    on<OnSeleccionarTarjeta>((event, emit) => emit(state.copyWith(tarjetaActiva: true, tarjeta: event.tarjeta)));
    on<OnDesactivarTarjeta>((event, emit) => emit(state.copyWith(tarjetaActiva: false)));


  }

}
