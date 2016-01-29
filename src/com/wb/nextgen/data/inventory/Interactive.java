package com.wb.nextgen.data.inventory;

import org.w3c.dom.Element;

/*
	<xs:complexType name="InventoryInteractive-type">
		<xs:complexContent>
			<xs:extension base="md:DigitalAssetInteractiveData-type">
				<xs:sequence>
					<xs:element name="ContainerReference" type="manifest:ContainerReference-type" minOccurs="0"/>
					<xs:element name="ManifestApp" type="manifest:InventoryMediaManifest-type" minOccurs="0" maxOccurs="unbounded"/>
					<xs:element name="PictureID" type="manifest:PictureID-type" minOccurs="0"/>
				</xs:sequence>
				<xs:attribute name="InteractiveTrackID" type="manifest:InteractiveTrackID-type"/>
			</xs:extension>
		</xs:complexContent>
	</xs:complexType>
	
	<xs:complexType name="DigitalAssetInteractiveData-type">
		<xs:sequence>
			<xs:group ref="md:DigitalAssetInteractiveBase-group"/>
			<xs:element name="Encoding" type="md:DigitalAssetInteractiveEncoding-type" maxOccurs="unbounded"/>
			<xs:element name="TrackReference" type="md:string-TrackReference" minOccurs="0"/>
			<xs:element name="TrackIdentifier" type="md:ContentIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Private" type="md:PrivateData-type" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
 */

public class Interactive {

	static final String NODE_ROOT = "manifest:Interactive";
	
	private final String ATTRIBUTE_INTERACTIVE_TRACK_ID = "InteractiveTrackID";
	// TODO: All
	
	public String interactiveTrackId;
	
	public Interactive(Element xmlElement) {
		this.interactiveTrackId = xmlElement.getAttribute(ATTRIBUTE_INTERACTIVE_TRACK_ID);
	}
	
	/* 
	 	<xs:complexType name="DigitalAssetInteractiveEncoding-type">
			<xs:sequence>
				<xs:element name="RuntimeEnvironment" type="md:string-Interactive-Enc-RuntimeEnvironment"/>
				<xs:element name="FirstVersion" type="md:string-Interactive-Enc-Version" minOccurs="0"/>
				<xs:element name="LastVersion" type="md:string-Interactive-Enc-Version" minOccurs="0"/>
				<xs:any namespace="##other" minOccurs="0" maxOccurs="unbounded"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class Encoding {
		
		static final String NODE_ROOT = "Encoding";
		
		private final String NODE_RUNTIME_ENVIRONMENT = "RuntimeEnvironment";
		private final String NODE_FIRST_VERSION = "FirstVersion";
		private final String NODE_LAST_VERSION = "lastVersion";
		
		private String runtimeEnvironment;
		private String firstVersion;
		private String lastVersion;
		
		public Encoding(Element xmlElement) {
			// TODO: All
		}
		
	}
	
}
