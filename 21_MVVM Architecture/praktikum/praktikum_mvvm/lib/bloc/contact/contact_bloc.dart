import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_mvvm/models/api/contact_api.dart';

import '../../../models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<PostContactEvent>((event, emit) async{
      try {
        emit(ContactDataLoading());
        final postData = await ContactApi().postContact(event.contactItem);
        emit(
          ContactPostSuccess(
            contactData: postData
          )
        );
        // ignore: avoid_print
        print("POST Berhasil");
      } catch (e) {
        emit(
          const ContactDataFailed(
            errorMessage: "POST Gagal"
          )
        );
      }
    });

    on<GetContactEvent>((event, emit) async{
      try {
        emit(ContactDataLoading());
        final getData = await ContactApi().getContact();
        emit(
          ContactGetSuccess(
            contactData: getData
          )
        );
        // ignore: avoid_print
        print("GET Berhasil");
      } catch (e) {
        emit(
          const ContactDataFailed(
            errorMessage: "GET Gagal"
          )
        );
      }
    });
  }
}