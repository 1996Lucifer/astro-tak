class LocationModel {
  List<LocationsList> data;

  LocationModel({this.data});

  LocationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LocationsList>[];
      json['data'].forEach((v) {
        data.add(new LocationsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationsList {
  String placeName;
  String placeId;

  LocationsList({this.placeName, this.placeId});

  LocationsList.fromJson(Map<String, dynamic> json) {
    placeName = json['placeName'];
    placeId = json['placeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeName'] = this.placeName;
    data['placeId'] = this.placeId;
    return data;
  }
}
