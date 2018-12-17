{:user {:plugins  [[lein-cljfmt "0.6.1"]]
                   ; [venantius/ultra "0.5.2"]]
        :repl-options {:init (require 'cljfmt.core)}
        :dependencies  [[cljfmt "0.6.1"]
                        [expound "0.7.1"]
                        [circleci/circleci.test "0.4.1"]
                        [nrepl "0.5.3"]]  ; https://github.com/technomancy/leiningen/issues/2497
        :aliases {"test" ["run" "-m" "circleci.test/dir" :project/test-paths]
                  "tests" ["run" "-m" "circleci.test"]
                  "retest" ["run" "-m" "circleci.test.retest"]}}
 :auth {:repository-auth {#"snapshots" {:username "ccm-deployment"
                                        :password "aNz259Bg5APBrgW7"}
                          #"releases" {:username "ccm-deployment"
                                       :password "aNz259Bg5APBrgW7"}
                          #"clojars" {:username "lxsli"
                                      :password "x#ruoafKiPnJbfdeJc#8EB5N"}}}}
