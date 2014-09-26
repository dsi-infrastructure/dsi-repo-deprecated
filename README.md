## DSI-REPO

DSI-REPO permet d'interagir avec le serveur chef.

### Pré-requis

* chefdk
* git

### Installation

* Forker le dépôt https://github.com/dsi-infrastructure/dsi-repo.git
* Récupérer votre dépot ```git clone https://github.com/LOGIN/dsi-repo.git```
* Récupérer les submodules ```git submodule init && git submodule sync
  && git submodule update```
* Créer un compte sur le serveur chef et récupérer les certificats
  adéquates.
* Configurer knife.rb dans le dossier .chef et ajouter vos certificats
* Vous êtres prêt !!!

### Test

* knife node list
* knife environment list

### Récupération des l'envionnement de production

* Lancer backup.sh.
