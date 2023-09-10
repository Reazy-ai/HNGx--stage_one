import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late InAppWebViewController _controller;
  final InAppWebViewGroupOptions _options = InAppWebViewGroupOptions();

  double _progress = 0;

  void updateProgress(int progress) {
    setState(() {
      _progress = progress.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await _controller.canGoBack();

        if (isLastPage) {
          _controller.goBack();
          return false;
        }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              InAppWebView(
                onWebViewCreated: (controller) {
                  _controller = controller;
                },
                initialOptions: _options,
                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://github.com/Reazy-ai")),
                onLoadStart: (controller, url) {},
                onProgressChanged: (controller, progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1.0
                  ? LinearProgressIndicator(value: _progress)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
