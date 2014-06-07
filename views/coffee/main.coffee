jQuery ->
    button_selector = "button#call"
    $("body").delegate button_selector, "click", () ->
        $(button_selector).button 'loading'
        $.ajax {
            url: "/call"
            type: "POST"
            dataType: "json"
            data: {
                tel: $("input#tel").val()
            }
            success: (json) ->
                console.log json
            complete: (xhr, status) ->
                $(button_selector).button 'reset'
        }