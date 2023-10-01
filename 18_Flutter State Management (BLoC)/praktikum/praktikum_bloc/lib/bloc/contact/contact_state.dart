import 'package:praktikum_bloc/screen/contact_screen.dart';

abstract class ContactState {}

// State awal ketika kontak belum dimuat
class InitiateContactState extends ContactState {}

// State yang menunjukkan proses pengambilan atau pengiriman data sedang berlangsung
class LoadingContactState extends ContactState {}

// State yang menunjukkan kegagalan dalam pengambilan atau pengiriman data dengan pesan kesalahan
class FailedContactState extends ContactState {
  final String msg;

  FailedContactState({
    required this.msg,
  });
}

// State yang menunjukkan keberhasilan dalam pengambilan atau pengiriman data dengan data yang diterima
class SuccessContactState extends ContactState {
  final Contact data;

  SuccessContactState({
    required this.data,
  });
}

// State yang menunjukkan kontak sedang dalam proses pengeditan
class EditContactState extends ContactState {
  final Contact data;
  final int index;

  EditContactState({
    required this.data,
    required this.index,
  });
}

// State yang menunjukkan kontak sedang dalam proses penghapusan
class DeleteContactState extends ContactState {
  final int index;

  DeleteContactState({
    required this.index,
  });
}
