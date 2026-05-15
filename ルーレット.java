package track;

public class App {

    public int checkNumber(int[] chooseNumber, int[] winningNumber) {
      
      int counter = 0;

      for (int i = 0; i < chooseNumber.length ; i ++){
        for (int j = 0; j < winningNumber.length ; j ++){
           if (chooseNumber[i] == winningNumber[j]){
            counter = counter + 1;
            break;
           } 
        }
      }
      return counter;
    }
}
