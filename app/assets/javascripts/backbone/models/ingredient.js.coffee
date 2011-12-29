class Blog2.Models.Ingredient extends Backbone.Model
  paramRoot: 'ingredient'

  defaults:
    name: null

class Blog2.Collections.IngredientsCollection extends Backbone.Collection
  model: Blog2.Models.Ingredient
  url: '/ingredients'
