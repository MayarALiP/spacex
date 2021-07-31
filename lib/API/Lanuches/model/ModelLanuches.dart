class ModelLanuches {

  String _name;
  bool _active;
  String _type;

  ModelLanuches.fromAPI(dynamic jason)
  {
    _name = jason["name"];
    _active = jason["active"];
    _type = jason["type"];
  }


  String get type => _type;

  bool get active => _active;

  String get name => _name;
}