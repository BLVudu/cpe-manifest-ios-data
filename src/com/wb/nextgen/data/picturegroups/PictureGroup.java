package com.wb.nextgen.data.picturegroups;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wb.nextgen.data.inventory.Image;
import com.wb.nextgen.data.managers.NextGenDataManager;
import com.wb.nextgen.data.shared.LanguageStringList;

/*
	<xs:complexType name="PictureGroup-type">
		<xs:sequence>
			<xs:element name="Picture" type="manifest:Picture-type" maxOccurs="unbounded"/>
			<xs:element name="Type" type="xs:string" minOccurs="0"/>
			<xs:element name="SubType" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="StyleRef" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
		</xs:sequence>
		<xs:attribute name="PictureGroupID" type="manifest:PictureGroupID-type"/>
	</xs:complexType>
 */
public class PictureGroup {
	
	public static final String NODE_ROOT = "manifest:PictureGroup";
	
	private final String ATTRIBUTE_PICTURE_GROUP_ID = "PictureGroupID";
	
	private final String NODE_TYPE = "manifest:Type";
	private final String NODE_SUB_TYPE = "manifest:SubType";
	private final String NODE_STYLE_REF = "manifest:StyleRef";
	
	public String pictureGroupId;
	private List<Picture> pictures = new ArrayList<Picture>();
	private String nodeType;
	private String nodeSubType;
	private String nodeStyleRef;
	
	public PictureGroup(Element xmlElement) {
		this.pictureGroupId = xmlElement.getAttribute(ATTRIBUTE_PICTURE_GROUP_ID);
		
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				String nodeText = nodeElement.getTextContent();
				
				switch (childNode.getNodeName()) {
				case Picture.NODE_ROOT:
					this.pictures.add(new Picture(nodeElement));
					break;
					
				case NODE_TYPE:
					this.nodeType = nodeText;
					break;
					
				case NODE_SUB_TYPE:
					this.nodeSubType = nodeText;
					break;
					
				case NODE_STYLE_REF:
					this.nodeStyleRef = nodeText;
					break;
				}
			}
		}
		
		// Sort pictures if using "Sequence" field
		if (this.pictures.size() > 0 && this.pictures.get(0).hasSequence ) {
			Collections.sort(this.pictures, new Comparator<Picture>() {
				@Override
			    public int compare(Picture p1, Picture p2) {
					return Integer.compare(p1.sequence, p2.sequence);
				}
			});
		}
	}
	
	/*
		<xs:complexType name="Picture-type">
			<xs:sequence>
				<xs:element name="PictureID" type="manifest:PictureID-type"/>
				<xs:element name="ImageID" type="manifest:ImageID-type"/>
				<xs:element name="ThumbnailImageID" type="manifest:ImageID-type" minOccurs="0"/>
				<xs:element name="LanguageInImage" type="xs:language" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="AlternateText" minOccurs="0" maxOccurs="unbounded">
					<xs:complexType>
						<xs:simpleContent>
							<xs:extension base="xs:string">
								<xs:attribute name="language"/>
							</xs:extension>
						</xs:simpleContent>
					</xs:complexType>
				</xs:element>
				<xs:element name="Caption" minOccurs="0" maxOccurs="unbounded">
					<xs:complexType>
						<xs:simpleContent>
							<xs:extension base="xs:string">
								<xs:attribute name="language" type="xs:language"/>
							</xs:extension>
						</xs:simpleContent>
					</xs:complexType>
				</xs:element>
				<xs:element name="Sequence" type="xs:nonNegativeInteger" minOccurs="0"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class Picture {
		
		static final String NODE_ROOT = "manifest:Picture";
		
		private final String ATTRIBUTE_LANGUAGE = "language";
		
		private final String NODE_PICTURE_ID = "manifest:PictureID";
		private final String NODE_IMAGE_ID = "manifest:ImageID";
		private final String NODE_THUMBNAIL_IMAGE_ID = "manifest:ThumbnailImageID";
		private final String NODE_LANGUAGE_IN_IMAGE = "manifest:LanguageInImage";
		private final String NODE_ALTERNATE_TEXT = "manifest:AlternateText";
		private final String NODE_CAPTION = "manifest:Caption";
		private final String NODE_SEQUENCE = "manifest:Sequence";
		
		private String pictureId;
		private Image image;
		private Image thumbnailImage;
		private List<String> languagesInImage = new ArrayList<String>();
		private LanguageStringList alternateTexts = new LanguageStringList();
		private LanguageStringList captions = new LanguageStringList();
		private int sequence;
		public Boolean hasSequence = false;
		
		public Picture(Element xmlElement) {
			NodeList childNodes = xmlElement.getChildNodes();
			for (int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = childNodes.item(i);
				if (childNode.getNodeType() == Element.ELEMENT_NODE) {
					Element nodeElement = (Element) childNode;
					String nodeText = nodeElement.getTextContent();
					
					switch (childNode.getNodeName()) {
					case NODE_PICTURE_ID:
						this.pictureId = nodeText;
						break;
						
					case NODE_IMAGE_ID:
						this.image = NextGenDataManager.getInstance().getInventory().getImageById(nodeText);
						break;
						
					case NODE_THUMBNAIL_IMAGE_ID:
						this.thumbnailImage = NextGenDataManager.getInstance().getInventory().getImageById(nodeText);
						break;
						
					case NODE_LANGUAGE_IN_IMAGE:
						this.languagesInImage.add(nodeText);
						break;
						
					case NODE_ALTERNATE_TEXT:
						this.alternateTexts.addLanguageString(nodeElement.getAttribute(ATTRIBUTE_LANGUAGE), nodeText);
						break;
						
					case NODE_CAPTION:
						this.captions.addLanguageString(nodeElement.getAttribute(ATTRIBUTE_LANGUAGE), nodeText);
						break;
						
					case NODE_SEQUENCE:
						this.sequence = Integer.parseInt(nodeText);
						this.hasSequence = true;
						break;
					}
				}
			}
		}
		
	}

}
