// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class Timerpf extends StatefulWidget {
//   const Timerpf({super.key});
//
//   @override
//   State<Timerpf> createState() => _TimerpfState();
// }
//
// class _TimerpfState extends State<Timerpf> {
//
//   final TextEditingController controller = TextEditingController();
//   //defining a constant time for timer
//   static const maxSeconds = 110;
//   int seconds = maxSeconds;
//   Timer? timer;
//
//
//   //startTimer starts the timer
//   void startTimer({bool reset = true}) {
//     if (reset) {
//       resetTimer();
//     }
//     timer = Timer.periodic(
//       const Duration(seconds: 1),
//           (t) {
//         if (seconds > 0) {
//           setState(() {
//             seconds--;
//           });
//         } else {
//           stopTimer(reset: false);
//         }
//       },
//     );
//   }
//
//
//   //stopTimer is used to either stop the timer from ticking down or to reset the timer
//   //which is based on the button that is clicked
//   void stopTimer({bool reset = true}) {
//     if (reset) {
//       resetTimer();
//     }
//     setState(() {
//       timer?.cancel();
//     });
//   }
//
//
//   //resetTimer resets the value of seconds(currently running down towards 0) to the initial value
//   //which is maxSeconds
//   void resetTimer() {
//     setState(() {
//       seconds = int.parse(controller.text);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(35),
//                 child: TextField(
//                   controller: controller,
//                   keyboardType: TextInputType.number,
//                   onSubmitted: (value) {
//                     setState(() {
//                       seconds = int.parse(controller.text);
//                     });
//                   },
//                 ),
//               ),
//               buildTimer(),
//               const SizedBox(height: 40),
//               buildButtons(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildButtons() {
//     final isRunning = timer == null ? false : timer!.isActive;
//     final isCompleted = seconds == maxSeconds || seconds == 0;
//
//     //if isRunning is true or isCompleted is false then row part is shown
//     //while on contrary start button is shown
//     return isRunning || !isCompleted
//         ? Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ButtonWidget(
//           text: isRunning ? 'Pause' : 'Resume',
//           onClicked: () {
//             if (isRunning) {
//               stopTimer(reset: false);
//             } else {
//               startTimer(reset: false);
//             }
//           },
//           backgroundColor: Colors.teal,
//         ),
//         const SizedBox(width: 15),
//         ButtonWidget(
//           text: 'Reset',
//           onClicked: () {
//             stopTimer();
//           },
//           backgroundColor: Colors.teal,
//         )
//       ],
//     )
//         : ButtonWidget(
//       text: 'Start',
//       onClicked: () {
//         startTimer();
//       },
//       backgroundColor: Colors.orangeAccent,
//     );
//   }
//
//   Widget buildTimer() => SizedBox(
//     height: 180,
//     width: 180,
//     child: Stack(
//       fit: StackFit.expand,
//       children: [
//         CircularProgressIndicator(
//           valueColor: const AlwaysStoppedAnimation(Colors.white),
//           value: seconds / maxSeconds,
//           backgroundColor: Colors.teal,
//         ),
//         Center(
//           child: buildTime(),
//         ),
//       ],
//     ),
//   );
//
//   Widget buildTime() {
//
//     //this condition is held to indicate that the timer is stopped
//     if (seconds == 0) {
//       return const Icon(
//         Icons.done,
//         color: Colors.teal,
//         size: 75,
//       );
//     } else {
//
//       //  ~ means truncating. eg: 7 ~/ 3 gives 2 that means quotient is 2 when 7/3
//       final hours = seconds ~/ 3600;
//       final minutes = seconds ~/ 60;
//       final remainingSeconds = seconds % 60;
//
//       //if the second is less than 10 then it shows 0 infront of every displaying number as 09,08 to 00
//       final showSeconds = remainingSeconds < 10
//           ? '0$remainingSeconds'
//           : '$remainingSeconds';
//       final showHours = hours < 10 ? '0$hours' : '$hours';
//       final showMinutes = minutes < 10 ? '0$minutes' : '$minutes';
//
//       //to show seconds only if time is less than 1 min and
//       //both minutes and seconds if the time is more than 1 min
//       final timeStr = hours > 0
//           ? '${showHours}hr :${showMinutes}min :${showSeconds}sec'
//           : '${showMinutes}min :${showSeconds}sec';
//       return Text(
//         timeStr,
//         style: const TextStyle(
//           fontSize: 30,
//         ),
//       );
//     }
//   }
// }
//
//
//
// class ButtonWidget extends StatelessWidget {
//   const ButtonWidget({
//     super.key,
//     required this.text,
//     required this.onClicked,
//     required this.backgroundColor,
//   });
//
//   final String text;
//   final Color backgroundColor;
//   final void Function()? onClicked;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor,
//       ),
//       onPressed: onClicked,
//       child: Text(text),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int second= 120;
 Timer? timer;
 @override
  void initState() {
    startTimer();
    super.initState();
  }
  void resetTimer(){
    setState(() {
      second=120;
    });
  }
  void startTimer(){

      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (second > 0) {
          setState(() {
            second--;
          });
        } else {
          timer.cancel();
        }
      });

  }

  @override
  Widget build(BuildContext context) {
    int minutes = second ~/ 60;
    int seconds = second % 60;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Didn’t receive a code?',
              style: TextStyle(
                color: const Color(0xff831529).withOpacity(0.7),
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            if (second == 0)
              InkWell(
                onTap: () {
                  resetTimer();
                  startTimer();
                },
                child: const Text(
                  'Resend',
                  style: TextStyle(
                    color: Color(0xffF6921E),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Eligible in ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xff831529),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff831529),
              ),
            )
          ],
        ),
      ],
    );
  }
}
