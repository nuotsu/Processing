// Main Page
    $('.sketches a').each(function() {
        var sketch = $(this).attr('data-sketch')
        $(this)
            .attr({
                'href': `sketches/${sketch}/index.html`
            })
            .html(`
                <img src="sketches/${sketch}/${sketch}.png">
            `)
    })

// Sketch Pages
    var sketch_title = $('title').html()
        $('head link[rel=icon]').attr({
            'href': sketch_title
        })
        $('#sketch').html(`
            <canvas data-processing-sources="${sketch_title}.pde"></canvas>
        `)
        $('#code a').attr({
            'href': `${sketch_title}.pde`
        })
