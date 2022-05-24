(defn collection-type [col]
  (cond (list? col) :list
        (map? col) :map
        (vector? col) :vector 
        :else :unknown))