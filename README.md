[![pub package](https://img.shields.io/pub/v/ip2country.svg)](https://pub.dartlang.org/packages/ip2country)

Standalone and fully offline IP-to-Country lookup table and CIDR prefix finder.

The database is updated as of 2023-Mar-16.

## Getting Started

In your `pubspec.yaml` file add:

```yaml
dependencies:
  ip2country: any
```

Then, in your code import:

```dart
import 'package:ip2country/ip2country.dart';
```

Here is a full example:

```dart
import 'package:ip2country/ip2country.dart';

void main() {
  final country = lookup('192.199.248.75');
  print(country); //US
}
```
