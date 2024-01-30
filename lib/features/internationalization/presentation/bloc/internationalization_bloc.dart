import 'package:equatable/equatable.dart';

import 'package:flutter_all_topics/core/errors/error_message.dart';
import 'package:flutter_all_topics/core/usecase/usecase.dart';
import 'package:flutter_all_topics/features/internationalization/domain/entities/language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/check_locale_language.dart';
import 'package:flutter_all_topics/features/internationalization/domain/usecases/set_locale_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internationalization_event.dart';
part 'internationalization_state.dart';

class InternationalizationBloc
    extends Bloc<InternationalizationEvent, InternationalizationState> {
  final SetLocaleLanguage setLocaleLanguage;
  final CheckLocaleLanguage checkLocaleLanguage;

  InternationalizationBloc({
    required this.setLocaleLanguage,
    required this.checkLocaleLanguage,
  }) : super(const InternationalizationInitialState(language: null)) {
    on<InternationalizationSetEvent>((event, emit) async {
      emit(InternationalizationChangingState(language: state.language));
      final failureOrLanguage = await setLocaleLanguage(
        Language(languageCode: event.languageCode),
      );
      failureOrLanguage.fold((failure) {
        emit(InternationalizationErrorState(
          errorMessage: ErrorMessage.l10n.errorSettingLanguage,
          language: state.language,
        ));
      }, (language) {
        emit(InternationalizationSetState(language: language));
      });
    });

    on<InternationalizationCheckEvent>((event, emit) async {
      emit(InternationalizationChangingState(language: state.language));
      final failureOrLanguage = await checkLocaleLanguage(NoParams());
      failureOrLanguage.fold((failure) {
        emit(InternationalizationErrorState(
          errorMessage: ErrorMessage.l10n.errorSettingLanguage,
          language: state.language,
        ));
      }, (language) {
        emit(InternationalizationSetState(language: language));
      });
    });
  }
}
