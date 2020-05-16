# gitlab-ci-template

Template per devops tramite gitlab-ci. Si tratta di una procedura per una app nodejs + database postgres.

- gitlab-ci.yml: sono specificati 3 stage (test, build e deploy); test è eseguito come 2 jobs paralleli, uno usa node v10 +     caching della cartella node_modules e l'altro node v8 senza cache. Entrambi i jobs producono 2 artifacts che vengono           mantenuti da gitlab per 1 settimana.  
  
  Lo stage build genera una immagine dell'app e la pusha nel registry di gitlab.
  
  Lo stage deploy pubblica l'app e il db in kubernetes.

- ci-test.sh: script lanciato nello stage test per testare la corretta configurazione delle variabili d'ambiente all'interno del container con immagine postgres:10.

- k8s.yaml: contiene i file necessari per creare le risorse nel cluster kubernetes. In particolare abbiamo Service e Deployment per l'app nodejs, Service e Deployment per il db, volume persistente montato nel pod del db e infine un ingress per accedere all'app dall'indirizzo dichiarato nel tag "host"
