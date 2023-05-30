import 'dart:convert';

import 'package:cargo_app/model/info_point_model.dart';

import '../model/points_model.dart';
import '../services/service.dart';

class InfoPoint {
  static List<dynamic> pointsJson = [
    {
      "data": {
        "user_id": 4,
        "user_name": "marsel",
        "x": "42.83678195281721",
        "y": "74.57257881760597",
        "photo": "images\/GNhH0huDRAEu1QQ7BauRhaXG25cHgKyOVLxjzAD5.jpg",
        "description": "\u0432\u0435\u0442",
        "date": "2023-05-05 23:51:54",
        "likes": 0,
        "dislikes": 0
      }
    },
    {
      "data": {
        "user_id": 4,
        "user_name": "marsel",
        "x": "42.83675638380703",
        "y": "74.57212753593922",
        "photo": "images\/OPaFYAMPhBl1QAl1tw3c875QZDKehLsMrl21mLUu.jpg",
        "description": "\u043f\u043b\u043e\u0445\u043e",
        "date": "2023-05-05 23:53:11",
        "likes": 0,
        "dislikes": 0
      }
    },
    {
      "data": {
        "user_id": 1,
        "user_name": "user1",
        "x": "42.8426836856879",
        "y": "74.58692494779825",
        "photo": "images\/zSlE77RE5hRjNbnbEKSkDocXLKRzA94RdPOPj3b9.jpg",
        "description": "hshshd",
        "date": "2023-05-06 03:31:12",
        "likes": 0,
        "dislikes": 0
      }
    },
    {
      "data": {
        "user_id": 1,
        "user_name": "user1",
        "x": "42.84584328788132",
        "y": "74.5826069265604",
        "photo": "images\/rKEYTK5a4QHm6GVMfebBhoY3sPn1aqv3n25K16hR.webp",
        "description": "fghgf",
        "date": "2023-05-06 03:32:02",
        "likes": 0,
        "dislikes": 0
      }
    },
    {
      "data": {
        "user_id": 1,
        "user_name": "user1",
        "x": "42.84220553994765",
        "y": "74.58798073232174",
        "photo": "images\/WhxBSEfFrmSRARCzC2Roq0ZCmyn683dqU2oVMkJU.jpg",
        "description": "\u043f\u0440\u043e",
        "date": "2023-05-06 04:39:45",
        "likes": 0,
        "dislikes": 0
      }
    },
    {
      "data": {
        "user_id": 5,
        "user_name": "aytemir",
        "x": "42.82943706556415",
        "y": "74.58519022911786",
        "photo": "images\/CAS5QyHEIOal1hScCL0EajWb5kUJsr5whGqcayhm.jpg",
        "description": "\u044f\u043c\u0432",
        "date": "2023-05-06 05:01:24",
        "likes": 0,
        "dislikes": 0
      }
    },
    {
      "data": {
        "user_id": 5,
        "user_name": "aytemir",
        "x": "42.8369265158681",
        "y": "74.58565659821033",
        "photo": "images\/0t6cPIMMxr9Z0DRI0RzoKWow6H6D4nj0ZaEFTpJz.jpg",
        "description": "f",
        "date": "2023-05-06 05:12:04",
        "likes": 0,
        "dislikes": 0
      }
    }
  ];

  Future<InfoPointModel> fetchInfoPoints(String id) async {
    // final response = await AuthClient().getInfoPoint(id);
    print(pointsJson);

    return InfoPointModel.fromJson(pointsJson[int.parse(id) - 1]);
  }
}
