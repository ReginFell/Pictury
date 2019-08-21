class Sort {
  final value;

  const Sort._internal(this.value);

  toString() => 'Sort.$value';

  static const VIRAL = const Sort._internal('viral');
  static const TOP = const Sort._internal('top');
  static const TIME = const Sort._internal('time');
  static const RISING = const Sort._internal('rising');
}
