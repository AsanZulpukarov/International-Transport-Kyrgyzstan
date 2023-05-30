import 'dart:convert';

import '../model/points_model.dart';
import '../services/service.dart';

class FetchClass {
  static Map<String, dynamic> jsonPoints = {
    "data": [
      {"id": 6, "x": "42.82943706556415", "y": "74.58519022911786"},
      {"id": 2, "x": "42.83675638380703", "y": "74.57212753593922"},
      // {"id": 4, "x": "42.83677875669153", "y": "74.56764690577982"},
      {"id": 1, "x": "42.83678195281721", "y": "74.57257881760597"},
      {"id": 7, "x": "42.8369265158681", "y": "74.58565659821033"},
      // {"id": 3, "x": "42.83696314828815", "y": "74.56998646259308"},
      // {"id": 2, "x": "42.83752049927579", "y": "74.56877678632736"},
      // {"id": 1, "x": "42.838864070646096", "y": "74.56860814243555"},
      // {"id": 5, "x": "42.83916277467564", "y": "74.5686537399888"},
      {"id": 5, "x": "42.84220553994765", "y": "74.58798073232174"},
      {"id": 3, "x": "42.8426836856879", "y": "74.58692494779825"},
      {"id": 4, "x": "42.84584328788132", "y": "74.5826069265604"},
    ],
    "sections": [
      {
        "id": 1,
        "x1": "42.836853988529406",
        "y1": "74.56383548676968",
        "x2": "42.84220553994765",
        "y2": "74.56540390849113",
        "start_date": 2023410,
        "end_date": 202356,
        "status": "repairing",
        "lifetime": 2,
        "type": "sidewalk",
        "description": null,
        "price": 10000,
        "contractor_id": 6,
        "created_at": "2023-05-06T01:46:19.000000Z",
        "updated_at": "2023-05-06T01:46:19.000000Z"
      }
    ]
  };
  Future<PointsModel> fetchPoints() async {
    // final response = await AuthClient().getPoints();
    print(jsonPoints);
    return PointsModel.fromJson(jsonPoints);
  }
}
