# gitlab-ci-template

Template per devops tramite gitlab-ci. Si tratta di una procedura per una app nodejs + database postgres.

- gitlab-ci.yml: sono specificati 3 stage (test, build e deploy); test è eseguito come 2 jobs paralleli, uno usa node v10 + caching della cartella node_modules e l'altro node v8 senza cache.
  Entrambi i jobs producono 2 artifacts che vengono mantenuti da gitlab per 1 settimana. Quello che fa questo stage è di lanciare uno script per testare la corretta configurazione delle variabili
  d'ambiente su un container con immagine postgres:10.
  
  Lo stage build genera una immagine dell'app e la pusha nel registry di gitlab.
  
  Lo stage deploy pubblica l'app e il db in kubernetes.
  
  
  
