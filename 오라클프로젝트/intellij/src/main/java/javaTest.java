import java.io.File;
import java.io.IOException;
import java.util.Scanner;


public class javaTest {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(new File("d:\\file.txt"));
        while (scanner.hasNextLine()) {
            String str = scanner.nextLine();
            System.out.println(str);


        }


    }
}