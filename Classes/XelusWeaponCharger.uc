class XelusWeaponCharger extends xWeaponBase;

#exec OBJ LOAD FILE=..\StaticMeshes\XELUS_VanillaHQ.usx
#exec OBJ LOAD FILE=..\Textures\XELUS_VanillaHQ_TEX.utx

defaultproperties
{
    PowerUp=None
    StaticMesh=StaticMesh'XELUS_VanillaHQ.PickupChargers.ChargerWeapon'
    Skins(0)=Shader'XELUS_VanillaHQ_TEX.Chargers.Charger_Weapon_01_SH'
    Skins(1)=Texture'XELUS_VanillaHQ_TEX.Chargers.Charger_Weapon_01'
    RemoteRole=ROLE_SimulatedProxy
    bAlwaysRelevant=True
    bStatic=False
    NetUpdateFrequency=0.100000
    NetPriority=1.400000
}