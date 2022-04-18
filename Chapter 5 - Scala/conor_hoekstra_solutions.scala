
object Day1 {

    def any(arr : Array[Boolean]) : Boolean = 
        arr.fold(false) { _ || _ }

    def all_equal_to(arr : Array[Char], xo: Char) : Boolean =
        arr.map { _ == xo }.fold(true) { _ && _ }

    def winner(board: String, xo: Char) : Boolean = {
        val indices = Array(Array(0,1,2), Array(3,4,5), Array(6,7,8), // rows
                            Array(0,3,6), Array(1,4,7), Array(2,5,8), // columns
                            Array(0,4,8), Array(2,4,6))               // diagonals
        
        return any(indices.map { is => all_equal_to(is.collect(board), xo) })              
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

object Day3 {

    // didn't actually do day 3, decided to solve a LeetCode problem
    // https://leetcode.com/contest/biweekly-contest-76/problems/find-closest-number-to-zero/

    // Bad: ITM
    def findClosestNumber_(nums: Array[Int]): Int = {
        var res = nums(0)
        for (num <- nums) {
            if ((num.abs < res.abs) || 
                (num.abs == res.abs && num > res)) {
                res = num
            }
        }
        return res
    }

    // Good :)
    def findClosestNumber(nums: Array[Int]): Int = {
        val lo = nums.map { _.abs }.min
        return nums.filter { _.abs == lo }.max
    }

}

object Scala {

    def main(args: Array[String]) = {

        // Day 1
        println(Day1.tic_tac_toe_status("XOX...XOX"))
        println(Day1.tic_tac_toe_status("XOX.O.XOX"))
        println(Day1.tic_tac_toe_status("XOX..0XOX"))
        println(Day1.tic_tac_toe_status("XOXX..XOX"))

        // Day 2
        println(Day2.total_size_of_strings(List("cat", "dog", "mouse")))
        
        val s = new Sentence(List("shoot", "darn", "this", "is", "weird"))
        s.clean.words.foreach { w => println(w) }

        // Day 3
        println(Day3.findClosestNumber(Array(-4,-2,1,4,8)))
        println(Day3.findClosestNumber(Array(2,-1,1)))
        println(Day3.findClosestNumber(Array(2,-1)))
    }
}
