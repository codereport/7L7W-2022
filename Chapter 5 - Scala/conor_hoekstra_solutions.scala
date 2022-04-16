
object Day1 {

    def any(arr : Array[Boolean]) : Boolean = 
        arr.fold(false) { _ || _ }

    def all_equal(arr : Array[Char], xo: Char) : Boolean =
        arr.map { e => e == xo }.fold(true) { _ && _ }

    def winner(board: String, xo: Char) : Boolean = {
        val indices = Array(Array(0,1,2), Array(3,4,5), Array(6,7,8), // rows
                            Array(0,3,6), Array(1,4,7), Array(2,5,8), // columns
                            Array(0,4,8), Array(2,4,6))               // diagonals
        
        return any(indices.map { is => all_equal(is.collect(board), xo) })
                      
    }

    def tic_tac_toe_status(board: String) : String = {
        if      (winner(board, 'X')) { return "X wins" }
        else if (winner(board, 'O')) { return "O wins" }
        return "No winner yet"
    }

}

trait Bleep {
    val swear_words = Map("shoot" -> "pucky", 
                          "darn"  -> "beans")
    def clean() : Sentence
}

class Sentence(var words: List[String]) extends Bleep {
    def clean() : Sentence =
        new Sentence(words.map { w => swear_words.getOrElse(w, w) })
}

object Day2 {

    def total_size_of_strings(lst: List[String]) : Int =
        lst.map { _.size }.sum

}

object Scala {

    def main(args: Array[String]) = {

        println(Day1.tic_tac_toe_status("XOX...XOX"))
        println(Day1.tic_tac_toe_status("XOX.O.XOX"))
        println(Day1.tic_tac_toe_status("XOX..0XOX"))
        println(Day1.tic_tac_toe_status("XOXX..XOX"))

        println(Day2.total_size_of_strings(List("cat", "dog", "mouse")))
        
        val s = new Sentence(List("shoot", "darn", "this", "is", "weird"))
        s.clean.words.foreach { w => println(w) }
    }
}
