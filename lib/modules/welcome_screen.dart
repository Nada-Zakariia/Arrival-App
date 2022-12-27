import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/login_screen.dart';

class ApisScreen extends StatelessWidget {
  const ApisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              repeat: ImageRepeat.noRepeat,
              image: AssetImage('images/train.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  35,
                ),
                color: Colors.white.withOpacity(0.7),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: const EdgeInsetsDirectional.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Find Your best',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Timing and tickets',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Booking your tickets online with your',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'best searching preferences all over EGYPT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  color: Colors.blue[800]),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              // color: Colors.blueAccent,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  color: Colors.red),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.g_mobiledata,
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue with Google',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  color: Colors.indigo[400]),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginSreen()),
                      );
                    },
                    child: const Text(
                      'log in with email',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    ));
  }
}
