class LostAndFoundDto {
  LostArticleInfo? lostArticleInfo;

  LostAndFoundDto({this.lostArticleInfo});

  LostAndFoundDto.fromJson(Map<String, dynamic> json) {
    lostArticleInfo = json['lostArticleInfo'] != null
        ? new LostArticleInfo.fromJson(json['lostArticleInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lostArticleInfo != null) {
      data['lostArticleInfo'] = this.lostArticleInfo!.toJson();
    }
    return data;
  }
}

class LostArticleInfo {
  int? listTotalCount;
  RESULT? rESULT;
  List<Row>? row;

  LostArticleInfo({this.listTotalCount, this.rESULT, this.row});

  LostArticleInfo.fromJson(Map<String, dynamic> json) {
    listTotalCount = json['list_total_count'];
    rESULT =
    json['RESULT'] != null ? new RESULT.fromJson(json['RESULT']) : null;
    if (json['row'] != null) {
      row = <Row>[];
      json['row'].forEach((v) {
        row!.add(new Row.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_total_count'] = this.listTotalCount;
    if (this.rESULT != null) {
      data['RESULT'] = this.rESULT!.toJson();
    }
    if (this.row != null) {
      data['row'] = this.row!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RESULT {
  String? cODE;
  String? mESSAGE;

  RESULT({this.cODE, this.mESSAGE});

  RESULT.fromJson(Map<String, dynamic> json) {
    cODE = json['CODE'];
    mESSAGE = json['MESSAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CODE'] = this.cODE;
    data['MESSAGE'] = this.mESSAGE;
    return data;
  }
}

class Row {
  String? iD;
  String? sTATUS;
  String? rEGDATE;
  String? gETDATE;
  String? gETTHING;
  String? tAKEPLACE;
  String? tAKEID;
  String? gETNAME;
  String? cATE;
  String? gETPOSITION;
  String? rEADCNT;

  Row(
      {this.iD,
        this.sTATUS,
        this.rEGDATE,
        this.gETDATE,
        this.gETTHING,
        this.tAKEPLACE,
        this.tAKEID,
        this.gETNAME,
        this.cATE,
        this.gETPOSITION,
        this.rEADCNT});

  Row.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    sTATUS = json['STATUS'];
    rEGDATE = json['REG_DATE'];
    gETDATE = json['GET_DATE'];
    gETTHING = json['GET_THING'];
    tAKEPLACE = json['TAKE_PLACE'];
    tAKEID = json['TAKE_ID'];
    gETNAME = json['GET_NAME'];
    cATE = json['CATE'];
    gETPOSITION = json['GET_POSITION'];
    rEADCNT = json['READ_CNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['STATUS'] = this.sTATUS;
    data['REG_DATE'] = this.rEGDATE;
    data['GET_DATE'] = this.gETDATE;
    data['GET_THING'] = this.gETTHING;
    data['TAKE_PLACE'] = this.tAKEPLACE;
    data['TAKE_ID'] = this.tAKEID;
    data['GET_NAME'] = this.gETNAME;
    data['CATE'] = this.cATE;
    data['GET_POSITION'] = this.gETPOSITION;
    data['READ_CNT'] = this.rEADCNT;
    return data;
  }
}
