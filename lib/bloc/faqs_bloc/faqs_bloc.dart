import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/core/enum/faqsenum.dart';
import 'package:oruphones/model/faq/faq.dart';
import 'package:oruphones/repository/faqs_repo/faqs_repo.dart';

part 'faqs_event.dart';
part 'faqs_state.dart';

class FaqsBloc extends Bloc<FaqsEvent, FaqsState> {
  final FaqsRepo _faqsRepo;
  FaqsBloc(this._faqsRepo) : super(FaqsInitial()) {
    on<FetchFAQSEvent>(_fetchFaqs);
  }
  Future<void> _fetchFaqs(FetchFAQSEvent event, Emitter<FaqsState> emit) async {
    emit(FaqsLoadingState(laodingSource: FaqsENUM.fetchfaqs));
    try {
      final data = await _faqsRepo.fetchFAQ();
      emit(FaqsDataState(faqs: data, dataSource: FaqsENUM.fetchfaqs));
    } catch (e) {
      emit(FaqsErrorState(
          errorMessage: e.toString(), errorSource: FaqsENUM.fetchfaqs));
    }
  }
}
