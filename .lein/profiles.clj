{:user {:plugins [[lein-try "0.4.3"]
                  [lein-eftest "0.5.7"]
                  [cider/cider-nrepl "0.21.1"]
                  [refactor-nrepl "2.4.0"]]
        :middleware [cider-nrepl.plugin/middleware
                     refactor-nrepl.plugin/middleware]
        :dependencies [[nrepl "0.6.0"]
                       [fipp "0.6.18"]
                       [com.gfredericks/debug-repl "0.0.10"]
                       [vvvvalvalval/scope-capture "0.3.2"]
                       [vvvvalvalval/scope-capture-nrepl "0.3.1"]]
        ; :dependencies [[lambdaisland/kaocha "0.0-389"]]
        ; :aliases {"kaocha" ["run" "-m" "kaocha.runner"]}
        :eftest {:multithread? false}
        :repl-options {:nrepl-middleware [com.gfredericks.debug-repl/wrap-debug-repl
                                          sc.nrepl.middleware/wrap-letsc]}
        :injections [(require '[sc.api :as sc])
                     (require '[sc.nrepl.repl :as nsc])
                     (require '[com.gfredericks.debug-repl :refer [break! unbreak!]])
                     (defmacro def+
                       "binding => binding-form
                       internalizes binding-forms as if by def."
                       {:added "1.9", :special-form true, :forms '[(def+ [bindings*])]}
                       [& bindings]
                       (let [bings (partition 2 (destructure bindings))]
                         (sequence cat
                                   ['(do)
                                    (map (fn [[var value]] `(def ~var ~value)) bings)
                                    [(mapv (fn [[var _]] (str var)) bings)]])))]}}
{:auth {:repository-auth {#"snapshots" {:username "ccm-deployment"
                                        :password "aNz259Bg5APBrgW7"}
                          #"releases" {:username "ccm-deployment"
                                       :password "aNz259Bg5APBrgW7"}
                          #"clojars" {:username "lxsli"
                                      :password "x#ruoafKiPnJbfdeJc#8EB5N"}}}}
