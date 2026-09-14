class XelusAssaultAmmoPickup extends AssaultAmmoPickup;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.AmmoAssault'
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.Ammo.Ammo_Assault_01_SH'
    PrePivot=(Z=0.1040)
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}