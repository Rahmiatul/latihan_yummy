import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PageNotif extends StatelessWidget {
  const PageNotif({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Notification',
          style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text('Normal toast'),
              onTap: () {
                showToast('This is toast',
                    context: context,
                    axis: Axis.horizontal,
                    alignment: Alignment.center,
                    position: StyledToastPosition.bottom);
              },
            ),
            Divider(
              height: 0.5,
            ),

            ListTile(
              title: Text('Permanent toast'),
              onTap: () {
                showToast(
                  'This is a permanent toast',
                  context: context,
                  duration: Duration.zero,
                );
              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('Normal toast full width'),
              onTap: () {
                showToast(
                  'This is normal',
                  context: context,
                  axis: Axis.horizontal,
                  alignment: Alignment.center,
                  position: StyledToastPosition.bottom,
                  borderRadius: BorderRadius.zero,
                  toastHorizontalMargin: 0,
                  fullWidth: true,
                );
              },
            ),
            Divider(
              height: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}