import 'dart:convert';

import 'package:cargo_app/model/info_contractor_model.dart';

import '../services/service.dart';

Future<InfoContractorModel> fetchInfoContractor() async {
  // final response = await AuthClient().getInfoContractor();

  var jsonContractors = {
    "data": [
      {
        "id": 5,
        "name":
            "\u043e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e \"\u0421\u0430\u0434-\u0413\u0440\u0443\u043f\u043f\"",
        "type":
            "\u041e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e",
        "country":
            "\u041a\u044b\u0440\u0433\u044b\u0437\u0441\u043a\u0430\u044f \u0420\u0435\u0441\u043f\u0443\u0431\u043b\u0438\u043a\u0430",
        "INN": "02304201510141",
        "created_at": null,
        "updated_at": null
      },
      {
        "id": 6,
        "name":
            "\u0410\u0441\u043a\u0430\u0440\u043e\u0432\u0430 \u0413\u0443\u043b\u0437\u0430\u0434\u0430 \u0410\u0431\u0434\u044b\u043a\u0430\u0434\u044b\u0440\u043e\u0432\u043d\u0430",
        "type":
            "\u0418\u043d\u0434\u0438\u0432\u0438\u0434\u0443\u0430\u043b\u044c\u043d\u044b\u0439 \u043f\u0440\u0435\u0434\u043f\u0440\u0438\u043d\u0438\u043c\u0430\u0442\u0435\u043b\u044c (\u043d\u0430 \u043e\u0441\u043d\u043e\u0432\u0435 \u043b\u0438\u0447\u043d\u043e\u0433\u043e \u0442\u0440\u0443\u0434\u0430)",
        "country":
            "\u041a\u044b\u0440\u0433\u044b\u0437\u0441\u043a\u0430\u044f \u0420\u0435\u0441\u043f\u0443\u0431\u043b\u0438\u043a\u0430",
        "INN": "1121019900162",
        "created_at": null,
        "updated_at": null
      },
      {
        "id": 8,
        "name":
            "\u041e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e \"\u0414\u043e\u0440-\u041c\u0430\u0441\u0442\u0435\u0440\"",
        "type":
            "\u041e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e",
        "country":
            "\u041a\u044b\u0440\u0433\u044b\u0437\u0441\u043a\u0430\u044f \u0420\u0435\u0441\u043f\u0443\u0431\u043b\u0438\u043a\u0430",
        "INN": "02811201610197",
        "created_at": null,
        "updated_at": null
      },
      {
        "id": 9,
        "name":
            "\u041e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e \"\u0421\u041a-\u0420\u0430\u0439\u043d\"",
        "type":
            "\u042e\u0440\u0438\u0434\u0438\u0447\u0435\u0441\u043a\u043e\u0435 \u043b\u0438\u0446\u043e",
        "country":
            "\u041a\u044b\u0440\u0433\u044b\u0437\u0441\u043a\u0430\u044f \u0420\u0435\u0441\u043f\u0443\u0431\u043b\u0438\u043a\u0430",
        "INN": "02811202310197",
        "created_at": null,
        "updated_at": null
      },
      {
        "id": 10,
        "name":
            "\u041e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e \"\u0410\u0442\u0430\u043c\u0430\u043d-\u0421\u0442\u0440\u043e\u0439\"",
        "type": "\u0423\u0447\u0440\u0435\u0436\u0434\u0435\u043d\u0438\u0435",
        "country":
            "\u041a\u044b\u0440\u0433\u044b\u0437\u0441\u043a\u0430\u044f \u0420\u0435\u0441\u043f\u0443\u0431\u043b\u0438\u043a\u0430",
        "INN": "028116543310197",
        "created_at": null,
        "updated_at": null
      },
      {
        "id": 11,
        "name":
            "\u041e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e \"\u041f\u0438\u0440\u0430\u043c\u0438\u0434\u0430-\u0421\u0442\u0440\u043e\u0439-\u0413\u0440\u0443\u043f\u043f\"",
        "type":
            "\u041e\u0431\u0449\u0435\u0441\u0442\u0432\u043e \u0441 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d\u043d\u043e\u0439 \u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0435\u043d\u043d\u043e\u0441\u0442\u044c\u044e",
        "country":
            "\u041a\u044b\u0440\u0433\u044b\u0437\u0441\u043a\u0430\u044f \u0420\u0435\u0441\u043f\u0443\u0431\u043b\u0438\u043a\u0430",
        "INN": "0212316543310197",
        "created_at": null,
        "updated_at": null
      }
    ]
  };
  return InfoContractorModel.fromJson(jsonContractors);
}
