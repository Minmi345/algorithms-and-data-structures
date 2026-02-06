use std::fs::OpenOptions;
use std::io::{self, Write};

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