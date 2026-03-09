use std::fmt::Display;

pub struct PuzzleGame {
    table: Vec<Vec<char>>,
    guess: Vec<String>, //string
}
pub struct Coordinates(usize, usize);
impl Display for Coordinates {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "({}.{})", self.0, self.1)
    }
}

impl PuzzleGame {
    pub fn new(table: Vec<Vec<char>>, guess: Vec<&str>) -> Self {
        let owned_guesses: Vec<String> = guess.iter().map(|s| s.to_string()).collect();

        Self {
            table,
            guess: owned_guesses,
        }
    }

    pub fn start(&self){
        for i in 0..self.table.len(){
            for j in 0..self.table[i].len(){
                self.horizontally(i, j);
                self.vertically(i, j);
                self.diagonally(i, j);
                self.diagonally2(i, j);
            }
        }

    }

    
    fn horizontally(&self, i: usize, j: usize) {
        let mut word: String = "".to_string();
        let start_word = Coordinates(i, j);
        let mut end_word = Coordinates(i, j);
        while end_word.1 != self.table[i].len() {
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
            if self.compare(&word){
                println!("Coordinates are: {} to {}", start_word, end_word);
            }
            end_word.1 += 1;
        }
        let mut word: String = "".to_string();
        let mut end_word = Coordinates(i, j);
        while end_word.1 != 0 {
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
            if self.compare(&word){
                println!("Coordinates are: {} to {}", start_word, end_word);
            }
            end_word.1 -= 1;
        }
        
    }
    fn vertically(&self, i: usize, j: usize) {
        let mut word: String = "".to_string();
        let start_word = Coordinates(i, j);
        let mut end_word = Coordinates(i, j);
        while end_word.0 != self.table.len() {
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
            if self.compare(&word){
                println!("Coordinates are: {} to {}", start_word, end_word);
            }
            end_word.0 += 1;
        }
        let mut word: String = "".to_string();
        let mut end_word = Coordinates(i, j);
        while end_word.0 != 0 {
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
            if self.compare(&word){
                println!("Coordinates are: {} to {}", start_word, end_word);
            }
            end_word.0 -= 1;
        }
        
    }
    fn diagonally(&self, i: usize, j: usize) {
        let mut word: String = "".to_string();
        let start_word = Coordinates(i, j);
        let mut end_word = Coordinates(i, j);
        while end_word.0 != self.table.len() && end_word.1 != self.table[i].len(){
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
            // dbg!(&word);
            if self.compare(&word){
                println!("Coordinates are: {} to {}", start_word, end_word);
            }
            end_word.0 += 1;
            end_word.1 += 1;
        }
        let mut word: String = "".to_string();
        let mut end_word = Coordinates(i, j);
        loop {
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
            // dbg!(&word);
            if self.compare(&word){
                println!("Coordinates are: {} to {}", start_word, end_word);
            }

            if end_word.0 == 0 || end_word.1 == 0 {
                break;
            }
            end_word.0 -= 1;
            end_word.1 -= 1;
        }
        
    }
    fn diagonally2(&self, i: usize, j: usize) {
        let mut word: String = "".to_string();
        let start_word = Coordinates(i, j);
        let mut end_word = Coordinates(i, j);
        loop{
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
            // dbg!(&word);
            if end_word.1 == 0 || end_word.0 == self.table[i].len() - 1 {
                break;
            }
            end_word.0 += 1;
            end_word.1 -= 1;
        }
        let mut word: String = "".to_string();
        let mut end_word = Coordinates(i, j);
        loop {
            //self.table[i][j] <- a character
            word.push(self.table[end_word.0][end_word.1]);
           // dbg!(&word);
            if self.compare(&word){
                println!("Coordinates are: {} to {}", start_word, end_word);
            }

            if end_word.0 == 0 || end_word.1 == self.table[i].len() -1 {
                break;
            }
            end_word.0 -= 1;
            end_word.1 += 1;
        }
        
    }
    fn compare(&self, suggestion: &str) -> bool
    {
        for word in &self.guess {
            if suggestion.eq(word) {
                print!("Found {:?}! ", word);
                //true;
                return true;
            }
        }
        false
    }
    
    // //vertically search word (up)
    // //vertically search word (down)
    // fn vertically(&self, i: usize, j: usize) {
    //     let mut word: String = "".to_string();
    //     let start_word = Coordinates(i, j);
    //     let mut end_word = Coordinates(i, j);
    //     while end_word.0 != self.table.len() {
    //         //self.table[i][j] <- a character
    //         word.push(self.table[end_word.0][end_word.1]);
    //         if self.compare(&word){
    //             println!("Coordinates are: {:?}.{:?} to {:?}.{:?}", start_word.0, start_word.1, end_word.0, end_word.1);
    //         }
    //         end_word.0 += 1;
    //     }
    //     word.clear();
    //     let mut end_word = Coordinates(i, j);
    //     while end_word.0 != 0 {
    //         //self.table[i][j] <- a character
    //         word.push(self.table[end_word.0][end_word.1]);
    //         if self.compare(word){
    //             println!("Coordinates are: {:?}.{:?} to {:?}.{:?}", start_word.0, start_word.1, end_word.0, end_word.1);
    //         }
    //         end_word.0 -= 1;
    //     }

    // }
    // fn diagonally(&self, i: usize, j: usize) {
    //     let mut word: String = "".to_string();
    //     let start_word = Coordinates(i, j);
    //     let mut end_word = Coordinates(i, j);
    //     while end_word.0 != self.table.len() || end_word.1 != self.table[i].len() {
    //         //self.table[i][j] <- a character
    //         word.push(self.table[end_word.0][end_word.1]);
    //         if self.compare(word){
    //             println!("Coordinates are: {:?}.{:?} to {:?}.{:?}", start_word.0, start_word.1, end_word.0, end_word.1);
    //         }
    //         end_word.0 += 1;
    //         end_word.1 += 1;
    //     }
    //     word.clear();
    //     let mut end_word = Coordinates(i, j);
    //     while end_word.0 != 0 || end_word.1 != 0 {
    //         //self.table[i][j] <- a character
    //         word.push(self.table[end_word.0][end_word.1]);
    //         if self.compare(word){
    //             println!("Coordinates are: {:?}.{:?} to {:?}.{:?}", start_word.0, start_word.1, end_word.0, end_word.1);
    //         }
    //         end_word.0 -= 1;
    //         end_word.1 -= 1;
    //     }

    // }

//diagonally search word (down)
//diagonally search word (up)
}

//horizontally search word ->
//pub fn horizontally(i : usize, j: usize){
//we have an array
/*
- - - -
- - X -
- - - -
- - - -

We need to look on j axis to the right, adding to the word and comparing it to current database

current i, j
current i, j + 1
then there is no way we read further
i, j
i, j-1
i, j-2
..
i, 0*/
//    let word = "";

//horizontally search word <-


