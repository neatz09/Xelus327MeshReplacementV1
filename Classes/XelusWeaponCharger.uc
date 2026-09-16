class XelusWeaponCharger extends xWeaponBase;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

defaultproperties
{
    DrawScale=0.500000
    PrePivot=(Z=3.700000)
    StaticMesh=StaticMesh'XELUS_VanillaHQ.PickupChargers.ChargerWeapon'
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}