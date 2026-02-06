use crate::{
    insert::{insert_iterative, insert_recursive},
    quicksort::PivotFunc,
};
use quicksort::recursive::quicksort_rec as quicksort_recursive;
use quicksort::iterative::quicksort_iter as quicksort_iterative;

use std::time::Instant;
mod file_manipulations;
mod insert;
mod quicksort;
use chrono::Utc;

enum Algorithm {
    InsertIterative,
    InsertRecursive,
    QuickIterMed,
    QuickIterRand,
    QuickIterFirst,
    QuickRecMed,
    QuickRecRand,
    QuickRecFirst,
}

fn main() {
    let unsorted_vec: Vec<u8> = file_manipulations::get_text_num();

    let mut output = String::new();
    output = output + &Utc::now().to_string() + "\n";
    output.push_str(&" ".repeat(16));

    let length = [1000, 2000, 3000, 500, 600];

    let header = length
        .iter() // Create an iterator over the array
        .map(|&duration| format!("{:>12.2}", duration as u32))
        .collect::<Vec<String>>() // Collect into a Vec<String>
        .join("");

    output.push_str(&header);

    let algos = [
        Algorithm::InsertIterative,
        Algorithm::InsertRecursive,
        Algorithm::QuickIterMed,
        Algorithm::QuickIterRand,
        Algorithm::QuickIterFirst,
        Algorithm::QuickRecMed,
        Algorithm::QuickRecRand,
        Algorithm::QuickRecFirst,
    ];

    for algo in algos{
        let name = match algo {
            Algorithm::InsertIterative => "\nInsertSort(iter) ",
            Algorithm::InsertRecursive => "\nInsertSort(rec)  ",
            Algorithm::QuickIterMed =>    "\nQuickMedian(iter)",
            Algorithm::QuickIterRand=>    "\nQuickRandom(iter)",
            Algorithm::QuickIterFirst=>   "\nQuickFirst(iter) ",
            Algorithm::QuickRecMed=>      "\nQuickMedian(rec) ",
            Algorithm::QuickRecRand=>     "\nQuickRandom(rec) ",
            Algorithm::QuickRecFirst=>    "\nQuickFirst(rec)  "
        };
        output.push_str(name);

    for len in length {
        let start = Instant::now();

        let _ = match algo {
            Algorithm::InsertIterative => insert_iterative(&mut unsorted_vec[0..len].to_vec()),
            Algorithm::InsertRecursive => insert_recursive(&mut unsorted_vec[0..len].to_vec(), 0),
            Algorithm::QuickIterMed =>    quicksort_recursive(&mut unsorted_vec[0..len].to_vec(), 0, 100, PivotFunc::Median),
            Algorithm::QuickIterRand=>    quicksort_recursive(&mut unsorted_vec[0..len].to_vec(), 0, 100, PivotFunc::Random),
            Algorithm::QuickIterFirst=>   quicksort_recursive(&mut unsorted_vec[0..len].to_vec(), 0, 100, PivotFunc::First),
            Algorithm::QuickRecMed=>      quicksort_iterative(&mut unsorted_vec[0..len].to_vec(), PivotFunc::Median),
            Algorithm::QuickRecRand=>     quicksort_iterative(&mut unsorted_vec[0..len].to_vec(), PivotFunc::Random),
            Algorithm::QuickRecFirst=>    quicksort_iterative(&mut unsorted_vec[0..len].to_vec(), PivotFunc::First)
        };



        let duration = start.elapsed();
        output.push_str(&format!("{:>12.4}", &duration.as_nanos()));
    }
    }

    let _ = file_manipulations::write_to_file(&output);
    let _ = file_manipulations::write_to_file("\n");

    //println!("Tests are done! Check out data in src/output.txt");
    println!("Tests are done!");
    println!("{}", output);
}
