class Xelus327MeshReplacementConfig extends GUIPage;

var moCheckBox FixedXWeapons;

function InitComponent(GUIController MyController, GUIComponent MyOwner)
{
    Super.InitComponent(MyController, MyOwner);
    FixedXWeapons = moCheckBox(Controls[2]);
    FixedXWeapons.Checked(class'MutXelus327MeshReplacement'.default.bEnableFixedXWeapons);
}

function bool InternalOnClick(GUIComponent Sender)
{
    class'MutXelus327MeshReplacement'.default.bEnableFixedXWeapons = FixedXWeapons.IsChecked();
    class'MutXelus327MeshReplacement'.static.StaticSaveConfig();
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    Begin Object Class=GUIButton Name=DialogBackground
        StyleName="ComboListBox"
        WinHeight=1.000000
        bBoundToParent=True
        bScaleToParent=True
        bAcceptsInput=False
        bNeverFocus=True
    End Object
    Controls(0)=GUIButton'Xelus327MeshReplacement.Xelus327MeshReplacementConfig.DialogBackground'

    Begin Object Class=GUILabel Name=DialogText
        Caption="Xelus327 Mesh Replacement"
        TextAlign=TXTA_Center
        TextColor=(B=0,G=180,R=220)
        TextFont="UT2HeaderFont"
        WinTop=0.325000
        WinHeight=32.000000
    End Object
    Controls(1)=GUILabel'Xelus327MeshReplacement.Xelus327MeshReplacementConfig.DialogText'

    Begin Object Class=moCheckBox Name=WeaponReplacementOption
        ComponentJustification=TXTA_Left
        Caption="FixedXWeapons Weapon Models"
        Hint="Enable or disable the FixedXWeapons weapon pickup models and ammo textures."
        WinTop=0.467448
        WinLeft=0.300000
        WinWidth=0.400000
        WinHeight=0.040000
    End Object
    Controls(2)=moCheckBox'Xelus327MeshReplacement.Xelus327MeshReplacementConfig.WeaponReplacementOption'

    Begin Object Class=GUIButton Name=OkButton
        Caption="OK"
        WinTop=0.600000
        WinLeft=0.400000
        WinWidth=0.200000
        OnClick=Xelus327MeshReplacementConfig.InternalOnClick
    End Object
    Controls(3)=GUIButton'Xelus327MeshReplacement.Xelus327MeshReplacementConfig.OkButton'

    WinTop=0.300000
    WinLeft=0.100000
    WinWidth=0.800000
    WinHeight=0.400000
}
