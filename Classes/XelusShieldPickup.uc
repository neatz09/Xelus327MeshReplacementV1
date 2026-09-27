class XelusShieldPickup extends ShieldPack;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.PICKUPShield'
    Skins(0)=Texture'XELUS_VanillaHQ_TEX.ShieldS.Shield'
    Skins(1)=Shader'XELUS_VanillaHQ_TEX.ShieldS.Shield_Pulse_SH'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}