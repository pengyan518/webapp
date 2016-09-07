# console.log('\'Allo \'Allo!')
'use strict'
### global Modernizr ###
### global Response ###
  
  
MAINACTION =
  init: ->
    @markupShareBtn()
    @runBtnShareAction()
    @hoverSharedBtn()
      
      


  btnShareAction: (shareBtn, $currentUrl) ->
    shareBtn.click ->       
      shareUrl = 
        if $(@).hasClass('shenyun-glyphs-facebook')
          'https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2F' + $currentUrl
        else if $(@).hasClass('shenyun-glyphs-twitter')
          'https://twitter.com/home?status=http%3A//' + $currentUrl
        else if $(@).hasClass('shenyun-glyphs-pinterest')
          'https://pinterest.com/pin/create/button/?url=http%3A//' + $currentUrl
        else if $(@).hasClass('shenyun-glyphs-googleplus')
          'https://plus.google.com/share?url=http%3A//' + $currentUrl
        

      window.open(shareUrl,'myWindow','width=560,height=392')
      console.log($currentUrl + ' open!') 


  runBtnShareAction: ->
    # window.history.pushState(null, null, '?' + 'photo=' + index)

    shareBtn = $('#wal-video-share-area').find('.shenyun-glyphs')
    # $currentUrlStr = $('.lg-outer .lg-item').eq(index).find('.lg-image').attr 'src'
    $currentUrl = window.location.hostname + window.location.pathname + window.location.search
    # $currentUrl = $currentUrlStr.split('//')[1]
    # console.log(index + $currentUrl + ' --- ' + $currentUrlStr) 
    console.log($currentUrl) 
    MAINACTION.btnShareAction(shareBtn, $currentUrl)

      


  markupShareBtn: ->
    shareBtnHtml = """
      <div id="wal-video-share-area">
        <a class="shenyun-glyphs-facebook shenyun-glyphs hand"></a>
        <a class="shenyun-glyphs-twitter shenyun-glyphs hand"></a>
        <a class="shenyun-glyphs-googleplus shenyun-glyphs hand"></a>
        <a class="shenyun-glyphs-pinterest shenyun-glyphs hand"></a></div>
      """
    # if not $('#wal-video-share-area').length 
    $('#wal-video-share-area-placeholder').append(shareBtnHtml)

  hoverSharedBtn: ->
    btn = $('#wal-top-video-share-btn')

    showShare = ->
      btn.fadeOut()
      $('#wal-video-share-area-placeholder').fadeIn()

    hideShare = ->
      btn.fadeIn()
      $('#wal-video-share-area-placeholder').fadeOut()



    hoverConfig =
      interval: 0
      sensitivity: 7
      over: showShare
      timeout: 0
      out: hideShare

    $('#share-trigger-wrapper').hoverIntent(hoverConfig)





$ ->
  MAINACTION.init()