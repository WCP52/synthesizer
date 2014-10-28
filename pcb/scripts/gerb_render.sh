echo Rendering top/bottom composite...
gerbv -x png -p gvp/render_2l.gvp -D600 -a
optipng output.png -quiet
mv output.png renders/render_2l.png

echo Rendering layer 1...
gerbv -x png -p gvp/render_lyr1.gvp -D600 -a
optipng output.png -quiet
mv output.png renders/render_lyr1.png

echo Rendering layer 2...
gerbv -x png -p gvp/render_lyr2.gvp -D600 -a
optipng output.png -quiet
mv output.png renders/render_lyr2.png

echo Rendering layer 3...
gerbv -x png -p gvp/render_lyr3.gvp -D600 -a
optipng output.png -quiet
mv output.png renders/render_lyr3.png

echo Rendering layer 4...
gerbv -x png -p gvp/render_lyr4.gvp -D600 -a
optipng output.png -quiet
mv output.png renders/render_lyr4.png
