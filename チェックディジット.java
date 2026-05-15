package track;

public class Main {

    public static String addDigit(String num){

      int N5 = 5*(num.charAt(0) - '0') + 4*(num.charAt(1)- '0') + 3*(num.charAt(2)- '0') + 2*(num.charAt(3)- '0');
      N5 %= 9;
      if (N5 % 6 == 0){
        N5 = 1;
      } else {
        if (N5 % 2 == 0){
          N5 /= 2;
        }
        if (N5 == 1){
          N5 = 0;
        }
      }
      return num + String.valueOf(N5);
    }
    public static void main(String[] args) {
        for (String s : args){
          System.out.println(addDigit(s));
        }
    } 
}
