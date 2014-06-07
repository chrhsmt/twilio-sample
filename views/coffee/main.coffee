jQuery ->
    button_selector = "button#call"
    $("body").delegate button_selector, "click", () ->
        if $("input#tel").val().length == 0
            $(".alert").addClass('in alert-danger')
            $(".alert").text('電話番号を入力してください。')
        else
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