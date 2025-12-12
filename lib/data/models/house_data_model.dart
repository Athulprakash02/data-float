class HouseDataModel {
  List<HouseData>? data;

  HouseDataModel({this.data});

  HouseDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HouseData>[];
      json['data'].forEach((v) {
        data!.add(new HouseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HouseData {
  String? pROPERTYRT;
  int? cMNCMNKEY;
  String? lISTAGENTNAME;
  String? lISTAGENTOFFICE;
  List<String>? pICTURE;
  String? iDCMLSNUMBER;
  int? sQFT;
  int? bEDS;
  String? iDCREMARKS;
  String? iDCSTATUS;
  int? iDCLISTPRICE;
  bool? iDCDISPLAYADDRESS;
  int? mLSPHOTOCOUNT;
  String? iDCPROPERTYTYPE;
  int? bATHSTOTAL;
  String? iDCFULLADDRESS;

  HouseData(
      {this.pROPERTYRT,
      this.cMNCMNKEY,
      this.lISTAGENTNAME,
      this.lISTAGENTOFFICE,
      this.pICTURE,
      this.iDCMLSNUMBER,
      this.sQFT,
      this.bEDS,
      this.iDCREMARKS,
      this.iDCSTATUS,
      this.iDCLISTPRICE,
      this.iDCDISPLAYADDRESS,
      this.mLSPHOTOCOUNT,
      this.iDCPROPERTYTYPE,
      this.bATHSTOTAL,
      this.iDCFULLADDRESS});

  HouseData.fromJson(Map<String, dynamic> json) {
    pROPERTYRT = json['PROPERTYRT'];
    cMNCMNKEY = json['CMNCMNKEY'];
    lISTAGENTNAME = json['LISTAGENTNAME'];
    lISTAGENTOFFICE = json['LISTAGENTOFFICE'];
    pICTURE = json['PICTURE'].cast<String>();
    iDCMLSNUMBER = json['IDCMLSNUMBER'];
    sQFT = json['SQFT'];
    bEDS = json['BEDS'];
    iDCREMARKS = json['IDCREMARKS'];
    iDCSTATUS = json['IDCSTATUS'];
    iDCLISTPRICE = json['IDCLISTPRICE'];
    iDCDISPLAYADDRESS = json['IDCDISPLAYADDRESS'];
    mLSPHOTOCOUNT = json['MLSPHOTOCOUNT'];
    iDCPROPERTYTYPE = json['IDCPROPERTYTYPE'];
    bATHSTOTAL = json['BATHSTOTAL'];
    iDCFULLADDRESS = json['IDCFULLADDRESS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PROPERTYRT'] = this.pROPERTYRT;
    data['CMNCMNKEY'] = this.cMNCMNKEY;
    data['LISTAGENTNAME'] = this.lISTAGENTNAME;
    data['LISTAGENTOFFICE'] = this.lISTAGENTOFFICE;
    data['PICTURE'] = this.pICTURE;
    data['IDCMLSNUMBER'] = this.iDCMLSNUMBER;
    data['SQFT'] = this.sQFT;
    data['BEDS'] = this.bEDS;
    data['IDCREMARKS'] = this.iDCREMARKS;
    data['IDCSTATUS'] = this.iDCSTATUS;
    data['IDCLISTPRICE'] = this.iDCLISTPRICE;
    data['IDCDISPLAYADDRESS'] = this.iDCDISPLAYADDRESS;
    data['MLSPHOTOCOUNT'] = this.mLSPHOTOCOUNT;
    data['IDCPROPERTYTYPE'] = this.iDCPROPERTYTYPE;
    data['BATHSTOTAL'] = this.bATHSTOTAL;
    data['IDCFULLADDRESS'] = this.iDCFULLADDRESS;
    return data;
  }
}
