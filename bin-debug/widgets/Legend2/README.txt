This is my TOC/Legend widget for FlexViewer 2.2
Initial Release: 3-24-2011

This is just a TOC/Legend Widget like the TOC in ArcMap. 
The TOC/legend widget displays tree-structure layers with both names and icons. It supports visibility control, scale dependency, sublayers. Also it also shows some properties of any map or layer (except subLayer). You can change the map transparency there. 

The widget works with both 9.3.1 and 10. But the legend loads so much faster with 10. 

To install, just copy the folder called Legend2 under the Widgets folder, and add this line to your config.xml

<widget label="Map Legend" left="600" top="90" 
        		icon="assets/images/legend32.png"
        		config="widgets/Legend2/Legend2Widget.xml"
        		url="widgets/Legend2/Legend2Widget.swf"/>

It's the beta version. Let me know what you think.  

Revision: 3-27-2011
1. added labels into config.xml
2. added displayMode into config.xml for a collapsed or expanded mode (thanks ryonwithano for the great suggestion)
3. added buttons to expand or collapse all layers
4. added search layer by keyword
5. set a hand cursor for clickable images 

Revision: 3-29-2011
1. improved the error handling
2. added the support for a tiled map service
3. fixed the layers ordering bug (thanks webmapper123 for reporting the bug)

Revision: 4-4-2011
1. fixed the MapLegendInfoHandler type coercion error (thanks Paulg for reporting the bug)
2. fixed the in-sync switch bewteen the property view and the view icon (thanks Robert/Erwan for reporting the bug) 
3. moved all label texts into the widget xml file (thanks erwan.caradec for the suggestion)

Revision: 4-8-2011
1. added propertyEnabled in the widget config to show or hide the property buttons (thanks lallen4585/philipp37 for the suggestion)
2. added filterEnabled in the widget config to show or hide the keyword filter and collapse/expand all buttons (thanks lallen4585 for the suggestion) 

Revision: 4-15-2011
1. added the usebasemaps tag in the widget config file to support the legend for base maps (thanks jerry0988 for the suggestion)
2. fixed a null object reference bug in the property panel (thanks erwan.caradec/nathanenge for reporting the bug) 
3. verfied nathanenge's config method of adding a map layer published as both a map service and a feature service (thanks nathanenge):
 	a. add a map service url as an operational layer and a feature service url as a feature layer in the viewer config.xml, 
 	b. then use excludelayer tag in Legend2Widget.xml to exclude the feature layer by its name.

Plaizilla