class XelusClassicSniperAmmoPickup extends ClassicSniperAmmoPickup;

#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx
#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.AmmoSniper'
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.Ammo.Ammo_Sniper_01_SH'
    DrawScale3D=(X=1.000000,Y=1.000000,Z=1.000000)
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}