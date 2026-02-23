<<<<<<< HEAD
# Compte-rendu TP : Infrastructure Azure avec Terraform

## 1. Description du projet
Déploiement d'une architecture en haute disponibilité composée de deux machines virtuelles Ubuntu derrière un Azure Load Balancer.

## 2. Détails du déploiement
* **Région :** Switzerland North.
* **Nombre de ressources créées :** 9 ressources au total (VNet, Subnet, NICs, VMs, Load Balancer, etc.).
* **IP Publique du Load Balancer :** 172.161.75.231.

## 3. État de l'infrastructure
L'infrastructure est actuellement stable et "idempotente". Une nouvelle exécution de Terraform confirme qu'aucun changement n'est nécessaire (0 added, 0 changed, 0 destroyed).

## 4. Problèmes résolus
* Correction d'une erreur d'output qui tentait de pointer vers une IP de VM inexistante au lieu de l'IP du Load Balancer.

=======
>>>>>>> 0833204d832c96d816ddf4474192e698306f11dd
# TP Noté : Déploiement d'une infrastructure Haute Disponibilité sur Azure

**Nom :** Razooooo  
**Environnement :** Azure Cloud Shell / Terraform  
**Région :** Switzerland North

## 1. Objectifs du projet
L'objectif de ce TP est de mettre en place une infrastructure Web résiliente composée de deux machines virtuelles Ubuntu exécutant Nginx, réparties derrière un Azure Load Balancer.

## 2. Architecture Technique
L'infrastructure a été déployée en respectant les principes de l'Infrastructure as Code (IaC) :

* **Resource Group** : `tp-azure-rg`.
* **Réseau** : Un VNet (`10.0.0.0/16`) et un subnet (`10.0.1.0/24`).
* **Sécurité** : Un Network Security Group (NSG) autorisant les flux SSH (22) et HTTP (80).
* **Compute** : Deux instances de VM (`Standard_B1s`) avec installation automatisée de Nginx via `custom_data`.
* **Load Balancer** : Un LB de type Standard avec IP statique pour distribuer le trafic sur le port 80.

## 3. Preuves de succès et validation

### Déploiement réussi
Le déploiement s'est terminé avec succès avec la création de 9 ressources.
* **IP Publique du Load Balancer :** `20.203.145.223`.

### Idempotence
Une seconde exécution de `terraform apply` confirme l'idempotence de la configuration : **0 added, 0 changed, 0 destroyed**.

## 4. Concepts validés
* **Cycle de vie** : Utilisation de `init`, `plan`, `apply` et prochainement `destroy`.
* **Fichiers d'état** : Gestion via le fichier `terraform.tfstate` pour le suivi des ressources.
* **Authentification** : Utilisation de l'Azure CLI (`az login`) pour l'accès aux ressources.

## 5. Guide de nettoyage
Pour supprimer l'intégralité des ressources créées et éviter les coûts inutiles :
```bash
terraform destroy
Pour supprimer l'intégralité des ressources créées et éviter les coûts inutiles :
```bash
terraform destroy
