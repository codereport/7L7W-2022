object Square extends Enumeration {
  type Square = Value
  val Cross = Value("X")
  val Nought = Value("O")
  val Empty = Value("_")
}

val n = 3

class Board (fromStr: String) {
  var squares = Array.fill[Square.Square](n,n) (Square.Empty)

  val boardStr = fromStr.filterNot(_.isWhitespace)

  for ( (c,i) <- boardStr.zipWithIndex) {
    val row = i / 3
    val col = i % 3
    try {
      squares(col)(row) = Square.withName(c.toString())
    } catch {
      case e: NoSuchElementException =>
        print(s"Reading Board String: Square char '$c' in col $col, row $row not valid. - Abort")
        sys.exit(-1)
    }
  }

  def show {
    for (row <- 0 to n-1) {
      for (col <- 0 to n-1) {
        print(squares(col)(row))
      }
      println()
    }
  }

  val idxRange = 0 until n

  def test_a_row(forPlayer: Square.Square, start: (Int, Int), direction: (Int, Int)): Boolean = {
    val debug = false
    if (debug) println(s"start=$start / direction=$direction")

    for (check <- idxRange) {
      val pos = (start._1 + check * direction._1, start._2 + check * direction._2)
      if (debug) println(pos)
      if (!((idxRange contains pos._1) && (idxRange contains pos._2) &&
            (squares(pos._1)(pos._2) == forPlayer))) {
        if (debug) println("Incomplete")
        return false
      }
      if (debug) println("OK")
    }
    return true
  }


  def find_row(forPlayer: Square.Square): Boolean = {
    val starts = for (x <- idxRange) yield (x,0)
    val directions = (1,0) :: (1,1) :: (0,1) :: (-1,1) :: Nil
    for (start <- starts) {
      for (direction <- directions) {
        if (test_a_row(forPlayer, start, direction)) {
          return true
        }
      }
    }
    return false
  }


  def detect_winner: Square.Value = {
    if (find_row(Square.Cross)) {
      return Square.Cross
    }
    if (find_row(Square.Nought)) {
      return Square.Nought
    }
    return Square.Empty
  }
}


def show_board_and_detect_winner(board: Board) {
  println("\nOn the TTT board")
  board.show
  println(s"is |${board.detect_winner}| the winner. (|${Square.Empty}| means no winner (yet))")
}

show_board_and_detect_winner(new Board("""
O_X
_OX
__X
"""))

show_board_and_detect_winner(new Board("""
XXO
XOO
O__
"""))

show_board_and_detect_winner(new Board("""
X__
OXO
__O
"""))

show_board_and_detect_winner(new Board("""
X_O
OXO
__O
"""))
