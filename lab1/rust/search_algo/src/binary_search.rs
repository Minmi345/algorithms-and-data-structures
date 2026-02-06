pub fn search<T: PartialOrd>(arr: &[T], value: T, start: usize, end: usize) -> Option<usize>{
    if arr.is_empty(){return None}
    if start>=end{
        let mid: usize = start + (end-start)/2;
        if arr[mid] == value{return Some(mid)}
        else if arr[mid]>value { 
            return search(arr, value, start, mid-1)
        }
        else{
            if mid == 0 { return None; }
            return search(arr, value, mid+1, end)
        }
    }
    None

}