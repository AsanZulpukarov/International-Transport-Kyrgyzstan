class PointsModel {
  List<Data>? data;
  List<Sections>? sections;

  PointsModel({this.data, this.sections});

  PointsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (sections != null) {
      data['sections'] = sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? x;
  String? y;

  Data({this.id, this.x, this.y});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}

class Sections {
  int? id;
  String? x1;
  String? y1;
  String? x2;
  String? y2;
  int? startDate;
  int? endDate;
  String? status;
  int? lifetime;
  String? type;
  String? description;
  int? price;
  int? contractorId;
  String? createdAt;
  String? updatedAt;

  Sections(
      {this.id,
      this.x1,
      this.y1,
      this.x2,
      this.y2,
      this.startDate,
      this.endDate,
      this.status,
      this.lifetime,
      this.type,
      this.description,
      this.price,
      this.contractorId,
      this.createdAt,
      this.updatedAt});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    x1 = json['x1'];
    y1 = json['y1'];
    x2 = json['x2'];
    y2 = json['y2'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    lifetime = json['lifetime'];
    type = json['type'];
    description = json['description'];
    price = json['price'];
    contractorId = json['contractor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['x1'] = x1;
    data['y1'] = y1;
    data['x2'] = x2;
    data['y2'] = y2;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['lifetime'] = lifetime;
    data['type'] = type;
    data['description'] = description;
    data['price'] = price;
    data['contractor_id'] = contractorId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
