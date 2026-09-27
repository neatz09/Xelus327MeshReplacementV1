class XelusLightningRiflePickup extends SniperRiflePickup;

#exec OBJ LOAD FILE=..\StaticMeshes\FixedXweapons_SM.usx
#exec OBJ LOAD FILE=..\Textures\FixedXWeapons_TEX.utx

defaultproperties
{
    InventoryType=class'SniperRifle'
    StaticMesh=StaticMesh'FixedXweapons_SM.LightningRiflePickup'
    Skins(1)=Shader'FixedXWeapons_TEX.Skins.SniperScreen1Cshader'
    Skins(2)=Texture'FixedXWeapons_TEX.Skins.SniperScreen2'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}