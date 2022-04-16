// Day 1

scala> println("Hello World!")
Hello World!

scala> 1 + 1
res1: Int = 2

scala> (1).+(1)
res2: Int = 2

scala> 5 + 4 * 3
res3: Int = 17

scala> "abc".size
res4: Int = 3

scala> "abc" + 4
res5: String = abc4

scala> 4 + "abc"
res6: String = 4abc

scala> 4 + "1.0"
res7: String = 41.0

scala> 4 * "abc"
<console>:12: error: overloaded method value * with alternatives:
  (x: Double)Double <and>
  (x: Float)Float <and>
  (x: Long)Long <and>
  (x: Int)Int <and>
  (x: Char)Int <and>
  (x: Short)Int <and>
  (x: Byte)Int
 cannot be applied to (String)
       4 * "abc"
         ^

scala> 5 < 6
res9: Boolean = true

scala> 5 != 2
res10: Boolean = true

scala> val a = 1
a: Int = 1

scala> val r = 0 until 10
r: scala.collection.immutable.Range = Range(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

scala> r.start
res11: Int = 0

scala> r.end
res12: Int = 10

scala> val r2 = 0 to 10
r2: scala.collection.immutable.Range.Inclusive = Range(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

scala> val me = ("Conor", "Hoekstra")
me: (String, String) = (Conor,Hoekstra)

scala> me._1
res13: String = Conor

scala> me._2
res14: String = Hoekstra

// Day 2

scala> Set(1,1,1)
res0: scala.collection.immutable.Set[Int] = Set(1)

scala> val langs = List("apl", "bqn", "j", "k")
langs: List[String] = List(apl, bqn, j, k)

scala> langs.foreach { l => println(l) }
apl
bqn
j
k

scala> langs.map { _.size }
res2: List[Int] = List(3, 3, 1, 1)

scala> langs.count { _.size == 1 }
res3: Int = 2

scala> (0 /: langs.map { _.size }) { _ + _ }
res4: Int = 8

// Day 3 

// TODO