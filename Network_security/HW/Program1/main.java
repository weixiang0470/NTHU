import java.util.Scanner;

public class EEuclidean_algorithm {

    private static int t1=0,t2=1;

    public static int gcd(int a, int b){
        if(b==0){
            return a;
        }
        return gcd(b,a%b);
    }

    public static int[] EEuclidean_gcd(int a, int b){
        if (b==0){
            return new int[] {a,t1}; // gcd,t1
        }
        int q = a/b;
        int t = t1 - (q*t2);
        t1 = t2;
        t2 = t;
        //System.out.print("a:"+a+" b:"+b+" t1:"+t1 + " t2:"+t2+" t:" + t + "\n");
        return EEuclidean_gcd(b,a%b);

    }

    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);

        //System.out.print("Enter b : ");
        int b = Integer.parseInt(args[0]);
        //System.out.print("Enter n : ");
        int n = Integer.parseInt(args[1]);//scanner.nextInt();
        int[] ans = EEuclidean_gcd(n,b);
        if(ans[0] != 1){
            System.out.print("Doesn't exit multiplicative inverse\n");
            //System.out.print("gcd("+b+","+n+")"+ " is not 1, there is no multiplicative inverse of "+b+"\n");
        }
        else{
            while(ans[1]<0){
                ans[1]= (ans[1] + n) % n;
            }
            System.out.print("The multiplicative inverse of "+b+ " modulo "+n+" = " + ans[1]+ "\n");
        }
    }
}