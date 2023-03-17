part of ip2country;

/// return the country owning an arbitrary IP address or
/// 'ZZ' if it could not be determined.
///
/// This method relies on the existance of a lookup table, named 'table',
/// which should be a dictionary where keys are subnet prefixes, which map
/// to an object keyed by CIDR and valued with countries.
String lookup(String ip, {Map<String, String> table = _table}) {
  var cidr = 32;
  var subnet = prefix(ip, cidr);

  while (cidr > 0) {
    final result = table['$subnet/$cidr'];
    if (result != null) {
      return result;
    }
    cidr -= 1;
    subnet = prefixLong(subnet, cidr);
  }
  return 'ZZ';
}

/// return the country owning an arbitrary IP address or
/// 'ZZ' if it could not be determined.
///
/// This method relies on the existance of a lookup table, named 'table',
/// which should be a dictionary where keys are subnet prefixes, which map
/// to an object keyed by CIDR and valued with countries.
String lookupLong(int ip, {Map<String, String> table = _table}) {
  var cidr = 32;
  var subnet = prefixLong(ip, cidr);

  while (cidr > 0) {
    final result = table['$subnet/$cidr'];
    if (result != null) {
      return result;
    }
    cidr -= 1;
    subnet = prefixLong(subnet, cidr);
  }
  return 'ZZ';
}
