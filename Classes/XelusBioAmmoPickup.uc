class XelusBioAmmoPickup extends BioAmmoPickup;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\FixedXWeapons_TEX.utx

var Material RepGlassSkin;

replication
{
    reliable if (Role == ROLE_Authority)
        RepGlassSkin;
}

simulated event PostNetReceive()
{
    Super.PostNetReceive();
    if (RepGlassSkin != None)
        Skins[1] = RepGlassSkin;
}

defaultproperties
{
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Pickups.AmmoBio'
    RepGlassSkin=Material'FixedXWeapons_TEX.AmmoPickups.BioRifleGlassRef'
    PrePivot=(Z=10.4942)
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=True
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}