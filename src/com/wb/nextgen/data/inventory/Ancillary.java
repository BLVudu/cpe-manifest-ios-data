package com.wb.nextgen.data.inventory;

import org.w3c.dom.Element;

/*
	<xs:complexType name="InventoryAncillary-type">
		<xs:complexContent>
			<xs:extension base="md:DigitalAssetAncillaryData-type">
				<xs:sequence>
					<xs:element name="ContainerReference" type="manifest:ContainerReference-type" minOccurs="0"/>
				</xs:sequence>
				<xs:attribute name="AncillaryTrackID" type="manifest:AncillaryTrackID-type" use="required"/>
			</xs:extension>
		</xs:complexContent>
	</xs:complexType>
	
	<xs:complexType name="DigitalAssetAncillaryData-type">
		<xs:sequence>
			<xs:element name="Type" type="md:string-Anc-Type"/>
			<xs:element name="SubType" type="md:string-Anc-SubType" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="BaseTrackID" type="md:id-type" minOccurs="0"/>
			<xs:element name="BaseTrackReference" type="md:string-TrackReference" minOccurs="0"/>
			<xs:element name="BaseTrackIdentifier" type="md:ContentIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="TrackMetadata" type="md:DigitalAssetMetadata-type" minOccurs="0"/>
			<xs:element name="CombinedMetadata" type="md:DigitalAssetMetadata-type" minOccurs="0"/>
			<xs:element name="Private" type="md:PrivateData-type" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
 */

public class Ancillary {

	static final String NODE_ROOT = "manifest:Ancillary";
	
	private final String ATTRIBUTE_ANCILLARY_TRACK_ID = "AncillaryTrackID";
	// TODO: All
	
	public String ancillaryTrackId;
	
	public Ancillary(Element xmlElement) {
		this.ancillaryTrackId = xmlElement.getAttribute(ATTRIBUTE_ANCILLARY_TRACK_ID);
	}
	
}
