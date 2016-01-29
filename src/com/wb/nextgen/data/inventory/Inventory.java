package com.wb.nextgen.data.inventory;

import java.util.HashMap;
import java.util.Map;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/*
	<xs:complexType name="Inventory-type">
		<xs:sequence>
			<xs:element name="Audio" type="manifest:InventoryAudio-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Video" type="manifest:InventoryVideo-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Subtitle" type="manifest:InventorySubtitle-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Image" type="manifest:InventoryImage-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Interactive" type="manifest:InventoryInteractive-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Ancillary" type="manifest:InventoryAncillary-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Metadata" type="manifest:InventoryMetadata-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="TextObject" type="manifest:InventoryTextObject-type" minOccurs="0" maxOccurs="unbounded"/>
		</xs:sequence>
	</xs:complexType>
 */
public class Inventory {
	
	public static final String NODE_ROOT = "manifest:Inventory";
	
	private Map<String, Audio> audioMap = new HashMap<String, Audio>();
	private Map<String, Video> videoMap = new HashMap<String, Video>();
	private Map<String, Subtitle> subtitleMap = new HashMap<String, Subtitle>();
	private Map<String, Image> imageMap = new HashMap<String, Image>();
	private Map<String, Interactive> interactiveMap = new HashMap<String, Interactive>();
	private Map<String, Ancillary> ancillaryMap = new HashMap<String, Ancillary>();
	private Map<String, Metadata> metadataMap = new HashMap<String, Metadata>();
	private Map<String, TextObject> textObjectMap = new HashMap<String, TextObject>();
	
	public Inventory(Element xmlElement) {
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				switch (nodeElement.getNodeName()) {
				case Audio.NODE_ROOT:
					Audio audio = new Audio(nodeElement);
					this.audioMap.put(audio.audioTrackId, audio);
					break;
					
				case Video.NODE_ROOT:
					Video video = new Video(nodeElement);
					this.videoMap.put(video.videoTrackId, video);
					break;
					
				case Subtitle.NODE_ROOT:
					Subtitle subtitle = new Subtitle(nodeElement);
					this.subtitleMap.put(subtitle.subtitleTrackId, subtitle);
					break;
					
				case Image.NODE_ROOT:
					Image image = new Image(nodeElement);
					this.imageMap.put(image.imageId, image);
					break;
					
				case Interactive.NODE_ROOT:
					Interactive interactive = new Interactive(nodeElement);
					this.interactiveMap.put(interactive.interactiveTrackId, interactive);
					break;
					
				case Ancillary.NODE_ROOT:
					Ancillary ancillary = new Ancillary(nodeElement);
					this.ancillaryMap.put(ancillary.ancillaryTrackId, ancillary);
					break;
				
				case Metadata.NODE_ROOT:
					Metadata metadata = new Metadata(nodeElement);
					this.metadataMap.put(metadata.contentId, metadata);
					break;
					
				case TextObject.NODE_ROOT:
					TextObject textObject = new TextObject(nodeElement);
					this.textObjectMap.put(textObject.textObjectId, textObject);
					break;
				}
			}
		}
	}
	
	public Audio getAudioByTrackId(String audioTrackId) {
		return this.audioMap.get(audioTrackId);
	}
	
	public Video getVideoByTrackId(String videoTrackId) {
		return this.videoMap.get(videoTrackId);
	}
	
	public Subtitle getSubtitleByTrackId(String subtitleTrackId) {
		return this.subtitleMap.get(subtitleTrackId);
	}
	
	public Image getImageById(String imageId) {
		return this.imageMap.get(imageId);
	}
	
	public Interactive getInteractiveByTrackId(String interactiveTrackId) {
		return this.interactiveMap.get(interactiveTrackId);
	}
	
	public Ancillary getAncillaryByTrackId(String ancillaryTrackId) {
		return this.ancillaryMap.get(ancillaryTrackId);
	}
	
	public Metadata getMetadataByContentId(String contentId) {
		return this.metadataMap.get(contentId);
	}
	
	public TextObject getTextObjectById(String textObjectId) {
		return this.textObjectMap.get(textObjectId);
	}

}
