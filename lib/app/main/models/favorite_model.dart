class FavoriteModel {
  int _id = 0;
  String _restaurantName = '';
  String _address = '';
  bool _status = false;

  //Constructors
  FavoriteModel(this._id, this._restaurantName, this._address, this._status);

  //Data Encapsulation
  int get id => _id;
  String get restaurantName => _restaurantName;
  String get address => _address;
  bool get status => _status;

  set id(int id) => _id = id;
  set restaurantName(String name) =>
      (_restaurantName = name.length >= 30 ? name.substring(0, 30) : name);
  set address(String address) => _address = address;
  set status(bool status) => _status = status;

  // Create iterator map from model
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['restaurantName'] = _restaurantName;
    map['address'] = _address;
    map['status'] = _status;

    if (_id != 0) map['_id'] = _id;

    return map;
  }

  /// Funtion that transform dynamic obj to FavoriteModel
  FavoriteModel.fromObject(dynamic obj) {
    _id = obj['id'];
    _restaurantName = obj['restaurantName'];
    _address = obj['address'];
    _status = obj['status'];
  }
}
