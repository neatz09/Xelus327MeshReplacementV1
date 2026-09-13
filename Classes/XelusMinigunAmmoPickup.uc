class XelusMinigunAmmoPickup extends MinigunAmmoPickup;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.AmmoMinigun'
    PrePivot=(Z=0.0)
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}