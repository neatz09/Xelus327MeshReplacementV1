Xelus327 Mesh Replacement

Source Author: neatz09
Description: For use with Xelus327 asset packs in UT2004
Release Version: v1

A UT2004 mutator designed for use with Xelus327's asset packs, providing mesh replacements with configurable options and server replication support.

Thanks

Special thanks to Xelus327 for the time and effort put into creating these asset mods for Unreal Tournament 2004. This project is intended to complement his work and provide an easy way to use the assets through a configurable mutator.

Installation

This package requires assets from two sources:

This project — contains the Xelus327MeshReplacement.u and .ucl files.
Xelus327's Re-mesh asset pack — provides the required meshes and textures. The original asset pack is available on Nexus Mods:
{"fallbackMarkdown":"Xelus327's Re-mesh on Nexus Mods
","reference":{"matched_text":"","prefix":null,"start_idx":1330,"end_idx":1425,"safe_urls":[],"refs":[],"alt":"Xelus327's Re-mesh on Nexus Mods
","prompt_text":null,"type":"url","item":{"title":"Xelus327's Re-mesh on Nexus Mods","url":"https://www.nexusmods.com/unrealtournament2004/mods/2404?utm_source=chatgpt.com","attribution":"nexusmods.com","pub_date":null,"snippet":null,"attribution_segments":null,"supporting_websites":[],"refs":[],"hue":null,"attributions":null},"title":"Xelus327's Re-mesh on Nexus Mods","logo":null,"layout":null},"showLoginRequiredCard":false}
Client Installation
Obtain the Xelus327 Re-mesh asset pack and install its StaticMeshes and Textures folders into your UT2004 installation. {"fallbackMarkdown":"(Nexus Mods
)","reference":{"matched_text":"","prefix":null,"start_idx":1583,"end_idx":1600,"safe_urls":["https://www.nexusmods.com/unrealtournament2004/mods/2404?tab=description"],"refs":[],"alt":"(Nexus Mods
)","prompt_text":null,"type":"grouped_webpages","error":null,"style":null,"status":"done","items":[{"title":"Re-mesh at Unreal Tournament 2004 Nexus - Mods and Community","url":"https://www.nexusmods.com/unrealtournament2004/mods/2404?tab=description","attribution":"Nexus Mods","pub_date":null,"snippet":null,"thumbnail_url":"https://images.openai.com/static-rsc-1/SEtj2UgEvcyUgdFrZ2DMjBCYeIeWznkuuX6s4SQu047EVYMnrf7SMCFl3cI56KrokZpEASy0PFYcg5FfEdXkJGeGNQEb7alx2PzE_8nl0n_ipouoVwzFsz30ifK1dteaV2AJQcRAucayjtAL6K-9ijWZtSVw_XHmH4Oy_VXmfJo","attribution_segments":null,"supporting_websites":[],"refs":[{"turn_index":0,"ref_type":"view","ref_index":0}],"hue":null,"attributions":null}],"fallback_items":null},"showLoginRequiredCard":false}
Obtain the files from this project and place the .u and .ucl files into your UT2004 System folder.
Launch Unreal Tournament 2004.
Enable Xelus327 Mesh Replacement from the in-game Mutator menu.
Configure the mutator options as desired.
Server Installation

This package also supports server replication.

Obtain and install the required Xelus327 Re-mesh game assets.
Place the Xelus327MeshReplacement.u and Xelus327MeshReplacement.ucl files from this project into the server's System folder.
Add the following to your server's UT2004.ini:
ServerPackages=Xelus327MeshReplacement

Restart the server.
Enable the mutator through your server's mutator configuration.

Both the client and server need the required Xelus327 assets installed for the replacement meshes to function correctly.
