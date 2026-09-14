class XelusFlakAmmoPickup extends FlakAmmoPickup;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.AmmoFlak'
    Skins(0)=Texture'XELUS_VanillaHQ_TEX.Ammo.Ammo_Flak_01'
    Skins(1)=Shader'XELUS_VanillaHQ_TEX.Ammo.Ammo_Flak_01_SH'
    PrePivot=(Z=6.5144)
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}