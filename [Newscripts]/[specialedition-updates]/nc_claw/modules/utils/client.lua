function utils:cameraToWorld(flags, ignore)
    local coord = GetGameplayCamCoord()
    local rot = GetGameplayCamRot(0)
    local rx = math.pi / 180 * rot.x
    local rz = math.pi / 180 * rot.z
    local cosRx = math.abs(math.cos(rx))
    local direction = {
        x = -math.sin(rz) * cosRx,
        y = math.cos(rz) * cosRx,
        z = math.sin(rx)
    }
    local sphereCast = StartShapeTestSweptSphere(
        coord.x + direction.x,
        coord.y + direction.y,
        coord.z + direction.z,
        coord.x + direction.x * 200,
        coord.y + direction.y * 200,
        coord.z + direction.z * 200,
        0.2,
        flags,
        ignore,
        7
    );
    return GetShapeTestResult(sphereCast);
end
