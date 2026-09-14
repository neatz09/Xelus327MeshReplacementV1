class XelusShockAmmoPickup extends ShockAmmoPickup;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.AmmoShock'
    Skins(0)=Texture'XELUS_VanillaHQ_TEX.Ammo.Ammo_Shock_Core_01'
    Skins(1)=Shader'XELUS_VanillaHQ_TEX.Ammo.Ammo_Shock_Core_01_SH'
    PrePivot=(Z=32.0335)
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}