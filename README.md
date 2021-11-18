# Rebrand Boot Recovery
Simple script to export rebranding assets to spesicic sizes.

### Dependencies
- ImageMagick

### Usaga
Make sure your assets is already in assets directory. See directory tree to make sure your assets is saved properly.

```bash
assets
├── fastbootd.png
├── logo_image.png
├── logo_image_switch.png
├── logo_nenggala.svg
└── loop
    ├── loop00000.png
    ├── loop00001.png
    ├── loop00002.png
    ├── loop00003.png
    ├── loop00004.png
    ├── loop00005.png
    ├── loop00006.png
    ├── loop00007.png
    ├── loop00008.png
    ├── loop00009.png
    ├── loop00010.png
    ├── loop00011.png
    ├── loop00012.png
    ├── loop00013.png
    ├── loop00014.png
    ├── loop00015.png
    ├── loop00016.png
    ├── loop00017.png
    ├── loop00018.png
    ├── loop00019.png
    ├── loop00020.png
    ├── loop00021.png
    ├── loop00022.png
    ├── loop00023.png
    ├── loop00024.png
    ├── loop00025.png
    ├── loop00026.png
    ├── loop00027.png
    ├── loop00028.png
    └── loop00029.png

1 directory, 34 files
``` 

Then, open your terminal and navigate to `rebrand-bootrecovery.sh` directory.
run

```bash
bash rebrand-bootrecovery.sh nenggala
# you can replace text nenggala with everything you want
```

Wait until the process finish, the exported file will saved in `assets-nenggala/*` directory with proper size based on LineageOS boot recovery assets.
You can use exported images inside `assets-nenggala` directory to overide assets in https://github.com/nenggala-project/android_bootable_recovery

### Limitation
Currently, this tool only processing fastbootd.png logo_image_switch.png, logo_image.png, and loop PNG sequence.
