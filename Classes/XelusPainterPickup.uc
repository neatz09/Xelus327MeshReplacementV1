class XelusPainterPickup extends PainterPickup;

function bool IsSuperItem()
{
    return Super.IsSuperItem()
        || (MyMarker != None && MyMarker.bSuperPickup);
}