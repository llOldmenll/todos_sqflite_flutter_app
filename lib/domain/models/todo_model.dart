class Todo{
  String _title;
  String _description;
  num _creationDate;

  Todo(this._title, this._description, this._creationDate);

  num get creationDate => _creationDate;

  set creationDate(num value) {
    _creationDate = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

}