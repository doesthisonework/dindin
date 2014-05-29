Dindin.Views.RecipeTile = Backbone.View.extend({
  initialize: (options) ->

  template: JST['recipes/_tile']

  events: {
    'click div.caption': 'goToShowPage'
  },

  goToShowPage: (event) ->
    that = this
    if this.model.id
      Backbone.history.navigate('/recipes/' + this.model.id, { trigger: true })
    else
      this.model.save({}, {
        success: =>
          @model.fetch({
            success: =>
              Backbone.history.navigate('/recipes/' + @model.id, { trigger: true })
              return
          })
          return
      })
      return


  render: ->
    renderedContent = this.template({
        recipe: this.model
        userIngredients: Dindin.currentUser.ingredients().pluck('name')
    })
    this.$el.html(renderedContent)
    this

  tagName: 'li'
})