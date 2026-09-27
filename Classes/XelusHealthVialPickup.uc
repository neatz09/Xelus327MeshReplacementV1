class XelusHealthVialPickup extends MiniHealthPack;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.PICKUPMiniHealth'
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.Health.Health_01_Small_Inner_SH'
    Skins(1)=Texture'XELUS_VanillaHQ_TEX.Health.Health_01_Small'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}
