// Solves sequentially problems in a specirfied range
// usage: dart bin/batch.dart 1 43
// arguments are starting and ending problem number
import 'dart:io';

const int minPb = 1;
const int maxPb = 900;
const int nbPerFolder = 25;

void main(List<String> arguments) async {
  int? pbStart;
  int? pbEnd;
  if (arguments.length >= 2) {
    pbStart = int.tryParse(arguments[0]);
    pbEnd = int.tryParse(arguments[1]);
  }
  if ((pbStart == null) ||
      (pbEnd == null) ||
      (pbStart < 1) ||
      (pbEnd < pbStart)) {
    print('Usage: dart bin/batch.dart 1 25');
    print('arguments are starting and ending problem number');
    return;
  }

  // execute a shell 'dart run' on each day[1-25] and each part[1-2] until an error is encountered
  for (int i = pbStart; i <= pbEnd; i++) {
    int firstFolder = (((i - 1) ~/ nbPerFolder) * nbPerFolder) + 1;
    String folder =
        '${firstFolder.toString().padLeft(3, '0')}-${(firstFolder + nbPerFolder - 1).toString().padLeft(3, '0')}';
    String file = './bin/$folder/euler${i.toString().padLeft(3, '0')}.dart';
    if (File(file).existsSync()) {
      ProcessResult results = await Process.run('dart', [file],
          runInShell: true, workingDirectory: '.');
      if (results.exitCode != 0) {
        print(results.stderr);
        exit(-1);
      } else {
        print(results.stdout);
      }
    }
  }
}
