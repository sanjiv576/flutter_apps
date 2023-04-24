class ChangeName {
  int _indexCounter = 0;
  final List<String> _nameList = ['Sanjiv', 'John', "Angela"];

  int _totalLength() => _nameList.length;

  String getName() {
    String targetName = _nameList[_indexCounter];
    _changeIndex();
    return targetName;
  }

  void _changeIndex() {
    if (_indexCounter == _totalLength() - 1) {
      _indexCounter = 0;
    } else {
      _indexCounter++;
    }
  }
}
