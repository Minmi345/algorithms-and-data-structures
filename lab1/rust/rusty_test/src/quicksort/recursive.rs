use super::*;

pub fn quicksort_rec<T: PartialOrd + std::fmt::Debug>(
    arr: &mut Vec<T>,
    start: usize,
    end: usize,
    pivot_func: PivotFunc
) {
    // Handling small arrays
    // Just btw did you know that you pass part of an array: https://doc.rust-lang.org/rust-by-example/primitives/array.html
    if end.saturating_sub(start) + 1 <= 1 {
        return;
    }
    if end.saturating_sub(start) + 1 == 2 {
        if arr[start] > arr[end] {
            arr.swap(start, end);
        }
        return;
    }

    // print!("Quicksort func: start: {:?}", start);
    // println!(" end: {:?}", end);
    // println!("Current array: {:?}", arr);
    if start < end {
        let pivot_position = match pivot_func {
            PivotFunc::Median => median_of_three(arr, start, end),
            PivotFunc::Random => get_random(start, end),
            PivotFunc::First => 1
        };
        // println!(
        //     "Choosing pivot :arr[{pivot_position}] == {:?}",
        //     arr[pivot_position]
        // );
        let left_bound = partition(arr, pivot_position, start, end);

        quicksort_rec(arr, start, left_bound.saturating_sub(1), pivot_func);
        quicksort_rec(arr, (left_bound + 1).min(end), end, pivot_func);
    }
}



#[cfg(test)]
mod tests {
    use super::*;

    fn random_array(n: usize) -> Vec<u8> {
        let mut rng = rand::rng(); // Create a random number generator
        (0..n).map(|_| rng.random_range(0..=u8::MAX)).collect() // Generate random u16s and collect them into a Vec
    }

    #[test]
    fn median_cheeeck() {
        let mut arr: Vec<u8> = vec![2, 5, 7, 2, 1, 0, 9, 8, 7];
        let len = arr.len() - 1;
        quicksort_rec(&mut arr, 0, len, PivotFunc::Median);
        assert_eq!(arr, [0, 1, 2, 2, 5, 7, 7, 8, 9]);
    }
    
    #[test]
    fn random_median_check() {
        for n in 1..10000 {
            let mut random = random_array(3000);
            let len = random.len() - 1;
            println!("Sorting {n}!");
            quicksort_rec(&mut random, 0, len, PivotFunc::Median);
            assert!(random.is_sorted());
        }
    }
}
