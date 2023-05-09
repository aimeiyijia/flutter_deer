class UserModel {
  String? idCard;
  // List<String>? areaList;
  // OrgnizationUser? orgnizationUser;
  // ResourceDto? resourceDto;

  UserModel(
      {this.idCard});

  UserModel.fromJson(Map<String, dynamic> json) {
    idCard = json['idCard'] as String;
    // areaList = json['areaList'].cast<String>() as List<String>;
    // orgnizationUser = json['orgnizationUser'] != null
    //     ? new OrgnizationUser.fromJson(json['orgnizationUser'] as Map<String, dynamic>)
    //     : null;
    // resourceDto = json['resourceDto'] != null
    //     ? new ResourceDto.fromJson(json['resourceDto'] as Map<String, dynamic>)
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCard'] = this.idCard;
    // data['areaList'] = this.areaList;
    // if (this.orgnizationUser != null) {
    //   data['orgnizationUser'] = this.orgnizationUser!.toJson();
    // }
    // if (this.resourceDto != null) {
    //   data['resourceDto'] = this.resourceDto!.toJson();
    // }
    return data;
  }
}

class OrgnizationUser {
  String? certificateCode;

  OrgnizationUser({this.certificateCode});

  OrgnizationUser.fromJson(Map<String, dynamic> json) {
    certificateCode = json['certificateCode'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certificateCode'] = this.certificateCode;
    return data;
  }
}

class ResourceDto {
  List<Menus>? menus;

  ResourceDto({this.menus});

  ResourceDto.fromJson(Map<String, dynamic> json) {
    if (json['menus'] != null) {
      menus = <Menus>[];
      json['menus'].forEach((v) {
        menus!.add(new Menus.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menus != null) {
      data['menus'] = this.menus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menus {
  String? buttonGroup;

  Menus({this.buttonGroup});

  Menus.fromJson(Map<String, dynamic> json) {
    buttonGroup = json['buttonGroup'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buttonGroup'] = this.buttonGroup;
    return data;
  }
}
