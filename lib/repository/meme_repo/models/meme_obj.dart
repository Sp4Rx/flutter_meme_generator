/// imageUrl : "https://www.memeatlas.com/images/templates/drake-hotline-bling-meme-template.jpg"
/// texts : [{"textData":"Demo1","xPos":230,"yPos":50,"maxWidth":24,"maxHeight":24,"style":"Roboto","fontSize":12,"hAlignment":"center","vAlignment":"center","opacity":1,"foregroundColor":"#000000","bgColor":"#FFFFFF"},{"textData":"Demo2","xPos":230,"yPos":230,"maxWidth":24,"maxHeight":24,"style":"Roboto","fontSize":12,"hAlignment":"center","vAlignment":"center","opacity":1,"foregroundColor":"#000000","bgColor":"#FFFFFF"}]
/// id : "1"

class MemeObj {
  MemeObj({
    String? imageUrl,
    List<MemeTextObj>? texts,
    String? id,
  }) {
    _imageUrl = imageUrl;
    _texts = texts;
    _id = id;
  }

  MemeObj.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    if (json['texts'] != null) {
      _texts = [];
      json['texts'].forEach((v) {
        _texts?.add(MemeTextObj.fromJson(v));
      });
    }
    _id = json['id'];
  }
  String? _imageUrl;
  List<MemeTextObj>? _texts;
  String? _id;
  MemeObj copyWith({
    String? imageUrl,
    List<MemeTextObj>? texts,
    String? id,
  }) =>
      MemeObj(
        imageUrl: imageUrl ?? _imageUrl,
        texts: texts ?? _texts,
        id: id ?? _id,
      );
  String? get imageUrl => _imageUrl;
  List<MemeTextObj>? get texts => _texts;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    if (_texts != null) {
      map['texts'] = _texts?.map((v) => v.toJson()).toList();
    }
    map['id'] = _id;
    return map;
  }

  @override
  String toString() {
    return 'MemeObj{_imageUrl: $_imageUrl, _texts: $_texts, _id: $_id}';
  }
}

/// textData : "Demo1"
/// xPos : 230
/// yPos : 50
/// maxWidth : 24
/// maxHeight : 24
/// style : "Roboto"
/// fontSize : 12
/// hAlignment : "center"
/// vAlignment : "center"
/// opacity : 1
/// foregroundColor : "#000000"
/// bgColor : "#FFFFFF"

class MemeTextObj {
  MemeTextObj({
    String? textData,
    int? xPos,
    int? yPos,
    int? maxWidth,
    int? maxHeight,
    String? style,
    int? fontSize,
    String? hAlignment,
    String? vAlignment,
    int? opacity,
    String? foregroundColor,
    String? bgColor,
  }) {
    _textData = textData;
    _xPos = xPos;
    _yPos = yPos;
    _maxWidth = maxWidth;
    _maxHeight = maxHeight;
    _style = style;
    _fontSize = fontSize;
    _hAlignment = hAlignment;
    _vAlignment = vAlignment;
    _opacity = opacity;
    _foregroundColor = foregroundColor;
    _bgColor = bgColor;
  }

  MemeTextObj.fromJson(dynamic json) {
    _textData = json['textData'];
    _xPos = json['xPos'];
    _yPos = json['yPos'];
    _maxWidth = json['maxWidth'];
    _maxHeight = json['maxHeight'];
    _style = json['style'];
    _fontSize = json['fontSize'];
    _hAlignment = json['hAlignment'];
    _vAlignment = json['vAlignment'];
    _opacity = json['opacity'];
    _foregroundColor = json['foregroundColor'];
    _bgColor = json['bgColor'];
  }
  String? _textData;
  int? _xPos;
  int? _yPos;
  int? _maxWidth;
  int? _maxHeight;
  String? _style;
  int? _fontSize;
  String? _hAlignment;
  String? _vAlignment;
  int? _opacity;
  String? _foregroundColor;
  String? _bgColor;
  MemeTextObj copyWith({
    String? textData,
    int? xPos,
    int? yPos,
    int? maxWidth,
    int? maxHeight,
    String? style,
    int? fontSize,
    String? hAlignment,
    String? vAlignment,
    int? opacity,
    String? foregroundColor,
    String? bgColor,
  }) =>
      MemeTextObj(
        textData: textData ?? _textData,
        xPos: xPos ?? _xPos,
        yPos: yPos ?? _yPos,
        maxWidth: maxWidth ?? _maxWidth,
        maxHeight: maxHeight ?? _maxHeight,
        style: style ?? _style,
        fontSize: fontSize ?? _fontSize,
        hAlignment: hAlignment ?? _hAlignment,
        vAlignment: vAlignment ?? _vAlignment,
        opacity: opacity ?? _opacity,
        foregroundColor: foregroundColor ?? _foregroundColor,
        bgColor: bgColor ?? _bgColor,
      );
  String? get textData => _textData;
  int? get xPos => _xPos;
  int? get yPos => _yPos;
  int? get maxWidth => _maxWidth;
  int? get maxHeight => _maxHeight;
  String? get style => _style;
  int? get fontSize => _fontSize;
  String? get hAlignment => _hAlignment;
  String? get vAlignment => _vAlignment;
  int? get opacity => _opacity;
  String? get foregroundColor => _foregroundColor;
  String? get bgColor => _bgColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textData'] = _textData;
    map['xPos'] = _xPos;
    map['yPos'] = _yPos;
    map['maxWidth'] = _maxWidth;
    map['maxHeight'] = _maxHeight;
    map['style'] = _style;
    map['fontSize'] = _fontSize;
    map['hAlignment'] = _hAlignment;
    map['vAlignment'] = _vAlignment;
    map['opacity'] = _opacity;
    map['foregroundColor'] = _foregroundColor;
    map['bgColor'] = _bgColor;
    return map;
  }

  @override
  String toString() {
    return 'MemeTextObj{_textData: $_textData, _xPos: $_xPos, _yPos: $_yPos, _maxWidth: $_maxWidth, _maxHeight: $_maxHeight, _style: $_style, _fontSize: $_fontSize, _hAlignment: $_hAlignment, _vAlignment: $_vAlignment, _opacity: $_opacity, _foregroundColor: $_foregroundColor, _bgColor: $_bgColor}';
  }
}
