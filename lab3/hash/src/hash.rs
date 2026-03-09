pub struct SeparateChainingTable {
    table: Vec<Vec<usize>>,
}

impl SeparateChainingTable {
    pub fn new(size: usize) -> Self {
        let mut tabel: Vec<Vec<usize>> = vec![];
        for i in 1..=size {
            tabel.push(Vec::new());
        }
        return Self { table: tabel };
    }

    pub fn insert_thin(&mut self, thing: usize) {
        let hash = thing % 10;
        self.table[hash].push(thing);
    }

    pub fn print(&self) {
        for i in 0..self.table.len() {
            print!("{:?}: ", i);
            for j in 0..self.table[i].len() {
                print!("{:?} -> ", self.table[i][j]);
            }
            print!("NULL");
            println!();
        }
    }
}
pub struct LinearProbeTable {
    table: Vec<Option<usize>>,
}

impl LinearProbeTable {
    pub fn new(size: usize) -> Self {
        return Self {
            table: vec![None; size],
        };
    }

    pub fn insert_thin(&mut self, thing: usize) {
        let mut hash = thing % 10;
        loop {
            if self.table[hash] == None {
                self.table[hash] = Some(thing);
                break;
            }
            hash += 1;
            if hash == self.table.len() {
                hash = 0;
            }
        }
    }

    pub fn print(&self) {
        for i in 0..self.table.len() {
            print!("{:?}: ", i);
            if let Some(number) = self.table[i] {
                println!("{}", number);
            } else {
                println!("- "); // Or just do nothing
            }
        }
        println!();
        println!();
    }
}
pub struct QuadraticProbeTable {
    table: Vec<Option<usize>>,
    hash_mod: usize,
}

impl QuadraticProbeTable {
    pub fn new(size: usize, hash_mod: usize) -> Self {
        return Self {
            table: vec![None; size],
            hash_mod,
        };
    }

    pub fn insert_thin(&mut self, thing: usize) {
        let mut hash = thing % self.hash_mod;
        let mut iterator = 1;
        loop {
            if self.table[hash] == None {
                self.table[hash] = Some(thing);
                break;
            }
            hash = (hash + iterator * iterator) % self.hash_mod;
            iterator +=1;
        }
    }

    pub fn recise(&mut self) {
        let num_empty: f32 =
            self.table.iter().filter(|x| x.is_none()).count() as f32 / self.table.len() as f32;
        if num_empty <= 0.3 {
            self.hash_mod *= 2;
            let size = self.table.len() * 2;
            let mut list = vec![None; size];
            std::mem::swap(&mut self.table, &mut list);
            for value in list.into_iter().filter_map(|x| x) {
                self.insert_thin(value);
                self.print();
            }
        }
    }

    pub fn print(&self) {
        for i in 0..self.table.len() {
            print!("{:?}: ", i);
            if let Some(number) = self.table[i] {
                println!("{}", number);
            } else {
                println!("- "); // Or just do nothing
            }
        }
        println!();
        println!();
    }
}
