class XelusJumpPad extends UTJumpPad;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    DrawType=DT_StaticMesh
    StaticMesh=StaticMesh'XELUS_VanillaHQ.Misc.JumpPad'
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.Chargers.Charger_Jumppad_01_SH'
    Skins(1)=Texture'XELUS_VanillaHQ_TEX.Chargers.Charger_Jumppad_01'
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    bNoDelete=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}