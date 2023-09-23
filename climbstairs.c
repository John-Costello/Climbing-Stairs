#include <stdio.h>

int climbStairs(int n)   // program constraint:  1<=n<=45
{
    int pascalTriangle[46][46];
    pascalTriangle[0][0]=1;
    for(int r=1; r<46; r++)
    {
        pascalTriangle[r][0]=1;
        for(int c=1; c<46; c++) pascalTriangle[r][c]=pascalTriangle[r-1][c-1]+pascalTriangle[r-1][c];
    }

    
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

int main()
{
    int n=45;    // program constraint:  1<=n<=45
    if(n>=1 && n<=45)
    {
        printf("The number of distinct ways of climbing a stairs of %d steps, ", n);
        printf("using one or two step climbs to reach the top is: %d", climbStairs(n));
    }
    return 0;
}