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
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.Health.Health_04_Medbox_SH'
    Skins(1)=Shader'XELUS_VanillaHQ_TEX.Health.Health_02_ALT_SH'
    AmbientGlow=64
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}