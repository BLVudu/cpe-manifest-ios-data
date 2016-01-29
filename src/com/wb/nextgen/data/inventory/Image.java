package com.wb.nextgen.data.inventory;

import java.net.MalformedURLException;
import java.net.URL;

import org.w3c.dom.DOMException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/*
 * <xs:complexType name="InventoryImage-type">
		<xs:complexContent>
			<xs:extension base="md:DigitalAssetImageData-type">
				<xs:sequence>
					<xs:element name="ContainerReference" type="manifest:ContainerReference-type" minOccurs="0"/>
					<xs:element name="VideoFrameTimecode" minOccurs="0">
						<xs:complexType>
							<xs:complexContent>
								<xs:extension base="manifest:Timecode-type">
									<xs:attribute name="VideoTrackID" type="manifest:VideoTrackID-type" use="required"/>
								</xs:extension>
							</xs:complexContent>
						</xs:complexType>
					</xs:element>
				</xs:sequence>
				<xs:attribute name="ImageID" type="manifest:ImageID-type"/>
			</xs:extension>
		</xs:complexContent>
	</xs:complexType>
	
	<xs:complexType name="DigitalAssetImageData-type">
		<xs:sequence>
			<xs:element name="Width" type="xs:int"/>
			<xs:element name="Height" type="xs:int"/>
			<xs:element name="Encoding" type="md:string-Image-Encoding"/>
			<xs:element name="Language" type="md:language-redefine" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="TrackReference" type="md:string-TrackReference" minOccurs="0"/>
			<xs:element name="TrackIdentifier" type="md:ContentIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Private" type="md:PrivateData-type" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
 */
public class Image {
	
	static final String NODE_ROOT = "manifest:Image";
	
	private final String ATTRIBUTE_IMAGE_ID = "ImageID";
	
	private final String NODE_WIDTH = "Width";
	private final String NODE_HEIGHT = "Height";
	private final String NODE_ENCODING = "Encoding";
	private final String NODE_LANGUAGE = "Language";
	private final String NODE_CONTAINER_REFERENCE = "manifest:ContainerReference";
	private final String NODE_CONTAINER_LOCATION = "manifest:ContainerLocation";
	// TODO: VideoFrameTimecode
	// TODO: TrackReference
	// TODO: TrackIdentifier
	// TODO: Private
	
	public String imageId;
	private int width;
	private int height;
	private String encoding;
	private String language;
	private URL url;
	
	public Image(Element xmlElement) {
		this.imageId = xmlElement.getAttribute(ATTRIBUTE_IMAGE_ID);
		
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				String nodeText = nodeElement.getTextContent();
				
				switch (childNode.getNodeName()) {
				case NODE_WIDTH:
					this.width = Integer.parseInt(nodeText);
					break;
					
				case NODE_HEIGHT:
					this.height = Integer.parseInt(nodeText);
					break;
					
				case NODE_ENCODING:
					this.encoding = nodeText;
					break;
					
				case NODE_LANGUAGE:
					this.language = nodeText;
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
		return "[" + this.imageId + "] " + this.url;
	}

}
