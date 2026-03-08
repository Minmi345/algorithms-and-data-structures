use crate::heap::{linear_heap, nlogn_heap, print_in_order, print_level_order, print_pre_order};

mod heap;

fn main() {
    let test_data = vec![10, 12, 1, 14, 6, 5, 8, 15, 3, 9, 7, 4, 11, 13, 2];
        //println!("1/2 = {:?}",1/2 as usize);
        // println!("0/2 = {:?}",0/2 as usize);
        
    print!("Initial:  ");
    print_level_order(&test_data);
    println!();
    let linear_heap_vec = linear_heap(&test_data); 
    print!("Result:   ");
    print_level_order(&linear_heap_vec);
    println!("");
    println!("Expected: 1, 3, 2, 12, 6, 4, 8, 15, 14, 9, 7, 5, 11, 13, 10");
    
    let heap_vec = nlogn_heap(&test_data); 
    println!("Time for other one!");
    print!("Result:   ");
    print_level_order(&heap_vec);
    println!("");
    println!("Expected: 1, 3, 2, 6, 7, 5, 4, 15, 14, 12, 9, 10, 11, 13, 8");
    println!("Printing different orders: ");
    print!("Preorder: ");
    print_pre_order(&test_data, 0);
    
    println!("");
    print!("Inorder: ");
    print_in_order(&test_data, 0);

    
}
