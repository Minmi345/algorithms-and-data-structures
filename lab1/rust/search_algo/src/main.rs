mod binary_search;
mod file_manipulations;
use std::time::Instant;

use chrono::Utc;
use rand::Rng;

use crate::binary_search::search;

fn main() {
    let mut output = String::new();
    output = output + &Utc::now().to_string() + "\n";
    output.push_str(&" ".repeat(16));
    let length = [1000, 2000,4000,8000,16000,32000,64000,128000,256000,512000,1024000,2048000];

    let header = length
        .iter() // Create an iterator over the array
        .map(|&duration| format!("{:>14.2}", duration as u32))
        .collect::<Vec<String>>() // Collect into a Vec<String>
        .join("");

    output.push_str(&header);

    let array: Vec<usize> = (1..=2_048_000).collect();
    let mut rng = rand::rng();

    output.push_str("\nBinary Search:");

    for _ in 0..10 {
        for len in length {
            let num = rng.random_range(1..len);
            
            let start = Instant::now();
            search(&array[0..len], num, 0, len);
            let duration = start.elapsed();
            
            output.push_str(&format!("{:>14.4}", &duration.as_nanos()));
            
            print!("{}\n", duration.as_nanos());
            print!("Numbir: {}\n",num);
        }
    }
    let _ = file_manipulations::write_to_file(&output);
}