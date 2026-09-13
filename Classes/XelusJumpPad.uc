class XelusJumpPad extends UTJumpPad;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx

defaultproperties
{
    DrawType=DT_StaticMesh
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Misc.JumpPad'
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    bNoDelete=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}