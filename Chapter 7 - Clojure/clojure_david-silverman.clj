(ns user)

(defn hello [s]
  (str "Hello " s "!"))

(defn nth' [col n]
  (first (drop (- n 1) col)))

(defn reverse' [col]
  (if (empty? (rest col))
    col
    (cons (last col) (reverse' (butlast col)))))

(def fib
  (memoize (fn [n] (condp = n
                     0 1
                     1 1
                     (+ (fib (dec n)) (fib (- n 2)))))))

(defn fibs [n]
  (map fib (range n)))

;; day 1
(defn big [st n]
  (< n (count st)))

;; I went way overboard with the type lookup ...
;; version 1, using a map, added a default output
(defn collection-type [col]
  ({clojure.lang.PersistentList :List
    clojure.lang.PersistentVector :Vector
    clojure.lang.PersistentArrayMap :Map} (type col)
                                          (str "That's not a collection!")))

(collection-type '(1 2 3 4))
(collection-type [1 2 3 4])
(collection-type {:a "one", :b "two", :c "three"})
(collection-type "A String")

;; version 2, another map lookup option, used an if-let to do a default
(defn collection-type' [col]
  (if-let [ctype ({clojure.lang.PersistentList :List
                   clojure.lang.PersistentVector :Vector
                   clojure.lang.PersistentArrayMap :Map} (type col))]
    ctype
    (str "That's not a collection!")))

(collection-type' '(1 2 3 4))
(collection-type' [1 2 3 4])
(collection-type' {:a "one", :b "two", :c "three"})
(collection-type' "A String")

;; version 3, case does not work, this just falls through to the default
(defn- collection-type'' [col]
  (case (type col)
    clojure.lang.PersistentList  :List
    clojure.lang.PersistentVector :Vector
    clojure.lang.PersistentArrayMap :Map
    (str "That's not a collection!")))

(collection-type'' '(1 2 3 4))
(collection-type'' [1 2 3 4])
(collection-type'' {:a "one", :b "two", :c "three"})
(collection-type'' "A String")

;; version 4, condp, however, does work. I don't understand...
(defn- collection-type''' [col]
  (condp = (type col)
    clojure.lang.PersistentList :List
    clojure.lang.PersistentVector :Vector
    clojure.lang.PersistentArrayMap :Map
    (str "That's not a collection!")))

(collection-type''' '(1 2 3 4))
(collection-type''' [1 2 3 4])
(collection-type''' {:a "one", :b "two", :c "three"})
(collection-type''' "A String")