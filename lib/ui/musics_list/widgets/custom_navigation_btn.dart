import 'package:flutter/material.dart';
import 'package:yacoode/ui/splash/splash_home.dart';

ElevatedButton myElevatedButton(String theText, Function theFunction) {
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 89, 119, 164)),
    ),
    onPressed: () => theFunction(),
    child: Text(theText,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        )),
  );
}

typedef ButtonCallback = void Function(); // Define callback function type

class MyNBtn extends StatefulWidget {
  final ButtonCallback onPressed; // Required callback parameter

  const MyNBtn({required this.onPressed, super.key});

  @override
  _MyNBtnState createState() => _MyNBtnState();
}

class _MyNBtnState extends State<MyNBtn> {
  bool showButton = true;
  bool isLoading = false;

  void handleButtonPress() {
    // Your existing function logic here
    print('Button pressed!');

    setState(() {
      showButton = false;
      isLoading = true;
    });

    // Perform your asynchronous operation here (e.g., network request)
    Future.delayed(const Duration(seconds: 30), () {
      setState(() {
        showButton = true;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showButton)
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 89, 119, 164),
              ),
            ),
            onPressed: () {
              handleButtonPress();
              widget.onPressed();
            }, // Use widget.onPressed for required function
            child: const Text(
              'add Media',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          )
        else if (isLoading)
          const CircularProgressIndicator()
        else
          const SizedBox.shrink(),
      ],
    );
  }
}

goToSplash(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => const SplashHomePage(
        // title: 'play',
        ),
  ));
}
