class Struc {
  String _name, _link, _about;
  double _rating;
  Struc(
    this._name,
    this._rating,
    this._link,
    this._about,
  );
  get name => _name;
  get link => _link;
  get about => _about;
  get rating => _rating;
}
