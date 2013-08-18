# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  # Controller --------------------------------------------------------
  
  class ViewController
    constructor: () ->
      @prevWord = ""
      @currWord = ""

    getFieldTag: (word) ->
      return $.find(".onoma_field[value=" + word + "]")

    toggleFields: () ->
      $(@getFieldTag(@prevWord)).css("visibility", "hidden")
      $(@getFieldTag(@currWord)).css("visibility", "visible")
      @prevWord = @currWord

    getTextVal: () ->
      return $("#doc_area").val()

  viewCon = new ViewController()


  # Binding -----------------------------------------------------------
  
  $("#make_list").click (e) =>
    e.preventDefault()

    words = getWordList()
    url = urlWithParams("/keys", "list", words)

    $.ajax url,
      type: "GET"
      dataType: "html"
      success: (data, textStatus, jqXHR) -> 
        $("#wordlist").html(data)
        console.log("msg * success")
      error: ->
        console.log("msg * error")


  $("#wordlist").delegate(".keyword", "click", () ->    
    viewCon.currWord = $(this).attr("value")
    if (viewCon.prevWord != viewCon.currWord)
      viewCon.toggleFields()
  )


  # Methods ----------------------------------------------------------

  urlWithParams = (url, stringKey, stringVal) ->
    return url.concat("?")
              .concat(stringKey)
              .concat("=")
              .concat(stringVal)

  getWordList = (text) ->
    textWords = viewCon.getTextVal().split(/[\s]+/)
    uniqueWords = new Array()

    for word in textWords
      if (uniqueWords.indexOf(word) == -1)
        uniqueWords.push(word)

    return JSON.stringify(uniqueWords)