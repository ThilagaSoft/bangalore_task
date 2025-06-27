class Country {
  final String cca2;
  final Flag flags;
  final CountryName name;

  Country({
    required this.cca2,
    required this.flags,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      cca2: json['cca2'] ?? '',
      flags: Flag.fromJson(json['flags'] ?? {}),
      name: CountryName.fromJson(json['name'] ?? {}),
    );
  }
}

class Flag {
  final String png;
  final String svg;
  final String alt;

  Flag({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory Flag.fromJson(Map<String, dynamic> json) {
    return Flag(
      png: json['png'] ?? '',
      svg: json['svg'] ?? '',
      alt: json['alt'] ?? '',
    );
  }
}

class CountryName {
  final String common;
  final String official;
  final NativeName? nativeName;

  CountryName({
    required this.common,
    required this.official,
    this.nativeName,
  });

  factory CountryName.fromJson(Map<String, dynamic> json) {
    return CountryName(
      common: json['common'] ?? '',
      official: json['official'] ?? '',
      nativeName: json['nativeName'] != null
          ? NativeName.fromJson(json['nativeName'])
          : null,
    );
  }
}

class NativeName {
  final Map<String, LocalName> names;

  NativeName({
    required this.names,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) {
    final map = <String, LocalName>{};
    json.forEach((key, value) {
      map[key] = LocalName.fromJson(value ?? {});
    });
    return NativeName(names: map);
  }
}

class LocalName {
  final String official;
  final String common;

  LocalName({
    required this.official,
    required this.common,
  });

  factory LocalName.fromJson(Map<String, dynamic> json) {
    return LocalName(
      official: json['official'] ?? '',
      common: json['common'] ?? '',
    );
  }
}
