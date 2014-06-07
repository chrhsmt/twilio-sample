jQuery ->
    button_selector = "button#call"
    $("body").delegate button_selector, "click", () ->
        $(".alert").removeClass('in alert-danger alert-success')
        $(button_selector).button 'loading'
        $.ajax {
            url: "/call"
            type: "POST"
            dataType: "json"
            data: {
                tel: $("input#tel").val()
            }
            success: (json) ->
                $(".alert").addClass('in alert-success')
                $(".alert").text('call中です。少々お待ちくださいませ。')
            error: (json) ->
                $(".alert").addClass('in alert-danger')
                $(".alert").text('エラーが発生しました')
            complete: (xhr, status) ->
                $(button_selector).button 'reset'
        }