import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medi_app/features/journal/presentation/cubit/journal_cubit.dart';
import 'package:medi_app/features/journal/presentation/cubit/journal_state.dart';
import 'package:medi_app/features/journal/presentation/screens/journal_details_screen.dart';
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
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.book_outlined,
                        size: 48.sp,
                        color: AppColors.black.withAlpha(50),
                      ),
                      16.verticalSpace,
                      appTextS4(
                        "No reflections yet.\nStart a session to begin.",
                        color: AppColors.black.withAlpha(100),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(20.w),
              itemCount: model.length,
              itemBuilder: (context, index) {
                final currentModel = model[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    // Tap opens full detail view
                    onTap: () => context.push(
                      JournalDetailScreen.routeName,
                      extra: currentModel,
                    ),
                    child: JournalCard(
                      date: Utils.formatJournalDate(currentModel.date),
                      feelingsType: currentModel.feelingType,
                      title: currentModel.title,
                      body: currentModel.feeling,
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
