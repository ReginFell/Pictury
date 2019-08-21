class Section {
  final value;

  const Section._internal(this.value);

  toString() => 'Section.$value';

  static const HOT = const Section._internal('hot');
  static const TOP = const Section._internal('top');
  static const USER = const Section._internal('user');
}
