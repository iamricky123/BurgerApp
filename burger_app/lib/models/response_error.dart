

class ResponseError {
  String? resCode;
  String? resMsg;
  String? result;

  ResponseError({
    this.resCode,
    this.resMsg,
    this.result
  });

  ResponseError.fromJson(Map<String, dynamic> json) {
    resCode = json['resCode'];
    resMsg = json['resMsg'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resCode'] = this.resCode;
    data['resMsg'] = this.resMsg;
    data['result'] = this.result;
    return data;
  }
}