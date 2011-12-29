Blog2.Views.Ingredients ||= {}

class Blog2.Views.Ingredients.EditView extends Backbone.View
  template : JST["backbone/templates/ingredients/edit"]

  events :
    "submit #edit-ingredient" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (ingredient) =>
        @model = ingredient
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
