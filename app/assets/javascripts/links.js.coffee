# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  prevWord = ""
  prevTag = $.find('.onoma_field[visibility="visible"]')

  console.log("last tag is:")
  console.log(prevTag)

  $("#wordlist").delegate(".keyword", "click", () ->
    console.log("delegated")
    
    currentWord = $(this).attr("value")
    currentTag = $.find(".onoma_field[value=" + currentWord + "]")

    if (prevWord != currentWord)
      $(prevTag).css("visibility", "hidden")
      $(currentTag).css("visibility", "visible")
      prevWord = currentWord
      prevTag = currentTag
  )

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

  $(".span6.keyword").click (e) ->
    currentWord = $(this).attr("value")
    targetTag = $(this).next(":hidden[value=" + currentWord + "]")
    console.log(targetTag)

  formToggle = (word) ->
    targetTag = $.find(":hidden[value=" + word + "]")
    console.log(targetTag)

  urlWithParams = (url, stringKey, stringVal) ->
    return url.concat("?")
              .concat(stringKey)
              .concat("=")
              .concat(stringVal)

  getWordList = () ->
    text = $("#doc_area").val()
    words = getUniqueWords(text)
    return JSON.stringify(words)

  getUniqueWords = (text) ->
    textWords = text.split(/[\s]+/)
    uniqueWords = new Array()

    for word in textWords
      if (uniqueWords.indexOf(word) == -1)
        uniqueWords.push(word)

    return uniqueWords


  