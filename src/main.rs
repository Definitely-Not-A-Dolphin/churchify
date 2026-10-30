/*
 * Encoding
 * E1A5-N2T3-S6M7-C4B8
 *
 * E -> A
 * A -> E
 * N -> B
 * T -> C
 * S -> F
 * M -> G
 * C -> D
 * B -> H
*/

fn main() {
    let args = std::env::args().collect::<Vec<_>>();

    if args.len() == 1 {
        println!("Supply an argument (see help subcommand for more info).");
        std::process::exit(0);
    }

    let mode = &args[1];

    if mode == "help" {
        println!("Usage: \n");
        println!("\thelp [text] \t-- see this message\n");
        println!("\tencode [text] \t-- to encode text\n");
        println!(
            "\tdecode [text] \t-- to attempt to decode text (is not garuanteed to perfectly decode)\n"
        );

        std::process::exit(0);
    }

    let text = args[2..].join(" ");
    let mut new_text = String::new();

    if mode == "encode" {
        for char in text.chars() {
            new_text.push(match char {
                'e' => 'a',
                'a' => 'e',
                'n' => 'b',
                't' => 'c',
                's' => 'f',
                'm' => 'g',
                'c' => 'd',
                'b' => 'h',
                'E' => 'A',
                'A' => 'E',
                'N' => 'B',
                'T' => 'C',
                'S' => 'F',
                'M' => 'G',
                'C' => 'D',
                'B' => 'H',
                _ => char,
            })
        }

        println!("{}", new_text);

        std::process::exit(0)
    }

    if mode == "decode" {
        for char in text.chars() {
            new_text.push(match char {
                'a' => 'e',
                'e' => 'a',
                'b' => 'n',
                'c' => 't',
                'f' => 's',
                'g' => 'm',
                'd' => 'c',
                'h' => 'b',
                'A' => 'E',
                'E' => 'A',
                'B' => 'N',
                'C' => 'T',
                'F' => 'S',
                'G' => 'M',
                'D' => 'C',
                'H' => 'B',
                _ => char,
            })
        }

        println!("{}", new_text);

        std::process::exit(0)
    }
}
