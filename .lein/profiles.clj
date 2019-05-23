{:user {:plugins [[lein-try "0.4.3"]
                  [lein-eftest "0.5.7"]
                  [cider/cider-nrepl "0.21.1"]
                  [refactor-nrepl "2.4.0"]]
        :middleware [cider-nrepl.plugin/middleware
                     refactor-nrepl.plugin/middleware]
        :dependencies [[nrepl "0.6.0"]]
        ; :dependencies [[lambdaisland/kaocha "0.0-389"]]
        ; :aliases {"kaocha" ["run" "-m" "kaocha.runner"]}
        :eftest {:multithread? false}}}
{:auth {:repository-auth {#"snapshots" {:username "ccm-deployment"
                                        :password "aNz259Bg5APBrgW7"}
                          #"releases" {:username "ccm-deployment"
                                       :password "aNz259Bg5APBrgW7"}
                          #"clojars" {:username "lxsli"
                                      :password "x#ruoafKiPnJbfdeJc#8EB5N"}}}}
