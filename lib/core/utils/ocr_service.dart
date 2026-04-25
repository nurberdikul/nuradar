import 'dart:io';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OCRService {
  // final TextRecognizer _textRecognizer = TextRecognizer(
  //   script: TextRecognitionScript.latin,
  // );

  Future<String> recognizeText(File imageFile) async {
    // TEMPORARILY DISABLED due to arm64 simulator issues
    /*
    final InputImage inputImage = InputImage.fromFile(imageFile);
    final RecognizedText recognizedText = await _textRecognizer.processImage(
      inputImage,
    );

    String text = recognizedText.text;

    // Clean up text if needed (e.g. remove extra newlines)
    text = text.replaceAll('\n', ' ').trim();

    return text;
    */
    return '';
  }

  void dispose() {
    // _textRecognizer.close();
  }
}
