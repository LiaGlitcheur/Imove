# SADMPApp

SADMPApp est une application macOS développée en SwiftUI qui permet d'exécuter des scripts Shell pour transférer des fichiers via SSH. L'application est conçue pour automatiser le transfert de contenu d'un répertoire local vers un répertoire distant sur un serveur via SSH et SCP.


## Fonctionnalités

- **Transfert de fichiers via SSH et SCP** : Utilise Paramiko et SCPClient pour transférer des fichiers depuis un répertoire local vers un serveur distant.
- **Interface utilisateur simple** : Offre une interface graphique simple avec des boutons pour démarrer les transferts.

## Structure du Projet

- `SADMPApp.swift` : Point d'entrée principal de l'application. Définit la structure de base de l'application et lance la vue principale.
- `VisualEffectView.swift` : Utilise `NSVisualEffectView` pour ajouter des effets visuels à l'application.
- `ContentView.swift` et `WebsiteView.swift` : Vues spécifiques pour différentes fonctionnalités de l'application.
- `Distri.py` : Script Python pour transférer des fichiers via SSH et SCP.
- `Distri.sh` : Script Shell pour lancer `Distri.py`.

## Prérequis

- macOS avec Swift 5.3 ou supérieur.
- Python 3.x avec les modules `paramiko` et `scp` installés.
- Accès SSH configuré pour le serveur cible.

## Installation

> **⚠️ Attention: Avant d'installer, le code `Distri.py` supprimer tous les fichier contenus dans le répertoire alors que le code `WS.py` remplace uniquement les fichiers avec le même nom

1. **Cloner le dépôt** :
    ```bash
    git clone https://github.com/LiaGlitcheur/Imove.git
    cd Imove
    ```

2. **Configurer l'environnement Python** :
    ```bash
    python3 -m venv Imove
    source Imove/bin/activate
    pip install paramiko scp
    ```

3. **Configurer les scripts** :
    - Assurez-vous que `Distri.py` et `Distri.sh` sont correctement configurés avec les chemins et les informations de serveur corrects.

## Utilisation

1. **Lancer l'application** :
    Ouvrez le projet Xcode et exécutez l'application.

2. **Utiliser l'application** :
    - Cliquez sur le bouton "Démarrer le Transfert" pour lancer le script Shell et transférer les fichiers.
    
    ![alt text](https://slyver.fr/Imove/app.png)


## Auteurs

- **Liam Quatrevaux** - *Développeur principal* - [Votre Profil GitHub](https://github.com/LiaGlitcheur)


## Remerciements

- [Paramiko](https://www.paramiko.org/) pour la gestion des connexions SSH en Python.
- [SwiftUI](https://developer.apple.com/documentation/swiftui/) pour la création de l'interface utilisateur.
