import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/api/text_api.dart';
import '../../../models/text_model.dart';

part 'text_event.dart';
part 'text_state.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextInitial()) {
    on<PutTextEvent>((event, emit) async {
      try {
        emit(TextDataLoading());
        final putData = await TextApi().putText(event.textItem);
        emit(
          TextPutSuccess(
            textData: putData
          )
        );
        // ignore: avoid_print
        print("PUT Berhasil");
      } catch (e) {
        emit(
          const TextDataFailed(
            errorMessage: "PUT Berhasil"
          )
        );
      }
    });
  }
}