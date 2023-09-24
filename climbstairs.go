package main

import "fmt"

func climbStairs(n int) int {    // program constraint:  1<=n<=45
    var pascalTriangle[46][46] int
    pascalTriangle[0][0]=1  
    for r:=1; r<46; r++{
        pascalTriangle[r][0]=1
        for c:=1; c<46; c++{
            pascalTriangle[r][c]=pascalTriangle[r-1][c-1]+pascalTriangle[r-1][c]
        }
    }

    var maxNumOfTwoStepClimbs int
    if (n%2==0){
        maxNumOfTwoStepClimbs=(n/2)    
    } else {
        maxNumOfTwoStepClimbs=((n-1)/2)    
    }
    var i, j, row, col, sum int
    j=0
    i=n-2*j
    sum=0
    for j<=maxNumOfTwoStepClimbs {
        row=i+j
        col=i
        sum += pascalTriangle[row][col]
        j++;
        i=n-2*j; 
    }
    return sum
}

func main(){
    n := 45   // program constraint:  1<=n<=45
    if n>=1 && n<=45{
        fmt.Printf("The number of distinct ways of climbing a stairs of %d steps, ", n)
        fmt.Printf("using one or two step climbs to reach the top is: %d", climbStairs(n));
    }
}