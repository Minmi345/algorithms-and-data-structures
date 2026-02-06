pub mod recursive;
pub mod iterative;

use rand::Rng as _;

#[derive(Clone, Copy)]
pub enum PivotFunc {
    Median,
    First,
    Random
}

pub(crate) fn partition<T: PartialOrd>(
    arr: &mut Vec<T>,
    pivot_position: usize,
    start: usize,
    end: usize,
) -> usize {
    // Move pivot to the end
    arr.swap(pivot_position, end);

    let mut left_bound: usize = start;
    let mut right_bound: usize = end - 1;

    while left_bound <= right_bound {
        // Move the left bound to the right until it reaches a value greater than or equal to the pivot.
        while arr[left_bound] < arr[end] {
            left_bound += 1;
        }

        // Move the right bound to the left until it crosses the left bound or finds a value less than the pivot.
        while arr[right_bound] >= arr[end] && right_bound >= left_bound && right_bound != 0 {
            right_bound -= 1;
        }
        // When the right bound crosses the left bound, all elements to the left of the left bound are less than the pivot and all elements to the right are greater than or equal to the pivot.
        if right_bound < left_bound || left_bound == 0 && right_bound == 0 {
            break;
        }

        // Swap the selected values.
        arr.swap(left_bound, right_bound);
    }

    // Move the pivot to its final location (swap with the left bound).
    arr.swap(left_bound, end);
    return left_bound;
}

pub(crate) fn median_of_three<T: PartialOrd>(arr: &[T], start: usize, end: usize) -> usize {
    let mid = start + (end - start) / 2;

    let a = &arr[start];
    let b = &arr[mid];
    let c = &arr[end];
    // println!(
    //     "Choosing pivot between: {:?} ({:?}), {:?} ({:?}), {:?} ({:?})",
    //     a, start, b, mid, c, end
    // );

    if (a >= b && a <= c) || (a <= b && a >= c) {
        start
    } else if (b >= a && b <= c) || (b <= a && b >= c) {
        mid
    } else {
        end
    }
}

pub(crate) fn get_random(start: usize, end: usize) -> usize{
let num = rand::rng().random_range(start..=end);
num
}