class XelusHealthMedBoxPickup extends HealthPack;

function bool IsSuperItem()
{
    return Super.IsSuperItem()
        || (MyMarker != None && MyMarker.bSuperPickup);
}

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    Physics=PHYS_None
    bShouldBaseAtStartup=False
    RotationRate=(Yaw=0)
    DrawScale=0.5
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.PICKUPHealthMedbox'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}