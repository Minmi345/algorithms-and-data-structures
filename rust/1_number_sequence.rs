//1,4,7,10,13.....
//find next num in sequence
//find 10th num in the sequence

fn main(){
use std::io;

    println!("How many numbers are in your sequence?");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed in input");

    let limit: usize = input.trim().parse::<usize>().unwrap();
    //println!("{}",i);

    let sequence: Vec<i32> = Vec::with_capacity(limit);

    println!("-----Write the numbers now------");

    for n in 0..limit{
    println!("{}. ",n+1);

    io::stdin().read_line(&mut input).expect("Failed in input");
    dbg!(&input);
    let num: i32 = input.trim().parse::<i32>().unwrap();

    println!("{}",num);
    }
}
