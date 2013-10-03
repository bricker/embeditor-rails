class Embeditor.Adapters.Oembed extends Embeditor.Adapter
    # Override this. Oembed endpoint.
    @Path = null

    swap: ->
        $.ajax
            url         : @adapter.Path
            type        : 'GET'
            dataType    : 'json'
            data        :  _.extend(@queryParams, {url: @href})

            success: (data, textStatus, jqXHR) =>
                @element.after(data.html)

            error: (jqXHR, textStatus, errorThrown) ->
                console.log('[embeditor oembed] error.',textStatus,errorThrown)

            complete: (jqXHR, textStatus) ->
                console.log('[embeditor oembed] complete.',textStatus)
