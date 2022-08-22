//Timer created by Diniel Shiffman.

class Timer {
  int savedTime;
  int totalTime;
  int passedTime1;


  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }


  void start() {
    savedTime = millis(); // Save the current time to restart the timer!
  }


  boolean isFinished() {
    // Calculate how much time has passed
    int passedTime = millis() - savedTime;
    passedTime1 = passedTime;
    // Has five seconds passed?
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
