
(def nums '(2 4 6 8 1 2 5 4 3 2))

;; Array inspired takewhile
(defn takewhile [seq fn]
    (take 
        (->> seq
             (map fn)
             (map {false 0 true 1})
             (reductions *)
             (reduce +))
         seq))

;; Recursive takewhile
(defn takewhile [seq fn]
    (if (or (empty? seq) 
            (not (fn (first seq)))) []
        (cons (first seq) (takewhile (rest seq) fn))))

(println (takewhile nums even?)) ; (2 4 6 8)
