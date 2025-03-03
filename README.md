# Wolfram

## Description

Le projet Wolfram consiste à implémenter un [automate cellulaire élémentaire](https://en.wikipedia.org/wiki/Elementary_cellular_automaton) dans le terminal en Haskell. Il s'agit de reproduire les règles d'évolution d'un automate de Wolfram sur un espace infini en simulant l'évolution des cellules génération après génération.

## Compilation

Le projet utilise Stack pour la compilation et est géré via un Makefile contenant les règles suivantes :

```make``` : Compile le projet via stack build

```make clean``` : Supprime les fichiers compilés

```make fclean``` : Supprime tous les fichiers de compilation et de build

```make re ```: Recompile entièrement le projet

## Fonctionnalités

Le programme implémente les règles suivantes :

- *Règle 30*

- *Règle 90*

- *Règle 110*

## Utilisation

Le programme prend en charge plusieurs options en ligne de commande :

```./wolfram --rule <num> [--start <num>] [--lines <num>] [--window <num>] [--move <num>]```


```--rule <num>``` : Spécifie la règle à utiliser (0->256)

```--start <num>``` : Numéro de génération à partir de laquelle l'affichage commence (par défaut 0)

```--lines <num>``` : Nombre de lignes à afficher (si omis, le programme continue indéfiniment)

```--window <num>``` : Nombre de cellules affichées sur chaque ligne (par défaut 80)

```--move <num>``` : Translation appliquée à la fenêtre d'affichage (positif : droite, négatif : gauche)

## Bonus

En bonus, toutes les 256 règles possibles ont été implémentées, permettant une simulation complète des automates cellulaires de Wolfram.
