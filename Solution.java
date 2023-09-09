class Solution
{
    static int[][] pascalTriangle= new int[46][46];
    static{
        pascalTriangle[0][0]=1;
        for(int r=1; r<46; r++)
        {
           pascalTriangle[r][0]=1;
           for(int c=1; c<46; c++) pascalTriangle[r][c]=pascalTriangle[r-1][c-1]+pascalTriangle[r-1][c];
        }
    }
    
    // program constraint:  1<=n<=45
    public int climbStairs(int n){
        int maxNumOfTwoStepClimbs=(n%2==0)?(n/2):(n-1)/2;  
        int sum=0;
        for(int j=0,i=n-2*j,row,col;j<=maxNumOfTwoStepClimbs;j++,i=n-2*j)
        {
            row=i+j;
            col=i;
            sum+=pascalTriangle[row][col];
        }
        return sum;            
    }
}
