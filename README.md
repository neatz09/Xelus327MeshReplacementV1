# Xelus327 Mesh Replacement

**Source Author:** Neatz09  
**Description:** For use with Xelus327 asset packs in UT2004  
**Release Version:** v1

Special thanks to **Xelus327** for the time and effort put into creating these asset mods for **Unreal Tournament 2004**. This project is intended to complement his work and provide an easy way to use his asset packs through a configurable mutator.

## Requirements

This mutator requires the following Xelus327 asset packs:

- [Re-mesh](https://www.nexusmods.com/unrealtournament2004/mods/2404) — Required mesh and texture assets.
- [Fixed Vanilla Weapons](https://www.nexusmods.com/unrealtournament2004/mods/2453) — Required weapon assets.

## Installation

1. Download the required **Xelus327 asset packs**:
   - [Re-mesh](https://www.nexusmods.com/unrealtournament2004/mods/2404)
   - [Fixed Vanilla Weapons](https://www.nexusmods.com/unrealtournament2004/mods/2453)

2. Install the assets from both packs into your UT2004 installation according to their respective installation instructions.

3. Download the `Xelus327MeshReplacement.u` and `Xelus327MeshReplacement.ucl` files from this project and place them into your UT2004 `System` folder.

4. Launch **Unreal Tournament 2004**.

5. Enable **Xelus327 Mesh Replacement** from the in-game **Mutator** menu.

6. Configure the mutator options as desired.

## Server Installation

This package also supports **server replication**.

1. Obtain the required **Xelus327 asset packs**:
   - [Re-mesh](https://www.nexusmods.com/unrealtournament2004/mods/2404)
   - [Fixed Vanilla Weapons](https://www.nexusmods.com/unrealtournament2004/mods/2453)

2. Install the required game assets from both packs on the server.

3. Place the `Xelus327MeshReplacement.u` and `Xelus327MeshReplacement.ucl` files from this project into the server's `System` folder.

4. Add the following to your server's `UT2004.ini`:

 ini
ServerPackages=Xelus327MeshReplacement
    Restart the server.
    Enable the mutator through your server's mutator configuration.

Both the client and server need the required Xelus327 assets installed for the replacement meshes to function correctly.

Credits

    Neatz09 — Xelus327 Mesh Replacement mutator.
    Xelus327 — Original asset packs, meshes, textures, and weapon work.
