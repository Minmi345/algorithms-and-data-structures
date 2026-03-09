mod puzzle;
use puzzle::PuzzleGame;
fn main() {
    println!("Hello, gamers!");
    
    let test_data = vec![
        vec!['t', 'h', 'i', 's'],
        vec!['w', 'a', 't', 's'],
        vec!['o', 'a', 'h', 'g'],
        vec!['f', 'g', 'd', 't'],
    ];
    let test_answer = vec!["this", "two", "fat", "that"];


    let mut game = PuzzleGame::new(test_data,test_answer);
    game.start();
}
