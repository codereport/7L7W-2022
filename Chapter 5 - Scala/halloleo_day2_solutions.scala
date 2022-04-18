val addSize = ((sum: Int, s: String) => sum + s.size)
val strings = List("Programming", "Languages", "Virtual", "Meetup")
println(s"The strings in list $strings have ${strings.foldLeft(0)(addSize)} characters.")

val replacements = Map("Shoot" -> "Pucky", "Darn" -> "Beans")

trait Censor {
  def clean (txt: String): String = {
    var res = txt
    replacements.foreach {case (k,v) => res = res.replace(k,v)}
    return res
    }
}

class MyInfo () {
    def normalText() = "Well, You Shoot Better Darn Well, Or I Kill You."

}

class MyCensoredInfo() extends MyInfo with Censor

val myInfo = new MyCensoredInfo
println(myInfo.clean(myInfo.normalText()))
