class LinkParamns2kd7py {
  const LinkParamns2kd7py({
    required this.name,
    required this.getValue,
  });

  final String name;
  final Future<String?> Function() getValue;

  Future<String> get param async => '$name=${await getValue()}';
}
