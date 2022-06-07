;; Using https://www.jdoodle.com/execute-clojure-online/
;; Using https://www.mycompiler.io/new/clojure

;; Day 1

;; Implement a function called (big st n) that returns true 
;; if a string st is longer than n characters.

(defn big [st n] 
   (> (count st) n))

;; Tests
(println (big "APL" 2)) ; true
(println (big "BQN" 2)) ; true
(println (big "J"   2)) ; false

;; Write a function called (collection-type col) that returns :list, 
;; :map, or :vector based on the type of collection col.

(defn collection-type [col]
    (cond
        (list?   col) :list
        (vector? col) :vector
        (map?    col) :map
        :else "other"
    ))

;; Tests
(println (collection-type [1 2 3]))   ; vector  
(println (collection-type '(1 2 3)))  ; list
(println (collection-type {1 2 3 4})) ; map

;; Day 2

;; Implement an unless with an else condition using macros.

;; From SICP: (if ⟨predicate⟩ ⟨consequent⟩ ⟨alternative⟩)

(defmacro unless [pred consequent alternative]
    (list 'if (list 'not pred) consequent alternative))

(println (unless (odd? 1) "Hello" "Goodbye")) ; Goodbye
(println (unless (odd? 2) "Hello" "Goodbye")) ; Hello

;; Write a type using defrecord that implements a protocol.

(defprotocol Animal
    (speak [animal])
    (legs  [animal])
    (tail  [animal]))

(defrecord Cat [name] Animal
    (speak [this] "meow!")
    (legs  [this] 4)
    (tail  [this] true))

(defrecord Duck [name] Animal
    (speak [this] "quack!")
    (legs  [this] 2)
    (tail  [this] false))

(def c (Cat.  "Fluffy"))
(def d (Duck. "Donald"))

(println (str (.name c) " says " (speak c))) ; Fluffy says meow!
(println (str (.name d) " says " (speak d))) ; Donald says quack!

;; Day 3

;; Skip
