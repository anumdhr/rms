import 'package:get/get.dart';

class CountController extends GetxController {
  var count = 0.obs;
  var pressed = 0.obs;
  var count1 = 0.obs;
  var count2 = 0.obs;
   var  tabIndex=0.obs;
   var setIndex=0.obs;
   var kitchenIndex = 0.obs;
   var chefIndex = 0.obs;
   var flavorIndex = 0.obs;
   var foodProviderIndex = 0.obs;
   var isObscureText= true.obs;



   onObscureTextPressed(){
     isObscureText.value = !isObscureText.value;
   }
  void increment() {
    count.value++;
  }

  void decrement() {
    count.value--;
  }

  void increment1() {
    if (count1.value < count.value) {
      count1.value++;
    }
  }
  void decrement1() {
    if (count1.value > 0) {
      count1.value--;
    }
  }

  void increment2() {
    count2.value++;
  }

  void decrement2() {
    count2.value--;
  }

  void onreset() {
    count1.value = 0;
    pressed.value = 0;
    count.value = 0;
  }

  isPressed() {
    pressed.value = 1;
    pressed.value = 2;
  }
}
