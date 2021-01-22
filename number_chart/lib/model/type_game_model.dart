class GameInfo{

  String _typeGame;
  int _ratio;
  int _totalPoint;

  GameInfo({String typeGame, int ratio, int totalPoint}){
    this._typeGame = typeGame;
    this._ratio = ratio;
    this._totalPoint = totalPoint;
  }

  String get typeGame => _typeGame;

  set typeGame(String value) {
    _typeGame = value;
  }

  int get totalPoint => _totalPoint;

  int get ratio => _ratio;

  set ratio(int value) {
    _ratio = value;
  }

  set totalPoint(int totalPoint) {
    _totalPoint = totalPoint;
  }


}