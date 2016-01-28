package com.wb.nextgen.data.models;

import org.w3c.dom.Element;

import com.wb.nextgen.data.utils.XMLUtils;

/*
	<xs:complexType name="InventoryMetadata-type">
		<xs:sequence>
			<xs:element name="ContainerReference" minOccurs="0" maxOccurs="unbounded">
				<xs:complexType>
					<xs:complexContent>
						<xs:extension base="manifest:ContainerReference-type">
							<xs:attribute name="type" type="xs:string"/>
						</xs:extension>
					</xs:complexContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="BasicMetadata" type="md:BasicMetadata-type" minOccurs="0"/>
			<xs:element name="Alias" type="manifest:InventoryMetadataAlias-type" minOccurs="0" maxOccurs="unbounded"/>
		</xs:sequence>
		<xs:attribute name="ContentID" type="md:ContentID-type" use="required"/>
	</xs:complexType>
 */

public class Metadata {
	
	public static final String NODE_ROOT = "manifest:Metadata";
	
	static final String ATTRIBUTE_CONTENT_ID = "ContentID";
	
	public String contentId;
	private BasicMetadata basicMetadata;
	// TODO: Some Things
	
	public Metadata(Element xmlElement) {
		this.contentId = xmlElement.getAttribute(ATTRIBUTE_CONTENT_ID);
		this.basicMetadata = new BasicMetadata(XMLUtils.getSingleChildElement(xmlElement, BasicMetadata.NODE_ROOT));
	}
	
	@Override public String toString() {
		return "[" + this.contentId + "] " + this.basicMetadata;
	}

}
