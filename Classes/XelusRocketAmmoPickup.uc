class XelusRocketAmmoPickup extends RocketAmmoPickup;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.AmmoRockets'
    Skins(0)=Texture'XELUS_VanillaHQ_TEX.Ammo.Ammo_Rockets_01'
    DrawScale3D=(X=1.000000,Y=1.000000,Z=1.000000)
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}