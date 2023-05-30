import 'package:cargo_app/main/select_contractor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPost extends StatelessWidget {
  MyPost({Key? key}) : super(key: key);
  var styleBorder = BoxDecoration(
    border: Border.all(
      color: Colors.blue,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои публикации"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: styleBorder,
              child: Row(
                children: [
                  SizedBox(
                    width: 100.sp,
                    height: 100.sp,
                    child: const Icon(FontAwesomeIcons.bicycle),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Скрябина 24",
                          style: SelectContractor.styleHeader,
                        ),
                        Text(
                          "Велосипедная дорожка",
                          style: SelectContractor.styleBase,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: styleBorder,
              child: Row(
                children: [
                  SizedBox(
                    width: 100.sp,
                    height: 100.sp,
                    child: const Icon(FontAwesomeIcons.car),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Тыналиева 1/2 ",
                          style: SelectContractor.styleHeader,
                        ),
                        Text(
                          "Дорога",
                          style: SelectContractor.styleBase,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: styleBorder,
              child: Row(
                children: [
                  SizedBox(
                    width: 100.sp,
                    height: 100.sp,
                    child: const Icon(FontAwesomeIcons.shoePrints),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Магистраль ",
                          style: SelectContractor.styleHeader,
                        ),
                        Text(
                          "Тротуар",
                          style: SelectContractor.styleBase,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
