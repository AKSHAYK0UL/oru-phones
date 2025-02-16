import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/bloc/faqs_bloc/faqs_bloc.dart';
import 'package:oruphones/core/enum/faqsenum.dart';
import 'package:oruphones/presentation/home/widget/faqtitle.dart';

class Faqs extends StatelessWidget {
  const Faqs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqsBloc, FaqsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is FaqsLoadingState &&
            state.laodingSource == FaqsENUM.fetchfaqs) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FaqsErrorState &&
            state.errorSource == FaqsENUM.fetchfaqs) {
          return Text(state.errorMessage);
        }
        if (state is FaqsDataState && state.dataSource == FaqsENUM.fetchfaqs) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.faqs.length,
              itemBuilder: (context, index) {
                final data = state.faqs[index];
                return FaqTitle(data: data);
              });
        }
        return const SizedBox();
      },
    );
  }
}
