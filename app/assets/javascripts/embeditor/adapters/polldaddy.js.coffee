class Embeditor.Adapters.Polldaddy extends Embeditor.Adapters.Oembed
    @Path = "http://polldaddy.com/oembed"

    @QueryDefaults =
        maxheight : 550
        maxwidth  : 620
        format    : 'json'


    constructor: (@element, options={}) ->
        super

        # Work around a polldaddy bug where the oembed endpoint doesn't
        # probably recognize https URL's given to it.
        if @href.match(/^https/)
            @href = @href.replace(/^https/, 'http')
