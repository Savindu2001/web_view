import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // script 
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse('https://amazon.com'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebView App',
      home: SizedBox(
        
        child: Scaffold(
          drawerScrimColor: Colors.red,
          appBar: AppBar(
            title: const Center(child: Text('AMAZON MOBILE APP')),
            backgroundColor: Colors.red[600],
            actions: [
              // bacck button
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () async{
                  if (await controller.canGoBack()){
                    controller.goBack();
                  }
                },
              ),

              // reload button
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () => controller.reload(),
              )
              ],
            
          ),
          body: 
           WebViewWidget(controller: controller),
          
        ),
      ),
    );
  }
}
