class InfoContractorModel {
  List<ContractorData>? data;

  InfoContractorModel({this.data});

  InfoContractorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ContractorData>[];
      json['data'].forEach((v) {
        data!.add(ContractorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContractorData {
  int? id;
  String? name;
  String? type;
  String? country;
  String? iNN;
  String? createdAt;
  String? updatedAt;

  ContractorData(
      {this.id,
      this.name,
      this.type,
      this.country,
      this.iNN,
      this.createdAt,
      this.updatedAt});

  ContractorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    country = json['country'];
    iNN = json['INN'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['country'] = country;
    data['INN'] = iNN;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
