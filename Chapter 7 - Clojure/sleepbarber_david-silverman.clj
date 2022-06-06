(ns sleepbarber
  (:require [clojure.core.async
             :as a
             :refer [>! <! >!! <!! go go-loop chan dropping-buffer close! thread
                     alts! alts!! timeout]]))

(def barber-shop (chan (dropping-buffer 3)))

(go-loop [haircuts 0]
  (let [customer-num (<! barber-shop)]
    (<! (timeout 20))
    (println "Haircut for customer" customer-num "," haircuts "total!")
    (recur (inc haircuts))))

;; This doesn't work. There's a moment where it seems to stop, 
;; but then it just goes on forever. close! doesn't seem to work.
;; Also, how to get the return value of the number of haircuts to the 
;; calling operate-shop?
;; Also, also, why does it work as a def (sort of, except for not stopping)
;; but doesn't work as a fn?

(def operate-shop
  (do (alts!! [(timeout 10000)
               (go-loop [x 0]
                 (<! (timeout (+ 10 (rand-int 20))))
                 (>! barber-shop x)
                 (recur (+ x 1)))])
      (close! barber-shop)))




