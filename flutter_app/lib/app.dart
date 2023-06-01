import 'package:flutter/material.dart';

import 'view/arithmetic_view.dart';
import 'view/card_view.dart';
import 'view/change_name_view.dart';
import 'view/circle_view.dart';
import 'view/class_exercise_view.dart';
import 'view/classwork_stack_view.dart';
import 'view/color_change_view.dart';
import 'view/column_view.dart';
import 'view/container_view.dart';
import 'view/dashboard_view.dart';
import 'view/datatable_view.dart';
import 'view/date_time_view.dart';
import 'view/display_student_view.dart';
import 'view/gallery_view.dart';
import 'view/grid_view.dart';
import 'view/grid_view_screen_classwork.dart';
import 'view/load_image_view.dart';
import 'view/media_query_view.dart';
import 'view/output_view.dart';
import 'view/rich_text_view.dart';
import 'view/simple_interest_view.dart';
import 'view/stack_view.dart';
import 'view/student_detail_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/arithmeticRoute': (context) => const ArithmeticView(),
        '/simpleInterestRoute': (context) => const SimpleInterestView(),
        '/circleRoute': (context) => const CircleView(),
        '/changeNameRoute': (context) => const ChangeNameView(),
        '/richTextRoute': (context) => const RichTextView(),
        '/columnRoute': (context) => const ColumnView(),
        '/outputRoute': (context) => const OutputView(),
        '/containerRoute': (context) => const ContainerView(),
        '/loadImageRoute': (context) => const LoadImageView(),
        '/studentDetailRoute': (context) => const StudentDetailView(),
        '/displayStudentRoute': (context) => const DisplayStudentView(),
        '/mediaQueryRoute': (context) => const MediaQueryView(),
        '/clasExerciseRoute': (context) => const ClassExerciseView(),
        '/gridViewRoute': (context) => GridViewScreen(),
        '/cardviewRoute': (context) => const CardView(),
        '/gridViewClassworkRoute': (context) => const GridViewScreenClasswork(),
        '/colorChangeRoute': (context) => ColorChangeView(),
        '/stackViewRoute': (context) => const StackView(),
        '/classworkStackViewRoute': (context) => const ClassworkStackView(),
        '/galleryRoute': (context) => GalleryView(),
        '/datatableRoute': (context) => const DataTableView(),
        '/datetimeRoute': (context) => const DateTimeView(),
      },
    );
  }
}
