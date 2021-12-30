class AstrologerModel {
  List<AstrologersList> data;

  AstrologerModel({
    this.data,
  });

  AstrologerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AstrologersList>[];
      json['data'].forEach((v) {
        data.add(new AstrologersList.fromJson(v));
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

class AstrologersList {
  int id;
  String urlSlug;
  String namePrefix;
  String firstName;
  String lastName;
  String aboutMe;
  String profliePicUrl;
  double experience;
  List<Languages> languages;
  int minimumCallDuration;
  double minimumCallDurationCharges;
  double additionalPerMinuteCharges;
  bool isAvailable;
  double rating;
  List<Skills> skills;
  bool isOnCall;
  int freeMinutes;
  int additionalMinute;
  Images images;
  Availability availability;

  AstrologersList(
      {this.id,
      this.urlSlug,
      this.namePrefix,
      this.firstName,
      this.lastName,
      this.aboutMe,
      this.profliePicUrl,
      this.experience,
      this.languages,
      this.minimumCallDuration,
      this.minimumCallDurationCharges,
      this.additionalPerMinuteCharges,
      this.isAvailable,
      this.rating,
      this.skills,
      this.isOnCall,
      this.freeMinutes,
      this.additionalMinute,
      this.images,
      this.availability});

  AstrologersList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlSlug = json['urlSlug'];
    namePrefix = json['namePrefix'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    aboutMe = json['aboutMe'];
    profliePicUrl = json['profliePicUrl'];
    experience = json['experience'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages.add(new Languages.fromJson(v));
      });
    }
    minimumCallDuration = json['minimumCallDuration'];
    minimumCallDurationCharges = json['minimumCallDurationCharges'];
    additionalPerMinuteCharges = json['additionalPerMinuteCharges'];
    isAvailable = json['isAvailable'];
    rating = json['rating'];
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills.add(new Skills.fromJson(v));
      });
    }
    isOnCall = json['isOnCall'];
    freeMinutes = json['freeMinutes'];
    additionalMinute = json['additionalMinute'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    availability = json['availability'] != null
        ? new Availability.fromJson(json['availability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['urlSlug'] = this.urlSlug;
    data['namePrefix'] = this.namePrefix;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['aboutMe'] = this.aboutMe;
    data['profliePicUrl'] = this.profliePicUrl;
    data['experience'] = this.experience;
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    data['minimumCallDuration'] = this.minimumCallDuration;
    data['minimumCallDurationCharges'] = this.minimumCallDurationCharges;
    data['additionalPerMinuteCharges'] = this.additionalPerMinuteCharges;
    data['isAvailable'] = this.isAvailable;
    data['rating'] = this.rating;
    if (this.skills != null) {
      data['skills'] = this.skills.map((v) => v.toJson()).toList();
    }
    data['isOnCall'] = this.isOnCall;
    data['freeMinutes'] = this.freeMinutes;
    data['additionalMinute'] = this.additionalMinute;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    if (this.availability != null) {
      data['availability'] = this.availability.toJson();
    }
    return data;
  }
}

class Languages {
  int id;
  String name;

  Languages({this.id, this.name});

  Languages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Skills {
  int id;
  String name;
  String description;

  Skills({this.id, this.name, this.description});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

class Images {
  Small small;
  Large large;
  Medium medium;

  Images({this.small, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? new Small.fromJson(json['small']) : null;
    large = json['large'] != null ? new Large.fromJson(json['large']) : null;
    medium =
        json['medium'] != null ? new Medium.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.small != null) {
      data['small'] = this.small.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium.toJson();
    }
    return data;
  }
}

class Small {
  String imageUrl;
  int id;

  Small({this.imageUrl, this.id});

  Small.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}

class Medium {
  String imageUrl;
  int id;

  Medium({this.imageUrl, this.id});

  Medium.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}

class Large {
  String imageUrl;
  int id;

  Large({this.imageUrl, this.id});

  Large.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}

class Availability {
  List<String> days;
  Slot slot;

  Availability({this.days, this.slot});

  Availability.fromJson(Map<String, dynamic> json) {
    days = json['days'].cast<String>();
    slot = json['slot'] != null ? new Slot.fromJson(json['slot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days'] = this.days;
    if (this.slot != null) {
      data['slot'] = this.slot.toJson();
    }
    return data;
  }
}

class Slot {
  String toFormat;
  String fromFormat;
  String from;
  String to;

  Slot({this.toFormat, this.fromFormat, this.from, this.to});

  Slot.fromJson(Map<String, dynamic> json) {
    toFormat = json['toFormat'];
    fromFormat = json['fromFormat'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toFormat'] = this.toFormat;
    data['fromFormat'] = this.fromFormat;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
