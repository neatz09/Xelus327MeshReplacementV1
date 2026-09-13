class XelusAmmoPickup extends SniperRiflePickup;

#exec OBJ LOAD FILE=..\StaticMeshes\FixedXweapons_SM.usx

defaultproperties
{
    InventoryType=class'SniperRifle'
    StaticMesh=StaticMesh'FixedXWeapons_SM.LightningRiflePickup'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}