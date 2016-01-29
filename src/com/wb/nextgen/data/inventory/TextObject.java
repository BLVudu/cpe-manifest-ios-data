package com.wb.nextgen.data.inventory;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.w3c.dom.DOMException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wb.nextgen.data.managers.NextGenDataManager;

/*
	<xs:complexType name="InventoryTextObject-type">
		<xs:choice>
			<xs:element name="ContainerReference">
				<xs:complexType>
					<xs:complexContent>
						<xs:extension base="manifest:ContainerReference-type">
							<xs:attribute name="type" type="xs:string"/>
						</xs:extension>
					</xs:complexContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="SubtitleID" type="manifest:SubtitleTrackID-type"/>
			<xs:element name="TextString" maxOccurs="unbounded">
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:string">
							<xs:attribute name="index" type="xs:integer"/>
						</xs:extension>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
		</xs:choice>
		<xs:attribute name="TextObjectID" type="manifest:TextObjectID-type" use="required"/>
		<xs:attribute name="language" type="xs:language"/>
	</xs:complexType>
 */
public class TextObject {
	
	static final String NODE_ROOT = "manifest:TextObject";
	
	private final String ATTRIBUTE_TEXT_OBJECT_ID = "TextObjectID";
	private final String ATTRIBUTE_LANGUAGE = "language";
	private final String ATTRIBUTE_INDEX = "index";
	
	private final String NODE_SUBTITLE_ID = "manifest:SubtitleID";
	private final String NODE_TEXT_STRING = "manifest:TextString";
	private final String NODE_CONTAINER_REFERENCE = "manifest:ContainerReference";
	private final String NODE_CONTAINER_LOCATION = "manifest:ContainerLocation";
	
	public String textObjectId;
	private String language;
	// TODO: ContainerReference
	private Subtitle subtitle;
	private Map<Integer, String> textStringMap = new HashMap<Integer, String>();
	private URL url;
	
	public TextObject(Element xmlElement) {
		this.textObjectId = xmlElement.getAttribute(ATTRIBUTE_TEXT_OBJECT_ID);
		this.language = xmlElement.getAttribute(ATTRIBUTE_LANGUAGE);
		
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				String nodeText = nodeElement.getTextContent();
				
				switch (childNode.getNodeName()) {
				case NODE_SUBTITLE_ID:
					this.subtitle = NextGenDataManager.getInstance().getInventory().getSubtitleByTrackId(nodeText);
					break;
					
				case NODE_TEXT_STRING:
					this.textStringMap.put(Integer.parseInt(nodeElement.getAttribute(ATTRIBUTE_INDEX)), nodeText);
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
	
	public String getTextStringByIndex(Integer index) {
		return this.textStringMap.get(index);
	}

}
