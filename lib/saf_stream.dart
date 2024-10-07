import 'dart:typed_data';

import 'saf_stream_platform_interface.dart';

class SafStream {
  /// Reads the contents of a file from the given [uri] and returns a stream of bytes.
  ///
  /// If [bufferSize] is provided, the stream will read data in chunks of [bufferSize] bytes.
  /// If [start] is provided, the stream will start reading from the given position.
  Future<Stream<Uint8List>> readFileStream(String uri,
      {int? bufferSize, int? start}) async {
    return SafStreamPlatform.instance
        .readFileStream(uri, bufferSize: bufferSize, start: start);
  }

  /// Reads the contents of a file from the given [uri].
  ///
  /// If [start] and [count] are provided, reads [count] bytes starting from [start].
  Future<Uint8List> readFileSync(String uri, {int? start, int? count}) async {
    return SafStreamPlatform.instance
        .readFileSync(uri, start: start, count: count);
  }

  /// Copies a file from the given [src] to a local file [dest].
  Future<void> copyToLocalFile(String src, String dest) async {
    return SafStreamPlatform.instance.copyToLocalFile(src, dest);
  }

  /// Copies the contents of a local file [localSrc] and creates a new file
  /// from the given [treeUri], [fileName] and [mime].
  /// Returns the Uri of the created file.
  ///
  /// If [overwrite] is true, the file will be overwritten if it already exists.
  Future<SafNewFile> pasteLocalFile(
      String localSrc, String treeUri, String fileName, String mime,
      {bool? overwrite}) async {
    return SafStreamPlatform.instance.pasteLocalFile(
        localSrc, treeUri, fileName, mime,
        overwrite: overwrite);
  }

  /// Writes the given [data] to a file identified by the given [treeUri], [fileName] and [mime].
  ///
  /// If [overwrite] is true, the file will be overwritten if it already exists.
  Future<SafNewFile> writeFileSync(
      String treeUri, String fileName, String mime, Uint8List data,
      {bool? overwrite}) async {
    return SafStreamPlatform.instance
        .writeFileSync(treeUri, fileName, mime, data, overwrite: overwrite);
  }

  /// Returns a [SafWriteStreamInfo]. Call [writeChunk] with the [session] from [SafWriteStreamInfo]
  /// to write data into the destination stream. Call [endWriteStream] to close the destination stream.
  Future<SafWriteStreamInfo> startWriteStream(
      String treeUri, String fileName, String mime,
      {bool? overwrite}) async {
    return SafStreamPlatform.instance
        .startWriteStream(treeUri, fileName, mime, overwrite: overwrite);
  }

  /// Writes the given [data] to an out stream identified by the given [session].
  Future<void> writeChunk(String session, Uint8List data) async {
    return SafStreamPlatform.instance.writeChunk(session, data);
  }

  /// Closes an out stream identified by the given [session].
  Future<void> endWriteStream(String session) async {
    return SafStreamPlatform.instance.endWriteStream(session);
  }
}
