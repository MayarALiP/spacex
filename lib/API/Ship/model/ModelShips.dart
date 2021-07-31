class ModelLanuches{

  String _name;
  bool _active;
  String _type;
  String _id ;

  ModelLanuches.fromAPI(dynamic jason)
  {
    _name =jason["name"];
    _active=jason["active"];
    _id = jason["id"];
    _type = jason["type"];

  }

  String get id => _id;

  bool get active => _active;

  String get name => _name;

  String get type => _type;
}