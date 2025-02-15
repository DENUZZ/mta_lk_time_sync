function getSriLankaTime()
    local utcTime = getRealTime()
    local utcHour = utcTime.hour
    local utcMinute = utcTime.minute

    local sriLankaHour = (utcHour + 5) % 24
    local sriLankaMinute = (utcMinute + 30) % 60

    if utcMinute + 30 >= 60 then
        sriLankaHour = (sriLankaHour + 1) % 24
    end

    return sriLankaHour, sriLankaMinute
end

function setServerTimeToSriLanka()
    local hour, minute = getSriLankaTime()
    setTime(hour, minute)
    setMinuteDuration(60000) -- game minute 1 real second
end

addEventHandler("onResourceStart", resourceRoot, setServerTimeToSriLanka)

function updateServerTime()
    setServerTimeToSriLanka()
    setTimer(updateServerTime, 60000, 1)
end

addEventHandler("onResourceStart", resourceRoot, updateServerTime)
