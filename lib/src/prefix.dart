part of ip2country;

/// Retreive the cidr prefix to which an IP address belongs.
/// This is an IPv4 specific transformation.
///
///
/// The [ip] can be passed as a string ('192.168.1.1').
///
/// [cidr], the number of bytes to keep. 32 keeps all bytes while 0 removes all bytes.
int prefix(String ip, int cidr) {
  final bytes = ip.split('.').map((e) => int.parse(e)).toList();

  if (bytes.length != 4) {
    throw Exception('Invalid IP Address.');
  }

  final u8list = Uint8List.fromList(bytes);
  ByteData byteData = ByteData.sublistView(u8list);
  final subnet = byteData.getUint32(0, Endian.big);

  // Handle shift edge cases in javascript
  if (cidr == 0) {
    return 0;
  } else if (cidr == 1) {
    return subnet >= 2147483648 ? 2147483648 : 0;
  } else {
    final bytes = subnet % (1 << (32 - cidr));
    return subnet - bytes;
  }
}

/// Retreive the cidr prefix to which an IP address belongs.
/// This is an IPv4 specific transformation.
///
///
/// The [ip] can be passed as a long numeric representation.
///
/// [cidr], the number of bytes to keep. 32 keeps all bytes while 0 removes all bytes.
int prefixLong(int ip, int cidr) {
  final subnet = ip;

  // Handle shift edge cases in javascript
  if (cidr == 0) {
    return 0;
  } else if (cidr == 1) {
    return subnet >= 2147483648 ? 2147483648 : 0;
  } else {
    final bytes = subnet % (1 << (32 - cidr));
    return subnet - bytes;
  }
}
