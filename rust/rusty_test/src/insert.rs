pub fn insert_iterative<T: PartialOrd>(arr: &mut Vec<T>){
    for separator in 0..arr.len() {
        //go through all array
        for index in (1..=separator).rev() {
            if arr[index - 1] > arr[index] {
                arr.swap(index, index - 1);
            }
        }
    }
}

pub fn insert_recursive<T: PartialOrd>(arr: &mut Vec<T>, separator: usize) {
    if separator == arr.len() {
        return;
    }

    for index in (1..=separator).rev() {
        if arr[index - 1] > arr[index] {
            arr.swap(index, index - 1);
        }
    }
    insert_recursive(arr, separator + 1);
}

#[cfg(test)]
mod tests{
    use super::*;

    #[test]
    fn iterative_cheeeck(){
        let arr: [u8;5] = [2,5,7,2,1];
        insert_iterative(&mut arr.to_vec());
        assert_eq!(arr,[1,2,2,5,7]);
    }

    #[test]
    fn recursion_cheeeck(){
        let arr: [u8;5] = [2,5,7,2,1];
        insert_recursive(&mut arr.to_vec(), 0);
        assert_eq!(arr,[1,2,2,5,7]);
    }

}
