use std::{fs::File, io::{BufRead, BufReader}};
use std::fs::OpenOptions;
use std::io::{self, Write};
    
pub fn get_text_num() -> Vec<u8>{
    let file_name = File::open("src/Seminar 1 - File with random numbers.txt").unwrap();
    let buf_reader = BufReader::new(file_name);
    let vector: Vec<u8> = buf_reader.lines().filter_map(Result::ok)
        .filter_map(|line| line.trim().parse::<u8>().ok())
        .collect();

    vector
}


pub fn write_to_file(data: &str) -> io::Result<()> {
    // Open the file in append mode.
    let mut file = OpenOptions::new()
        .write(true)      // Enable write access
        .append(true)     // Enable append mode
        .open("src/output.txt")?;

    // Write the data to the file.
    writeln!(file, "{}", data)?;

    Ok(())
}