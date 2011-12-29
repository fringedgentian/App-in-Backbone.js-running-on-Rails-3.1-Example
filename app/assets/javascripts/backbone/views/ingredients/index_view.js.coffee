Blog2.Views.Ingredients ||= {}

class Blog2.Views.Ingredients.IndexView extends Backbone.View
  template: JST["backbone/templates/ingredients/index"]

  initialize: () ->
    @options.ingredients.bind('reset', @addAll)

  addAll: () =>
    @options.ingredients.each(@addOne)

  addOne: (ingredient) =>
    view = new Blog2.Views.Ingredients.IngredientView({model : ingredient})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(ingredients: @options.ingredients.toJSON() ))
    @addAll()

    return this
