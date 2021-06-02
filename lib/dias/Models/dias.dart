
class Todo {

	int _id;
	String _games;
	String _server1;
  String _dias;
	String _date;

	Todo(this._games, this._dias, this._date, [this._server1] );

	Todo.withId(this._id, this._games, this._dias, this._date, [this._server1]);

	int get id => _id;

  String get games => _games;

  String get dias => _dias;

	String get server1 => _server1;

	String get date => _date;

  set games(String newGames){
    if (newGames.length <= 25) {
      this._games =newGames;
    }
  }

	set dias(String newDias) {
		if (newDias.length <= 25) {
			this._dias = newDias;
		}
	}

	set server1(String newserver1) {
		if (newserver1.length <= 25) {
			this._server1 = newserver1;
		}
	}

	set date(String newDate) {
		this._date = newDate;
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['games'] = _games;
		map['server1'] = _server1;
    map['dias'] = _dias;
		map['date'] = _date;

		return map;
	}

	// Extract a Note object from a Map object
	Todo.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._games= map['games'];
		this._server1 = map['server1'];
    this._dias= map['dias'];
		this._date = map['date'];
	}
}









