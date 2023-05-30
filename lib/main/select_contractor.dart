import 'package:cargo_app/model/info_contractor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectContractor extends StatelessWidget {
  late Future<InfoContractorModel> futureInfoContractor;
  ContractorData data;
  SelectContractor({Key? key, required this.data}) : super(key: key);

  static TextStyle styleHeader = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle styleBase = TextStyle(
    fontSize: 18.sp,
    fontStyle: FontStyle.italic,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
              child: Center(
                child: Text(
                  "О подрядчике",
                  style: styleHeader,
                ),
              ),
            ),
            getHeaderAndBase("Name", data.name ?? "Нет данных"),
            getHeaderAndBase("Type", data.type ?? "Нет данных"),
            getHeaderAndBase("Country", data.country ?? "Нет данных"),
            getHeaderAndBase("iNN", data.iNN ?? "Нет данных"),
            getHeaderAndBase("Created At", data.createdAt ?? "Нет данных"),
            getHeaderAndBase("Updated At", data.updatedAt ?? "Нет данных"),
          ],
        ),
      ),
    );
  }

  Column getHeaderAndBase(String header, String base) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: styleHeader,
        ),
        Divider(
          color: Colors.blue,
          height: 5.h,
        ),
        Text(
          base,
          style: styleBase,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
