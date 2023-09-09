public class Main
{
    public static void main(String[] args)
    {
        // program constraint:  1<=n<=45
        int n = 45;  
        if(n>=1 && n<=45)
        {
              System.out.println("The number of distinct ways of climbing a stairs of "
              + n +" steps, using one or two step climbs to reach the top is: "
              + new Solution().climbStairs(n)); 
        }
    }
}
