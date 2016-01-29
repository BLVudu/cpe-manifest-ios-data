package com.wb.nextgen.data.models;

import java.net.MalformedURLException;
import java.net.URL;

import org.w3c.dom.DOMException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wb.nextgen.data.enums.SubtitleFormat;

/*
	<xs:complexType name="InventorySubtitle-type">
		<xs:complexContent>
			<xs:extension base="md:DigitalAssetSubtitleData-type">
				<xs:sequence>
					<xs:element name="ContainerReference" type="manifest:ContainerReference-type" minOccurs="0"/>
				</xs:sequence>
			<xs:attribute name="SubtitleTrackID" type="manifest:SubtitleTrackID-type" use="required"/>
			</xs:extension>
		</xs:complexContent>
	</xs:complexType>
	
	<xs:complexType name="DigitalAssetSubtitleData-type">
		<xs:sequence>
			<xs:element name="Format" type="md:DigitalAssetSubtitleFormat-type" minOccurs="0"/>
			<xs:element name="Description" type="xs:string" minOccurs="0"/>
			<xs:element name="Type" type="md:string-Subtitle-Type" maxOccurs="unbounded"/>
			<xs:element name="FormatType" type="md:string-Subtitle-FormatType" minOccurs="0"/>
			<xs:element name="Language" type="md:language-redefine"/>
			<xs:element name="Encoding" type="xs:anyType" minOccurs="0"/>
			<xs:element name="CardsetList" type="md:DigitalAssetCardsetList-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="TrackReference" type="md:string-TrackReference" minOccurs="0"/>
			<xs:element name="TrackIdentifier" type="md:ContentIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Private" type="md:PrivateData-type" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
 */
public class Subtitle {
	
	static final String NODE_ROOT = "manifest:Subtitle";
	
	private final String ATTRIBUTE_SUBTITLE_TRACK_ID = "SubtitleTrackID";
	
	private final String NODE_FORMAT = "Format";
	private final String NODE_DECRIPTION = "Description";
	private final String NODE_TYPE = "Type";
	private final String NODE_LANGUAGE = "Language";
	private final String NODE_ENCODING = "Encoding";
	// TODO: CardsetList
	// TODO: TrackReference
	// TODO: TrackIdentifier
	// TODO: Private
	private final String NODE_CONTAINER_REFERENCE = "manifest:ContainerReference";
	private final String NODE_CONTAINER_LOCATION = "manifest:ContainerLocation";
	
	public String subtitleTrackId;
	private SubtitleFormat format;
	private String description;
	private String type;
	private String formatType;
	private String language;
	private String encoding;
	private URL url;
	
	public Subtitle(Element xmlElement) {
		this.subtitleTrackId = xmlElement.getAttribute(ATTRIBUTE_SUBTITLE_TRACK_ID);
		
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				String nodeText = nodeElement.getTextContent();
				
				switch (childNode.getNodeName()) {
				case NODE_FORMAT:
					this.format = SubtitleFormat.valueOf(nodeText);
					break;
					
				case NODE_DECRIPTION:
					this.description = nodeText;
					break;
					
				case NODE_TYPE:
					this.type = nodeText;
					break;
					
				case NODE_LANGUAGE:
					this.language = nodeText;
					break;
					
				case NODE_ENCODING:
					this.encoding = nodeText;
					break;
					
				case NODE_CONTAINER_REFERENCE:
					NodeList locationNodes = nodeElement.getElementsByTagName(NODE_CONTAINER_LOCATION);
					if (locationNodes.getLength() > 0) {
						try {
							this.url = new URL(locationNodes.item(0).getTextContent());
						} catch (MalformedURLException | DOMException e) {
							e.printStackTrace();
						}
					}
					break;
				}
			}
		}
	}
	
	@Override public String toString() {
		return "[" + this.subtitleTrackId + "] " + this.url;
	}

}
