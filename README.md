#  TODO

Introduction : 

La lib a pour but, de sauvegarder rapidement des models répondant au protocol Codable et de les récupérer en cas de besoin.


## Installation

`pod install OrkaStorable`

## Rendre un objet compatible

Votre model doit extends `Stockable` 


## Comment ajouter un objet

Par exemple pour rajouter mon objet `Todo` dans ma liste nommée "favoris" : 

`todo.storage.add(withTag: "favoris")`

## Pour récupérer mes favoris

`let myFav = Todo.restore.find(byTag: "favoris")`

renvoi l'intégralité des `Todo` présent dans `favoris`

## Vérifier un Todo est dans une liste

`monTodo.isPresent(atTag: "favoris")`

Permet de vérifier si l'objet: `monTodo` est déjà présent dans la liste "favoris" 

## Récupérer un seul item dans une liste

`Todo.restore.find(byId id: "mon_id_de_todo", tag: "favoris")`

Permet de récupérer mon Todo portant l'id : `mon_id_de_todo` dans la liste "favoris"
