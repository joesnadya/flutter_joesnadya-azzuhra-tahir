import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/api/dicebear_api.dart';

part 'dicebear_event.dart';
part 'dicebear_state.dart';

class DicebearBloc extends Bloc<DicebearEvent, DicebearState> {
  DicebearBloc() : super(DicebearInitial()) {
    on<GenerateButtonPressedEvent>((event, emit) async{
      try {
        // ignore: avoid_print
        print("Query Param : ${event.query}");
        // ignore: avoid_print
        print("ArtStyle : ${event.artStyle}");
        emit(DicebearDataLoading());
        final getData = await DicebearApi().getDicebear(
          artStyle: event.artStyle,
          query: event.query
        );
        emit(
          DicebearGetSuccess(
            imageData: getData
          )
        );
        // ignore: avoid_print
        print("GET Berhasil");
      } catch (e) {
        emit(
          const DicebearDataFailed(
            errorMessage: "GET Gagal"
          )
        );
      }
    });

    on<PageChangedDicebearEvent>((event, emit) {
      emit(DicebearInitial());
    });
  }
}