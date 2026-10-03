class XelusSuperHealthPickup extends SuperHealthPack;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.PICKUPHealthSuper'
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.Health.Health_03_Super_SH'
    Skins(1)=Shader'XELUS_VanillaHQ_TEX.Health.Health_02_ALT_SH'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}
