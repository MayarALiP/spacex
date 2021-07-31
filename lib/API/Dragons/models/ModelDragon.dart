class ModelShips{

  String _name;
  String _type ;
  String _description;
  bool _active;
  int _crewCapacity;
  dynamic _orbitDurationYear;
  String _id ;
  List<String> _flickrImages;

  ModelShips.fromAPI(dynamic jason)
  {
    _name =jason["name"];
    _type =jason["type"];
    _active=jason["active"];
    _description=jason["description"];
    _crewCapacity= jason["crew_capacity"];
    _orbitDurationYear=jason["orbitDurationYear"];
    _id = jason["id"];
    _flickrImages = jason["flickr_images"] != null? jason["flickr_images"].cast<String>():[] ;
  }

  String get id => _id;

  String get description => _description;

  dynamic get orbitDurationYear => _orbitDurationYear;

  int get crewCapacity => _crewCapacity;

  bool get active => _active;

  String get type => _type;

  String get name => _name;

  List<String> get flickrImages => _flickrImages;
}