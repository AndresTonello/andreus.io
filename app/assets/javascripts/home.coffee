# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('[data-tooltip="true"]').tooltip()

  # Select all links with hashes
  $('a[href*="#"]').not('[href="#"]').not('[href="#0"]').click (event) ->
    # On-page links
    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
      # Figure out element to scroll to
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
      # Does a scroll target exist?
      if target.length
        # Only prevent default if animation is actually gonna happen
        event.preventDefault()
        $('.sections-wrapper').animate { scrollTop: target.offset().top }, 600, ->
          # Callback after animation
          # Must change focus!
          $target = $(target)
          $target.focus()
          if $target.is(':focus')
            # Checking if the target was focused
            return false
          else
            $target.attr 'tabindex', '-1'
            # Adding tabindex for elements not focusable
            $target.focus()
            # Set focus again
          return
    return
