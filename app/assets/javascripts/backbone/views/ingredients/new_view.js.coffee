Blog2.Views.Ingredients ||= {}

class Blog2.Views.Ingredients.NewView extends Backbone.View
  template: JST["backbone/templates/ingredients/new"]

  events:
    "submit #new-ingredient": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (ingredient) =>
        @model = ingredient
        window.location.hash = "/#{@model.id}"

      error: (ingredient, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
