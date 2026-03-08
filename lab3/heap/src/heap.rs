use std::fmt::Debug;

pub fn linear_heap<T: PartialOrd + Clone>(arr: &[T]) -> Vec<T> {
    let mut vec = arr.to_vec();
    // vec.swap()
    for i in (1..vec.len()).rev() {
        //finishes when goes to first element
        let parent = (i - 1) / 2;
        heapify(& mut vec, parent);
        // if vec[i] < vec[parent] {
        //     vec.swap(i, parent);
        // }
    }
    return vec;
}

pub fn nlogn_heap<T: PartialOrd + Clone>(initial_vector:&[T]) -> Vec<T> {
    //create an a vector which is heap
    let mut vec = Vec::new();
    //loop where i have index and item at the same time!! 🗣️🗣️🗣️
    for (i, item) in initial_vector.into_iter().enumerate() {
        //move from original array to vector
        vec.push(item.clone());

        //if there is more than 1 element in vector
        if i > 1 {
            //sort!
            logn_sort(&mut vec, i);
        }
    }
    return vec;
}
fn logn_sort(vec: &mut Vec<impl PartialOrd>, index: usize) {
    if index == 0 {
        return;
    }
    //identifying parent index
    let parent = (index + 1) / 2 - 1;

    if vec[index] < vec[parent] {
        //swap them!
        vec.swap(index, parent);
        logn_sort(vec, parent);
    }
    return;
}

fn heapify(vec: &mut Vec<impl PartialOrd>, index: usize) {
    let l = 2 * index + 1;
    let r = 2 * index + 2;
    if l >= vec.len() {
        return;
    }
    
    let mut smallest = index;

    if vec[l] < vec[smallest] {
        smallest = l;
    }
    if vec[r] < vec[smallest] {
        smallest = r;
    }

    if (smallest != index) {
        //swap them!
        vec.swap(index, smallest);
        heapify(vec, smallest);
    }

    return;
}


pub fn print_level_order(vec: &[impl Debug]) {
    for item in vec {
        print!("{:?}, ", item);
    }
}

pub fn print_pre_order(vec: &Vec<impl Debug>, node : usize) {
    let left = 2*node + 1;
    let right = 2*node + 2;
    if node < vec.len(){
        print!("{:?}, ", vec[node]);
        if left < vec.len() {
            print_pre_order(vec, left);
            print_pre_order(vec, right);
        }
    }
}
pub fn print_in_order(vec: &Vec<impl Debug>, node : usize) {
    let left = 2*node + 1;
    let right = 2*node + 2;
    if node < vec.len(){
        if left < vec.len() {
            print_in_order(vec, left);
            print!("{:?}, ", vec[left]); //it is left?
            print!("{:?}, ", vec[node]);
            print_in_order(vec, right);
            print!("{:?}, ", vec[right]);
        }
    }
}
pub fn print_post_order(vec: &Vec<impl Debug>, node : usize) {
    let left = 2*node + 1;
    let right = 2*node + 2;
    if node < vec.len(){
        if left < vec.len() {
            print_in_order(vec, left);
            print!("{:?}, ", vec[left]); //it is left?
            print!("{:?}, ", vec[right]);
            print!("{:?}, ", vec[node]);
            print_in_order(vec, right);
        }
    }
}
