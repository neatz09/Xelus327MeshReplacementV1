class XelusJumpPadVisual extends StaticMeshActor;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    DrawType=DT_StaticMesh
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Misc.JumpPad'
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    bNoDelete=False
    bCollideActors=False
    bBlockActors=False
    bBlockPlayers=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}
