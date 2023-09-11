class ListDatamodel {
  String? date;
  String? localName;
  String? name;
  String? countryCode;
  bool? fixed;
  bool? global;
  Null? counties;
  Null? launchYear;
  List<String>? types;

  ListDatamodel(
      {this.date,
        this.localName,
        this.name,
        this.countryCode,
        this.fixed,
        this.global,
        this.counties,
        this.launchYear,
        this.types});

  ListDatamodel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    localName = json['localName'];
    name = json['name'];
    countryCode = json['countryCode'];
    fixed = json['fixed'];
    global = json['global'];
    counties = json['counties'];
    launchYear = json['launchYear'];
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['localName'] = this.localName;
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    data['fixed'] = this.fixed;
    data['global'] = this.global;
    data['counties'] = this.counties;
    data['launchYear'] = this.launchYear;
    data['types'] = this.types;
    return data;
  }
}
