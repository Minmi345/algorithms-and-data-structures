use std::time::Instant;
mod file_manipulations;
use chrono::Utc;
mod hash;
use hash::SeparateChainingTable;
use hash::LinearProbeTable;
use hash::QuadraticProbeTable;

fn main() {
    println!("Separate chaining table:");
    let mut chain_hash_table = SeparateChainingTable::new(10);
    let test_data = vec![4371, 1323, 6173, 4199, 4344, 9679, 1989];
    for i in test_data{
        chain_hash_table.insert_thin(i);
    }
    chain_hash_table.print();
    
    println!("Linear probing table:");
    let mut linear_hash_table = LinearProbeTable::new(10);
    let test_data = vec![4371, 1323, 6173, 4199, 4344, 9679, 1989];
    for i in test_data{
        linear_hash_table.insert_thin(i);
    }
    linear_hash_table.print();
    
    println!("Quadratic probing table:");
    let mut quadratic_probe_table = QuadraticProbeTable::new(10,10);
    let test_data = vec![4371, 1323, 6173, 4199, 4344, 9679, 1989];
    for i in test_data{
        quadratic_probe_table.insert_thin(i);
    }
    quadratic_probe_table.print();
    quadratic_probe_table.recise();
    quadratic_probe_table.print();



}
