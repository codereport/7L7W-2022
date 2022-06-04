;; Using https://www.jdoodle.com/execute-clojure-online/

;; Day 1

;; Implement a function called (big st n) that returns true 
;; if a string st is longer than n characters.

(defn big [st n] 
   (if (> (count st) n) true false))

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

;; TODO 

;; Day 3

;; TODO 
