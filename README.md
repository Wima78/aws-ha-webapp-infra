# AWS High Availability Web Application Infrastructure

Ce projet contient l'infrastructure as code (IaC) pour déployer une application web hautement disponible sur AWS, utilisant Terraform. L'infrastructure est répartie sur deux zones de disponibilité pour assurer la haute disponibilité et la résilience.

## Architecture

L'infrastructure déployée comprend:

- Un VPC avec un CIDR 10.0.0.0/16
- 4 sous-réseaux répartis sur 2 zones de disponibilité:
  - 2 sous-réseaux publics (10.0.1.0/24 et 10.0.2.0/24)
  - 2 sous-réseaux privés (10.0.3.0/24 et 10.0.4.0/24)
- Une passerelle Internet pour l'accès public
- Une passerelle NAT pour permettre aux ressources dans les sous-réseaux privés d'accéder à Internet
- Tables de routage pour les sous-réseaux publics et privés
- Load balancers pour distribuer le trafic (Inbound ELB et Backend ELB)
- Instances EC2 pour:
  - Serveurs Web (Nginx)
  - Bastion host pour l'accès sécurisé
  - Applications NodeJS
  - Base de données MongoDB
- Un groupe d'autoscaling pour les instances d'application
- Un bucket S3 pour le stockage

## Structure des fichiers

- `backend.tf` - Configuration du backend S3 pour le stockage de l'état Terraform
- `dev.tfvars` - Variables d'environnement de développement
- `igw.tf` - Configuration de la passerelle Internet
- `instance.tf` - Configuration des instances EC2
- `natgatway.tf` - Configuration de la passerelle NAT
- `provider.tf` - Configuration du provider AWS
- `route_table.tf` - Configuration des tables de routage
- `subnet.tf` - Configuration des sous-réseaux
- `variable.tf` - Déclaration des variables Terraform
- `vpc.tf` - Configuration du VPC

## Prérequis

- Terraform v1.0+
- AWS CLI configuré avec les permissions appropriées
- Un bucket S3 nommé "wima-print-backet" pour le stockage de l'état Terraform
- Une table DynamoDB nommée "sprints" pour le verrouillage de l'état Terraform

## Déploiement

1. Cloner ce dépôt
   ```
   git clone https://github.com/votre-username/aws-ha-webapp-infra.git
   cd aws-ha-webapp-infra
   ```

2. Initialiser Terraform
   ```
   terraform init
   ```

3. Planifier le déploiement
   ```
   terraform plan -var-file=dev.tfvars
   ```

4. Appliquer les changements
   ```
   terraform apply -var-file=dev.tfvars
   ```

## Étapes de création initiales

1. Création d'une AMI personnalisée
2. Mise en place du VPC et de la configuration réseau
3. Configuration du stockage S3
4. Déploiement des instances EC2

## Remarques

- L'infrastructure est configurée pour l'environnement de développement
- Le stockage de l'état Terraform est configuré dans S3 avec verrouillage DynamoDB pour permettre la collaboration

## Futures améliorations

- Ajouter des groupes d'autoscaling pour tous les types d'instances
- Implémenter des systèmes de monitoring et d'alerte
- Mettre en place un CI/CD pour automatiser les déploiements d'infrastructure
