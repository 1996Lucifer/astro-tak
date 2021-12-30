class PanchangModel {
  PanchangDetail data;

  PanchangModel({this.data});

  PanchangModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new PanchangDetail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class PanchangDetail {
  String day;
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String vedicSunrise;
  String vedicSunset;
  Tithi tithi;
  Nakshatra nakshatra;
  Yog yog;
  Karan karan;
  HinduMaah hinduMaah;
  String paksha;
  String ritu;
  String sunSign;
  String moonSign;
  String ayana;
  String panchangYog;
  int vikramSamvat;
  int shakaSamvat;
  String vkramSamvatName;
  String shakaSamvatName;
  String dishaShool;
  String dishaShoolRemedies;
  NakShool nakShool;
  String moonNivas;
  AbhijitMuhurta abhijitMuhurta;
  AbhijitMuhurta rahukaal;
  AbhijitMuhurta guliKaal;
  AbhijitMuhurta yamghantKaal;

  PanchangDetail(
      {this.day,
      this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.vedicSunrise,
      this.vedicSunset,
      this.tithi,
      this.nakshatra,
      this.yog,
      this.karan,
      this.hinduMaah,
      this.paksha,
      this.ritu,
      this.sunSign,
      this.moonSign,
      this.ayana,
      this.panchangYog,
      this.vikramSamvat,
      this.shakaSamvat,
      this.vkramSamvatName,
      this.shakaSamvatName,
      this.dishaShool,
      this.dishaShoolRemedies,
      this.nakShool,
      this.moonNivas,
      this.abhijitMuhurta,
      this.rahukaal,
      this.guliKaal,
      this.yamghantKaal});

  PanchangDetail.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    vedicSunrise = json['vedic_sunrise'];
    vedicSunset = json['vedic_sunset'];
    tithi = json['tithi'] != null ? new Tithi.fromJson(json['tithi']) : null;
    nakshatra = json['nakshatra'] != null
        ? new Nakshatra.fromJson(json['nakshatra'])
        : null;
    yog = json['yog'] != null ? new Yog.fromJson(json['yog']) : null;
    karan = json['karan'] != null ? new Karan.fromJson(json['karan']) : null;
    hinduMaah = json['hindu_maah'] != null
        ? new HinduMaah.fromJson(json['hindu_maah'])
        : null;
    paksha = json['paksha'];
    ritu = json['ritu'];
    sunSign = json['sun_sign'];
    moonSign = json['moon_sign'];
    ayana = json['ayana'];
    panchangYog = json['panchang_yog'];
    vikramSamvat = json['vikram_samvat'];
    shakaSamvat = json['shaka_samvat'];
    vkramSamvatName = json['vkram_samvat_name'];
    shakaSamvatName = json['shaka_samvat_name'];
    dishaShool = json['disha_shool'];
    dishaShoolRemedies = json['disha_shool_remedies'];
    nakShool = json['nak_shool'] != null
        ? new NakShool.fromJson(json['nak_shool'])
        : null;
    moonNivas = json['moon_nivas'];
    abhijitMuhurta = json['abhijit_muhurta'] != null
        ? new AbhijitMuhurta.fromJson(json['abhijit_muhurta'])
        : null;
    rahukaal = json['rahukaal'] != null
        ? new AbhijitMuhurta.fromJson(json['rahukaal'])
        : null;
    guliKaal = json['guliKaal'] != null
        ? new AbhijitMuhurta.fromJson(json['guliKaal'])
        : null;
    yamghantKaal = json['yamghant_kaal'] != null
        ? new AbhijitMuhurta.fromJson(json['yamghant_kaal'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['vedic_sunrise'] = this.vedicSunrise;
    data['vedic_sunset'] = this.vedicSunset;
    if (this.tithi != null) {
      data['tithi'] = this.tithi.toJson();
    }
    if (this.nakshatra != null) {
      data['nakshatra'] = this.nakshatra.toJson();
    }
    if (this.yog != null) {
      data['yog'] = this.yog.toJson();
    }
    if (this.karan != null) {
      data['karan'] = this.karan.toJson();
    }
    if (this.hinduMaah != null) {
      data['hindu_maah'] = this.hinduMaah.toJson();
    }
    data['paksha'] = this.paksha;
    data['ritu'] = this.ritu;
    data['sun_sign'] = this.sunSign;
    data['moon_sign'] = this.moonSign;
    data['ayana'] = this.ayana;
    data['panchang_yog'] = this.panchangYog;
    data['vikram_samvat'] = this.vikramSamvat;
    data['shaka_samvat'] = this.shakaSamvat;
    data['vkram_samvat_name'] = this.vkramSamvatName;
    data['shaka_samvat_name'] = this.shakaSamvatName;
    data['disha_shool'] = this.dishaShool;
    data['disha_shool_remedies'] = this.dishaShoolRemedies;
    if (this.nakShool != null) {
      data['nak_shool'] = this.nakShool.toJson();
    }
    data['moon_nivas'] = this.moonNivas;
    if (this.abhijitMuhurta != null) {
      data['abhijit_muhurta'] = this.abhijitMuhurta.toJson();
    }
    if (this.rahukaal != null) {
      data['rahukaal'] = this.rahukaal.toJson();
    }
    if (this.guliKaal != null) {
      data['guliKaal'] = this.guliKaal.toJson();
    }
    if (this.yamghantKaal != null) {
      data['yamghant_kaal'] = this.yamghantKaal.toJson();
    }
    return data;
  }
}

class Tithi {
  TithiDetails tithiDetails;
  EndTime endTime;
  int endTimeMs;

  Tithi({this.tithiDetails, this.endTime, this.endTimeMs});

  Tithi.fromJson(Map<String, dynamic> json) {
    tithiDetails = json['details'] != null
        ? new TithiDetails.fromJson(json['details'])
        : null;
    endTime = json['end_time'] != null
        ? new EndTime.fromJson(json['end_time'])
        : null;
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tithiDetails != null) {
      data['details'] = this.tithiDetails.toJson();
    }
    if (this.endTime != null) {
      data['end_time'] = this.endTime.toJson();
    }
    data['end_time_ms'] = this.endTimeMs;
    return data;
  }
}

class Nakshatra {
  NakshatraDetails nakshatraDetails;
  EndTime endTime;
  int endTimeMs;

  Nakshatra({this.nakshatraDetails, this.endTime, this.endTimeMs});

  Nakshatra.fromJson(Map<String, dynamic> json) {
    nakshatraDetails = json['details'] != null
        ? new NakshatraDetails.fromJson(json['details'])
        : null;
    endTime = json['end_time'] != null
        ? new EndTime.fromJson(json['end_time'])
        : null;
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nakshatraDetails != null) {
      data['details'] = this.nakshatraDetails.toJson();
    }
    if (this.endTime != null) {
      data['end_time'] = this.endTime.toJson();
    }
    data['end_time_ms'] = this.endTimeMs;
    return data;
  }
}

class Yog {
  YogDetails yogDetails;
  EndTime endTime;
  int endTimeMs;

  Yog({this.yogDetails, this.endTime, this.endTimeMs});

  Yog.fromJson(Map<String, dynamic> json) {
    yogDetails = json['details'] != null
        ? new YogDetails.fromJson(json['details'])
        : null;
    endTime = json['end_time'] != null
        ? new EndTime.fromJson(json['end_time'])
        : null;
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.yogDetails != null) {
      data['details'] = this.yogDetails.toJson();
    }
    if (this.endTime != null) {
      data['end_time'] = this.endTime.toJson();
    }
    data['end_time_ms'] = this.endTimeMs;
    return data;
  }
}

class Karan {
  KaranDetails karanDetails;
  EndTime endTime;
  int endTimeMs;

  Karan({this.karanDetails, this.endTime, this.endTimeMs});

  Karan.fromJson(Map<String, dynamic> json) {
    karanDetails = json['details'] != null
        ? new KaranDetails.fromJson(json['details'])
        : null;
    endTime = json['end_time'] != null
        ? new EndTime.fromJson(json['end_time'])
        : null;
    endTimeMs = json['end_time_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.karanDetails != null) {
      data['details'] = this.karanDetails.toJson();
    }
    if (this.endTime != null) {
      data['end_time'] = this.endTime.toJson();
    }
    data['end_time_ms'] = this.endTimeMs;
    return data;
  }
}

class TithiDetails {
  int tithiNumber;
  String tithiName;
  String special;
  String summary;
  String deity;

  TithiDetails({
    this.tithiNumber,
    this.tithiName,
    this.special,
    this.summary,
    this.deity,
  });

  TithiDetails.fromJson(Map<String, dynamic> json) {
    tithiNumber = json['tithi_number'];
    tithiName = json['tithi_name'];
    special = json['special'];
    summary = json['summary'];
    deity = json['deity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tithi_number'] = this.tithiNumber;
    data['tithi_name'] = this.tithiName;
    data['special'] = this.special;
    data['summary'] = this.summary;
    data['deity'] = this.deity;
    return data;
  }
}

class EndTime {
  int hour;
  int minute;
  int second;

  EndTime({this.hour, this.minute, this.second});

  EndTime.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    data['second'] = this.second;
    return data;
  }
}

class NakshatraDetails {
  int nakNumber;
  String nakName;
  String ruler;
  String deity;
  String special;
  String summary;

  NakshatraDetails({
    this.nakNumber,
    this.nakName,
    this.ruler,
    this.deity,
    this.special,
    this.summary,
  });

  NakshatraDetails.fromJson(Map<String, dynamic> json) {
    nakNumber = json['nak_number'];
    nakName = json['nak_name'];
    ruler = json['ruler'];
    deity = json['deity'];
    special = json['special'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nak_number'] = this.nakNumber;
    data['nak_name'] = this.nakName;
    data['ruler'] = this.ruler;
    data['deity'] = this.deity;
    data['special'] = this.special;
    data['summary'] = this.summary;
    return data;
  }
}

class YogDetails {
  int yogNumber;
  String yogName;
  String special;
  String meaning;

  YogDetails({this.yogNumber, this.yogName, this.special, this.meaning});

  YogDetails.fromJson(Map<String, dynamic> json) {
    yogNumber = json['yog_number'];
    yogName = json['yog_name'];
    special = json['special'];
    meaning = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yog_number'] = this.yogNumber;
    data['yog_name'] = this.yogName;
    data['special'] = this.special;
    data['meaning'] = this.meaning;
    return data;
  }
}

class KaranDetails {
  int karanNumber;
  String karanName;
  String special;
  String deity;

  KaranDetails({this.karanNumber, this.karanName, this.special, this.deity});

  KaranDetails.fromJson(Map<String, dynamic> json) {
    karanNumber = json['karan_number'];
    karanName = json['karan_name'];
    special = json['special'];
    deity = json['deity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['karan_number'] = this.karanNumber;
    data['karan_name'] = this.karanName;
    data['special'] = this.special;
    data['deity'] = this.deity;
    return data;
  }
}

class HinduMaah {
  bool adhikStatus;
  String purnimanta;
  String amanta;
  int amantaId;
  int purnimantaId;

  HinduMaah(
      {this.adhikStatus,
      this.purnimanta,
      this.amanta,
      this.amantaId,
      this.purnimantaId});

  HinduMaah.fromJson(Map<String, dynamic> json) {
    adhikStatus = json['adhik_status'];
    purnimanta = json['purnimanta'];
    amanta = json['amanta'];
    amantaId = json['amanta_id'];
    purnimantaId = json['purnimanta_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adhik_status'] = this.adhikStatus;
    data['purnimanta'] = this.purnimanta;
    data['amanta'] = this.amanta;
    data['amanta_id'] = this.amantaId;
    data['purnimanta_id'] = this.purnimantaId;
    return data;
  }
}

class NakShool {
  String direction;
  String remedies;

  NakShool({this.direction, this.remedies});

  NakShool.fromJson(Map<String, dynamic> json) {
    direction = json['direction'];
    remedies = json['remedies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['direction'] = this.direction;
    data['remedies'] = this.remedies;
    return data;
  }
}

class AbhijitMuhurta {
  String start;
  String end;

  AbhijitMuhurta({this.start, this.end});

  AbhijitMuhurta.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}
