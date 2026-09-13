class XelusAdrenalinePickup extends AdrenalinePickup;

#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

var Material RepAdrenalineSkin;

replication
{
    reliable if (Role == ROLE_Authority)
        RepAdrenalineSkin;
}

simulated event PostNetReceive()
{
    Super.PostNetReceive();
    if (RepAdrenalineSkin != None)
        Skins[0] = RepAdrenalineSkin;
}

defaultproperties
{
    StaticMesh=StaticMesh'XPickups_rc.AdrenalinePack'
    RemoteRole=ROLE_DumbProxy
    bAlwaysRelevant=True
    bOnlyReplicateHidden=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}
