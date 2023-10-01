import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_bloc/bloc/contact/contact_event.dart';
import 'package:praktikum_bloc/bloc/contact/contact_state.dart';

// Deklarasi kelas ContactBloc yang merupakan BLoC
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  // Constructor untuk ContactBloc
  ContactBloc() : super(InitiateContactState()) {
    // Meng-handle event SubmitContactEvent
    on<SubmitContactEvent>(((event, emit) {
      emit(LoadingContactState());  // Emit state LoadingContactState
      emit(SuccessContactState(
        data: event.data,
      ));  // Emit state SuccessContactState dengan data yang diterima dari event
    }));

    // Meng-handle event EditContactEvent
    on<EditContactEvent>(((event, emit) {
      emit(EditContactState(
        data: event.data,
        index: event.index,
      ));  // Emit state EditContactState dengan data yang diterima dari event
    }));

    // Meng-handle event DeleteContactEvent
    on<DeleteContactEvent>(((event, emit) {
      emit(DeleteContactState(
        index: event.index,
      ));  // Emit state DeleteContactState dengan index yang diterima dari event
    }));
  }
}
