// import 'package:cargo_app/fetches/info_contractor_fetch.dart';
import 'package:cargo_app/main/select_contractor.dart';
import 'package:cargo_app/model/info_contractor_model.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  // late Future<InfoContractorModel> futureInfoContractor;

  List<ContractorData> listContractors = [
    ContractorData(
        id: 1,
        name: 'Общество с ограниченной ответственностью "Сад-Групп"',
        type: "Общество с ограниченной ответственностью",
        country: "Кыргызская Республика",
        iNN: "02304201510141",
        createdAt: null,
        updatedAt: null),
    ContractorData(
        id: 2,
        name: 'Аскарова Гулзада Абдыкадыровна',
        type: "Индивидуальный предприниматель (на основе личного труда)",
        country: "Кыргызская Республика",
        iNN: "1121019900162",
        createdAt: null,
        updatedAt: null),
    ContractorData(
        id: 3,
        name: 'Общество с ограниченной ответственностью "Дор-Мастер"',
        type: "Общество с ограниченной ответственностью",
        country: "Кыргызская Республика",
        iNN: "02811201610197",
        createdAt: null,
        updatedAt: null),
    ContractorData(
        id: 4,
        name: 'Общество с ограниченной ответственностью "СК-Райн"',
        type: "Юридическое лицо",
        country: "Кыргызская Республика",
        iNN: "02811202310197",
        createdAt: null,
        updatedAt: null),
    ContractorData(
        id: 5,
        name: 'Общество с ограниченной ответственностью "Атаман-Строй"',
        type: "Учреждение",
        country: "Кыргызская Республика",
        iNN: "028116543310197",
        createdAt: null,
        updatedAt: null),
    ContractorData(
        id: 6,
        name: 'Общество с ограниченной ответственностью "Пирамида-Строй-Групп"',
        type: "Общество с ограниченной ответственностью",
        country: "Кыргызская Республика",
        iNN: "0212316543310197",
        createdAt: null,
        updatedAt: null),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // futureInfoContractor = fetchInfoContractor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Справочники/подрядчик'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: listContractors.length,
          itemBuilder: (context, int index) {
            return Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectContractor(
                          data: listContractors.elementAt(index)),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text("${listContractors.elementAt(index).name}"),
                ),
              ),
            );
          },
        ));

    /*
      FutureBuilder<InfoContractorModel>(
        future: futureInfoContractor,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length!,
              itemBuilder: (context, int index) {
                return Container(
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectContractor(
                              data: snapshot.data!.data!.elementAt(index).id),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child:
                          Text("${snapshot.data!.data!.elementAt(index).name}"),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

       */
  }
}
