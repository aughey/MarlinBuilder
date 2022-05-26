TARGET=$1

if [ "$TARGET" = "" ]; then
    echo "Usage: $0 <ConfigName>"
    echo "Available Configurations: "
    for config in `ls src/configs/V1*`; do
        echo "  `basename $config`"
    done
    exit 1
fi

# Check to make sure this is a valid configuration
if [ ! -f "src/configs/$TARGET" ]; then
    echo "Invalid Configuration: $TARGET"
    echo "Available Configurations: "
    for config in `ls src/configs/V1*`; do
        echo "  `basename $config`"
    done
    exit 1
fi

# If the Marlin directory does not exist, clone it
if [ ! -d "Marlin" ]; then
    echo "Marlin directory does not exist. Cloning Marlin..."
    git clone https://github.com/MarlinFirmware/Marlin.git Marlin -b bugfix-2.0.x --depth 1
fi

# Cleanup Marlin directory
(cd Marlin && \
    git checkout . && \
    git reset --hard && \
    git clean -f)

# Configure for our target
src/core/configure-for-machine $TARGET
src/core/build-for-machine