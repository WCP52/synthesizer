function render {
    echo "Rendering $1..."
    gerbv -x png -p "gvp/$2.gvp" -D600 -a
    optipng output.png -quiet
    mv output.png "renders/$2.png"
    convert "renders/$2.png" -scale '33%' "renders/$2_small.png"
}

render "top/bottom composite" render_2l
render "layer 1" render_lyr1
render "layer 2" render_lyr2
render "layer 3" render_lyr3
render "layer 4" render_lyr4
