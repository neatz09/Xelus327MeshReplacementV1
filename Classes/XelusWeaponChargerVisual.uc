class XelusWeaponChargerVisual extends StaticMeshActor;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

defaultproperties
{
    DrawType=DT_StaticMesh
    StaticMesh=StaticMesh'XELUS_VanillaHQ.PickupChargers.ChargerWeapon'
    DrawScale=0.500000
    PrePivot=(Z=3.700000)
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    bNoDelete=False
    bCollideActors=False
    bBlockActors=False
    bBlockPlayers=False
    bHardAttach=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}
