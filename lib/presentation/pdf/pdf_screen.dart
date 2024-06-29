import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PDFScreen extends StatefulWidget {
  final String url;

  const PDFScreen({super.key, required this.url});

  @override
  PDFScreenState createState() => PDFScreenState();
}

class PDFScreenState extends State<PDFScreen> {
  String? localPath;
  double downloadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _downloadAndSavePdf(widget.url);
  }

  Future<void> _downloadAndSavePdf(String url) async {
    try {
      final request = http.Request('GET', Uri.parse(url));
      final response = await http.Client().send(request);

      final totalBytes = response.contentLength;
      var bytesReceived = 0;
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/temp.pdf');
      final raf = file.openSync(mode: FileMode.write);

      response.stream.listen((chunk) {
        bytesReceived += chunk.length;
        raf.writeFromSync(chunk);
        setState(() {
          downloadProgress = bytesReceived / totalBytes!;
        });
      }, onDone: () async {
        await raf.close();
        setState(() {
          localPath = file.path;
        });
      }, onError: (e) {
        print("Error downloading PDF: $e");
      });
    } catch (e) {
      print("Error downloading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Viewer')),
      body: localPath != null
          ? PDFView(
        filePath: localPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (pages) {
          setState(() {});
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Downloading PDF...'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(value: downloadProgress),
          ),
        ],
      ),
    );
  }
}
