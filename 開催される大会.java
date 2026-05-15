package track;

public class App {
	public static void exercise(int start, int end) {
    int counter = 1;
    for (int i = start; i< end; i++){

      if (i % 8 != 0 || (i % 8 == 0 && i % 100 == 20)){
        System.out.print("No.");
        System.out.print(counter);
        System.out.print(" in ");
        System.out.println(i);
        counter ++;
      }

    }
	}


}
