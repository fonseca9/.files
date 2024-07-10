
#!/bin/bash

BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)

# Aumentar o brilho
if [ "$1" = "up" ]; then
    NEW=$((BRIGHTNESS + MAX / 10))
    [ $NEW -gt $MAX ] && NEW=$MAX
fi

# Diminuir o brilho
if [ "$1" = "down" ]; then
    NEW=$((BRIGHTNESS - MAX / 10))
    [ $NEW -lt 0 ] && NEW=0
fi

echo $NEW | sudo tee /sys/class/backlight/intel_backlight/brightness
