# Detect the distribution
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"

if [[ -f $LFILE ]]; then
    _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
    _distro="macos"
    _device=$(system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')

    case $_device in
        *MacBook*)     DEVICE="";;
        *)             DEVICE="";;
    esac
fi

# find out which distribution we are running on
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

# Set the icon based on the distro
case $_distro in
    *kali*)                  ICON="ﴣ ";;
    *arch*)                  ICON=" ";;
    *debian*)                ICON=" ";;
    *raspbian*)              ICON=" ";;
    *ubuntu*)                ICON=" ";;
    *elementary*)            ICON=" ";;
    *fedora*)                ICON=" ";;
    *coreos*)                ICON=" ";;
    *gentoo*)                ICON=" ";;
    *mageia*)                ICON=" ";;
    *centos*)                ICON=" ";;
    *opensuse*|*tumbleweed*) ICON=" ";;
    *sabayon*)               ICON=" ";;
    *slackware*)             ICON=" ";;
    *linuxmint*)             ICON=" ";;
    *alpine*)                ICON=" ";;
    *aosc*)                  ICON=" ";;
    *nixos*)                 ICON=" ";;
    *devuan*)                ICON=" ";;
    *manjaro*)               ICON=" ";;
    *rhel*)                  ICON=" ";;
    *macos*)                 ICON=" ";;
    *)                       ICON=" ";;
    # *)                       ICON=" ";;
esac

# Export the distro icon and device
export PC_DISTRO="$ICON"
export PC_DEVICE="$DEVICE"
