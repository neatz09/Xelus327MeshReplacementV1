class XelusClassicSuperShieldPickup extends SuperShieldPack;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.PICKUPShieldSuperHologram'
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.ShieldS.Shield_Scanlines_SH'
    Skins(1)=FinalBlend'PickupSkins.Shaders.ShieldFinal'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}