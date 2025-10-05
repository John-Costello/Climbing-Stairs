const std = @import("std");
const N=45;    // Number of steps that the stairs has.

pub fn main() !void {
   const n:u8=N;       // program constraint:  1<=n<=45
   if(n>=1 and n<=N) {
        std.debug.print("The number of distinct ways of climbing a stairs of {any} steps, \n", .{n});
        std.debug.print("using one or two step climbs to reach the top is: {any}.\n", .{climb_stairs(n)});
    } else {
        std.debug.print("The stairs has a number of steps between 1 and 45.\n", .{});
    }
}

fn climb_stairs(n: u8) u64 {
   var pascals_triangle: [N+1][N+1]u64 = .{.{0} ** (N+1)} ** (N+1);  // Initialize as zeros.
   pascals_triangle[0][0]=1;
   for(1..N+1)|r|{
      pascals_triangle[r][0]=1;
      for(1..N+1)|c|{
         pascals_triangle[r][c]=pascals_triangle[r-1][c-1]+pascals_triangle[r-1][c];
      }
   }
   var max_num_of_two_step_climbs:u8 = undefined;
   if(n%2==0){
      max_num_of_two_step_climbs = n/2;
   } else {
      max_num_of_two_step_climbs = (n-1)/2;
   }  
   var i:u8 = undefined;
   var j:u8 = 0;
   var row:u8 = undefined;
   var col:u8 = undefined;
   var sum:u64 = 0;
   while(j<=max_num_of_two_step_climbs):(j+=1){
      i=n-2*j;
      row=i+j;
      col=i;
      sum += pascals_triangle[row][col];
   }
   return sum; 
}

