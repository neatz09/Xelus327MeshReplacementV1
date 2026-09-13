class XelusWeaponCharger extends xWeaponBase;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

defaultproperties
{
    PowerUp=None
    StaticMesh=StaticMesh'XELUS_VanillaHQ.PickupChargers.ChargerWeapon'
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}