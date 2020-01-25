#!/usr/bin/env bash
for device in $(qdbus --literal org.kde.kdeconnect /modules/kdeconnect org.kde.kdeconnect.daemon.devices); do
deviceid=$(echo "$device" | awk -F'["|"]' '{print $2}')
echo deviceId: $deviceid
devicename=$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$deviceid org.kde.kdeconnect.device.name)
echo deviceName: $devicename
isreach="$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$deviceid org.kde.kdeconnect.device.isReachable)"
istrust="$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$deviceid org.kde.kdeconnect.device.isTrusted)"
echo isReachable: $isreach, isTrusted: $istrust
if [ "$isreach" = "true" ] && [ "$istrust" = "true" ]
then
    battery="$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$deviceid  org.kde.kdeconnect.device.battery.charge)"
    echo battery: $battery
    echo loadedPlugins: "$(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$deviceid org.kde.kdeconnect.device.loadedPlugins)"
    qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$deviceid/ping org.kde.kdeconnect.device.ping.sendPing
fi
echo -------------------------
done
