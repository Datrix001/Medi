import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medi_app/features/ambience/data/model/ambience_model.dart';
import 'package:medi_app/features/journal/presentation/widgets/journal_card.dart';
import 'package:medi_app/gen/colors.gen.dart';
import 'package:medi_app/utils/styles/app_text.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});
  static const routeName = "/journal-screen";

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: appTextH2("Journal"),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            JournalCard(
              date: "Yesterday",
              ambienceType: AmbienceType.calm,
              title: 'Mountain Stillness',
              body:
                  'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it ',
            ),
            10.verticalSpace,
            JournalCard(
              date: "Yesterday",
              ambienceType: AmbienceType.focus,
              title: 'Sunset Lake',
              body:
                  'making it look like readable English. Many desktop publishing packages and web page editors now use',
            ),
            10.verticalSpace,
            JournalCard(
              date: "Yesterday",
              ambienceType: AmbienceType.rest,
              title: 'Forest Awakening',
              body:
                  'e going to use a passage of Lorem Ipsum, you need to be sure there isnt anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore a',
            ),
          ],
        ),
      ),
    );
  }
}
