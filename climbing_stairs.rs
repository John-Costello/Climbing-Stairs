const N:usize=45;  // Number of steps that the stairs has.
const N_PLUS_ONE:usize=N+1;

fn main() {
    let n=N;    // program constraint:  1<=n<=45
    if n>=1 && n<=N {
        println!("The number of distinct ways of climbing a stairs of {} steps, ", n);
        println!("using one or two step climbs to reach the top is: {}.", climb_stairs(n))
    } else {
        println!("The stairs has a number of steps between 1 and 45.");
    }
}

fn climb_stairs(n:usize)->u64{
    let mut pascals_triangle:[[u64;N_PLUS_ONE];N_PLUS_ONE] = [[0 as u64;N_PLUS_ONE];N_PLUS_ONE];
    pascals_triangle[0][0]=1;
    for r in 1..N_PLUS_ONE {
        pascals_triangle[r][0]=1;
        for c in 1..N_PLUS_ONE {
            pascals_triangle[r][c]=pascals_triangle[r-1][c-1]+pascals_triangle[r-1][c];
        }
    }
    let max_num_of_two_step_climbs;
    if n%2==0{
        max_num_of_two_step_climbs = n/2;
    } else {
        max_num_of_two_step_climbs = (n-1)/2;
    }
    let mut i; let mut j; let mut row; let mut col; let mut sum:u64;
    j=0;  
    sum=0;
    while j<=max_num_of_two_step_climbs {
        i=n-2*j;
        row=i+j;
        col=i;
        sum += pascals_triangle[row as usize][col as usize];
        j+=1;
    } 
    return sum;
}
