package com.wb.nextgen.data.shared;

import org.w3c.dom.Element;

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
public class InteractiveEncoding {

	static final String NODE_ROOT = "Encoding";
	
	private final String NODE_RUNTIME_ENVIRONMENT = "RuntimeEnvironment";
	private final String NODE_FIRST_VERSION = "FirstVersion";
	private final String NODE_LAST_VERSION = "lastVersion";
	
	private String runtimeEnvironment;
	private String firstVersion;
	private String lastVersion;
	
	public InteractiveEncoding(Element xmlElement) {
		// TODO: All
	}

}