import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/journal/presentation/cubit/journal_cubit.dart';
import 'package:medi_app/features/journal/presentation/cubit/journal_state.dart';
import 'package:medi_app/features/journal/presentation/widgets/journal_card.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';
import 'package:medi_app/utils/utils.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});
  static const routeName = "/journal-screen";

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JournalCubit>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: appTextH2("Journal"),
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<JournalCubit, JournalState>(
        listener: (context, state) {
          if (state is JournalFailureState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: appTextB1(state.errorMessage)));
          }
        },
        builder: (context, state) {
          if (state is JournalLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is JournalSuccessState) {
            final model = state.model;
            if (model.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: appTextS2("NO JOURNAL WRITTEN YET"))],
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(20.w),

              itemCount: model.length,

              itemBuilder: (context, index) {
                final currentModel = model[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: JournalCard(
                    date: Utils.formatJournalDate(currentModel.date),
                    feelingsType: currentModel.feelingType,
                    title: currentModel.title,
                    body: currentModel.feeling,
                  ),
                );
              },
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
