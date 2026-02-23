**Environnement :** Azure Cloud Shell / Terraform  
**Région :** Switzerland North

* **Resource Group** : `tp-azure-rg`.
* **Réseau** : Un VNet (`10.0.0.0/16`) et un subnet (`10.0.1.0/24`).
* **Sécurité** : Un Network Security Group (NSG) autorisant les flux SSH (22) et HTTP (80).
* **Compute** : Deux instances de VM (`Standard_B1s`) avec installation automatisée de Nginx via `custom_data`.
* **Load Balancer** : Un LB de type Standard avec IP statique pour distribuer le trafic sur le port 80.

Preuves de succès et validation

### Déploiement réussi
Le déploiement s'est terminé avec succès avec la création de 9 ressources.
* **IP Publique du Load Balancer :** `20.203.145.223`.

### Idempotence
Une seconde exécution de `terraform apply` confirme l'idempotence de la configuration : **0 added, 0 changed, 0 destroyed**.

Concepts validés
* **Cycle de vie** : Utilisation de `init`, `plan`, `apply` et prochainement `destroy`.
* **Fichiers d'état** : Gestion via le fichier `terraform.tfstate` pour le suivi des ressources.
* **Authentification** : Utilisation de l'Azure CLI (`az login`) pour l'accès aux ressources.

screen

Screen du load balancer qui fonctionne grace à la commande "curl http://20.203.145.223" l'IP public qui est celle du load balancer
<img width="1623" height="247" alt="image" src="https://github.com/user-attachments/assets/0dc9c641-de7e-42ea-8a96-d5c062e4ab66" />

<img width="1335" height="683" alt="image" src="https://github.com/user-attachments/assets/ddd84b86-2390-48af-912f-d38ab813f378" />
<img width="687" height="291" alt="image" src="https://github.com/user-attachments/assets/a31bca38-0d91-4c1c-afe7-489ccdcca732" />

Commande terraform plan:
<img width="1141" height="91" alt="image" src="https://github.com/user-attachments/assets/517c10cc-5fa8-426c-8cfb-080d624f655c" />
Commande terraform apply:
<img width="1443" height="263" alt="image" src="https://github.com/user-attachments/assets/362b51fb-de17-468e-bfb9-49b08f5cc7c2" />
Commmande terraform destroy:

Pour supprimer l'intégralité des ressources créées et éviter les coûts inutiles :
```bash
terraform destroy
