#!/bin/bash

# check main assets
assetsDir=assets
if [[ ! -d $assetsDir ]]; then
    echo -e "No assets folder found! \nExit now!"
    exit 1
fi

if [[ ! -f $assetsDir/fastbootd.png ]]; then
    echo -e "No fastbootd.png found! \nExit now!"
    exit 1
fi

if [[ ! -f $assetsDir/logo_image_switch.png ]]; then
    echo -e "No logo_image_switch.png found! \nExit now!"
    exit 1
fi

if [[ ! -f $assetsDir/logo_image.png ]]; then
    echo -e "No logo_image.png found! \nExit now!"
    exit 1
fi

if [[ ! -d $assetsDir/loop ]]; then
    echo -e "No loop images dir! \nExit now!"
    exit 1
fi

# create folder res-hdpi/images res-mdpi/images res-xhdpi/images res-xxhdpi/images res-xxxhdpi/images
if [[ ! -d assets-$1 ]]; then
    mkdir assets-$1
else
    rm -rf assets-$1
    mkdir assets-$1
fi

cd assets-$1/
mkdir -p res-mdpi/images \
        res-hdpi/images \
        res-xhdpi/images \
        res-xxhdpi/images \
        res-xxxhdpi/images
cd ..

# set some fuctions
cv_mdpi() {     
    convert -geometry 256x160 assets/"$2" assets-"$1"/res-mdpi/images/"$2"
    if [[ -f assets-"$1"/res-mdpi/images"$2" ]]; then
        echo "$2 exported to mdpi"
    else
        echo "failed to export $2"
    fi
}

cv_hdpi() {     
    convert -geometry 384x240 assets/"$2" assets-$1/res-hdpi/images/"$2"
    if [[ -f assets-"$1"/res-hdpi/images"$2" ]]; then
        echo "$2 exported to hdpi"
    else
        echo "failed to export $2"
    fi
}

cv_xhdpi() {     
    convert -geometry 512x320 assets/"$2" assets-"$1"/res-xhdpi/images/"$2"
    if [[ -f assets-"$1"/res-xhdpi/images"$2" ]]; then
        echo "$2 exported to xhdpi"
    else
        echo "failed to export $2"
    fi
}

cv_xxhdpi() {     
    convert -geometry 768x480 assets/"$2" assets-"$1"/res-xxhdpi/images/"$2"
    if [[ -f assets-"$1"/res-xxhdpi/images"$2" ]]; then
        echo "$2 exported to xxhdpi"
    else
        echo "failed to export $2"
    fi
}

cv_xxxhdpi() {     
    convert -geometry 1024x640 assets/"$2" assets-"$1"/res-xxxhdpi/images/"$2"
    if [[ -f assets-"$1"/res-xxxhdpi/images"$2" ]]; then
        echo "$2 exported to xxxhdpi"
    else
        echo "failed to export $2"
    fi
}

echo -e "Processing fastbootd.png"
# convert fastbootd (1024x640)
    # res-mdpi 256x160
    cv_mdpi $1 fastbootd.png

    # res-hdpi 384x240
    cv_hdpi $1 fastbootd.png 

    # res-xhdpi 512x320
    cv_xhdpi $1 fastbootd.png 

    # res-xxhdpi 768x480
    cv_xxhdpi $1 fastbootd.png 

    # res-xxxhdpi 1024x640
    cv_xxxhdpi $1 fastbootd.png 
echo -e "fastbootd.png processed \n"
sleep 1

echo -e "Processing logo_image_switch.png"
# convert logo image switch (1024x640)
    # res-mdpi 256x160
    cv_mdpi $1 logo_image_switch.png

    # res-hdpi 384x240
    cv_hdpi $1 logo_image_switch.png

    # res-xhdpi 512x320
    cv_xhdpi $1 logo_image_switch.png

    # res-xxhdpi 768x480
    cv_xxhdpi $1 logo_image_switch.png

    # res-xxxhdpi 1024x640
    cv_xxxhdpi $1 logo_image_switch.png
echo -e "logo_image_switch.png processed \n"
sleep 1

echo -e "Processing logo_image.png"
# convert logo image (1024x640)
    # res-mdpi 256x160
    cv_mdpi $1 logo_image.png

    # res-hdpi 384x240
    cv_hdpi $1 logo_image.png

    # res-xhdpi 512x320
    cv_xhdpi $1 logo_image.png

    # res-xxhdpi 768x480
    cv_xxhdpi $1 logo_image.png

    # res-xxxhdpi 1024x640
    cv_xxxhdpi $1 logo_image.png
echo -e "logo_image.png processed \n"
sleep 1

echo -e "Processing loop00000.png-loop00029.png"
# convert loop (800x800 30f)
    cd assets/loop
    # res-mdpi 200x200
    for i in *.png; 
    do 
        convert -geometry 200x200 $i "../../assets-$1/res-mdpi/images/${i%.*}.png";
        if [[ -f ../../assets-$1/res-mdpi/images/${i%.*}.png ]]; then
            echo -e "Processing $i to mdpi"
        else 
            echo -e "Failed to process $1"
        fi
        convert -geometry 400x400 $i "../../assets-$1/res-hdpi/images/${i%.*}.png"; 
        if [[ -f ../../assets-$1/res-hdpi/images/${i%.*}.png ]]; then
            echo -e "Processing $i to hdpi"
        else 
            echo -e "Failed to process $1"
        fi
        convert -geometry 600x600 $i "../../assets-$1/res-xhdpi/images/${i%.*}.png"; 
        if [[ -f ../../assets-$1/res-xhdpi/images/${i%.*}.png ]]; then
            echo -e "Processing $i to xhdpi"
        else 
            echo -e "Failed to process $1"
        fi
        convert -geometry 800x800 $i "../../assets-$1/res-xxhdpi/images/${i%.*}.png"; 
        if [[ -f ../../assets-$1/res-xxhdpi/images/${i%.*}.png ]]; then
            echo -e "Processing $i to xxhdpi"
        else 
            echo -e "Failed to process $1"
        fi
        convert -geometry 200x200 $i "../../assets-$1/res-xxxhdpi/images/${i%.*}.png"; 
        if [[ -f ../../assets-$1/res-xxxhdpi/images/${i%.*}.png ]]; then
            echo -e "Processing $i to xxxhdpi \n"
        else 
            echo -e "Failed to process $1 \n"
        fi
    done
    # res-hdpi 300x300
    # res-xhdpi 400x400
    # res-xxhdpi 600x600
    # res-xxxhdpi 800x800
echo -e "loop00000.png-loop00029 processed \n"
sleep 1
cd ../..

echo -e "Have a nice day!"
