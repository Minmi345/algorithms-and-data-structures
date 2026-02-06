use super::*;

pub fn quicksort_iter<T: PartialOrd + std::fmt::Debug>(arr: &mut Vec<T>, pivot_func: PivotFunc) {
    assert!(!arr.is_empty());
    let mut stack = vec![(0, arr.len() - 1)];


    while let Some((start, end)) = stack.pop() {
        if end.saturating_sub(start) + 1 <= 1 {
            return;
        }
        if end.saturating_sub(start) + 1 == 2 {
            if arr[start] > arr[end] {
                arr.swap(start, end);
            }
            return;
        }

        let pivot_position = match pivot_func {
            PivotFunc::Median => median_of_three(arr, start, end),
            PivotFunc::Random => get_random(start, end),
            PivotFunc::First => 1,
        };

        let left_bound = partition(arr, pivot_position, start, end);

        stack.push((start, left_bound.saturating_sub(1)));
        stack.push(((left_bound + 1).min(end), end));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn median_cheeeck() {
        let mut arr: Vec<u8> = vec![2, 5, 7, 2, 1, 0, 9, 8, 7];
        quicksort_iter(&mut arr, PivotFunc::Median);
        assert_eq!(arr, [0, 1, 2, 2, 5, 7, 7, 8, 9]);
    }
}
