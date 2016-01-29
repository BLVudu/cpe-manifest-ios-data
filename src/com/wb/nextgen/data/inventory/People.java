package com.wb.nextgen.data.inventory;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wb.nextgen.data.enums.*;

/*
	<xs:complexType name="BasicMetadataPeople-type">
		<xs:sequence>
			<xs:element name="Job" type="md:BasicMetadataJob-type" maxOccurs="unbounded"/>
			<xs:element name="Name" type="md:PersonName-type"/>
			<xs:element name="Identifier" type="md:PersonIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Gender" minOccurs="0">
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:enumeration value="male"/>
						<xs:enumeration value="female"/>
						<xs:enumeration value="neutral"/>
						<xs:enumeration value="plural"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
		</xs:sequence>
	</xs:complexType>
 */
public class People {
	
	public static final String NODE_ROOT = "People";
	
	private final String NODE_GENDER = "Gender";
	
	private Job job;
	private Name name;
	// TODO: Identifier
	private Gender gender;

	public People(Element xmlElement) {
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				String nodeText = nodeElement.getTextContent();
				
				switch (nodeElement.getNodeName()) {
				case Job.NODE_ROOT:
					this.job = new Job(nodeElement);
					break;
					
				case Name.NODE_ROOT:
					this.name = new Name(nodeElement);
					break;
					
				case NODE_GENDER:
					this.gender = Gender.valueOf(nodeText);
					break;
				}
			}
		}
	}
	
	@Override public String toString() {
		return this.name + " - " + this.job;
	}
	
	/*
		<xs:complexType name="BasicMetadataJob-type">
			<xs:sequence>
				<xs:element name="JobFunction">
					<xs:complexType>
						<xs:simpleContent>
							<xs:extension base="md:Role-type">
								<xs:attribute name="scheme" type="md:string-JobFunction_scheme"/>
							</xs:extension>
						</xs:simpleContent>
					</xs:complexType>
				</xs:element>
				<xs:element name="JobDisplay" minOccurs="0" maxOccurs="unbounded">
					<xs:complexType>
						<xs:simpleContent>
							<xs:extension base="md:string-JobDisplay">
								<xs:attribute name="language" type="md:language-redefine"/>
							</xs:extension>
						</xs:simpleContent>
					</xs:complexType>
				</xs:element>
				<xs:element name="BillingBlockOrder" type="xs:int" minOccurs="0"/>
				<xs:element name="Character" type="xs:string" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="Guest" type="xs:boolean" minOccurs="0"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class Job {
		
		static final String NODE_ROOT = "Job";
		
		private final String NODE_JOB_FUNCTION = "JobFunction";
		private final String NODE_BILLING_BLOCK_ORDER = "BillingBlockOrder";
		private final String NODE_CHARACTER = "Character";
		
		public JobFunction jobFunction;
		public int billingBlockOrder;
		public String character;
		// TODO: Guest
		
		public Job(Element xmlElement) {
			NodeList childNodes = xmlElement.getChildNodes();
			for (int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = childNodes.item(i);
				if (childNode.getNodeType() == Element.ELEMENT_NODE) {
					String nodeText = childNode.getTextContent();
					switch (childNode.getNodeName()) {
					case NODE_JOB_FUNCTION:
						this.jobFunction = JobFunction.valueOf(nodeText);
						break;
						
					case NODE_BILLING_BLOCK_ORDER:
						this.billingBlockOrder = Integer.parseInt(nodeText);
						break;
						
					case NODE_CHARACTER:
						this.character = nodeText;
						break;
					}
				}
			}
		}
		
		@Override public String toString() {
			if (this.character != null && !this.character.isEmpty()) {
				return this.character + " (" + this.jobFunction + ")";
			}
			
			return this.jobFunction.toString();
		}
		
	}
	
	/*
		<xs:complexType name="PersonName-type">
			<xs:sequence>
				<xs:element name="DisplayName" type="md:StringAndLanguage-type" maxOccurs="unbounded"/>
				<xs:element name="SortName" type="md:StringAndLanguage-type" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="FirstGivenName" type="xs:string" minOccurs="0"/>
				<xs:element name="SecondGivenName" type="xs:string" minOccurs="0"/>
				<xs:element name="FamilyName" type="xs:string" minOccurs="0"/>
				<xs:element name="Suffix" type="md:string-Name_Suffix" minOccurs="0"/>
				<xs:element name="Moniker" type="xs:string" minOccurs="0"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class Name {
		
		static final String NODE_ROOT = "Name";
		
		private final String NODE_DISPLAY_NAME = "DisplayName";
		private final String NODE_SORT_NAME = "SortName";
		private final String NODE_FIRST_GIVEN_NAME = "FirstGivenName";
		private final String NODE_SECOND_GIVEN_NAME = "SecondGivenName";
		private final String NODE_FAMILY_NAME = "FamilyName";
		private final String NODE_SUFFIX = "Suffix";
		private final String NODE_MONIKER = "Moniker";
		
		public String displayName;
		public String sortName;
		public String firstGivenName;
		public String secondGivenName;
		public String familyName;
		public String suffix;
		public String moniker;
		
		public Name(Element xmlElement) {
			NodeList childNodes = xmlElement.getChildNodes();
			for (int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = childNodes.item(i);
				if (childNode.getNodeType() == Element.ELEMENT_NODE) {
					String nodeText = childNode.getTextContent();
					switch (childNode.getNodeName()) {
					case NODE_DISPLAY_NAME:
						this.displayName = nodeText;
						break;
						
					case NODE_SORT_NAME:
						this.sortName = nodeText;
						break;
						
					case NODE_FIRST_GIVEN_NAME:
						this.firstGivenName = nodeText;
						break;
						
					case NODE_SECOND_GIVEN_NAME:
						this.secondGivenName = nodeText;
						break;
						
					case NODE_FAMILY_NAME:
						this.familyName = nodeText;
						break;
						
					case NODE_SUFFIX:
						this.suffix = nodeText;
						break;
					
					case NODE_MONIKER:
						this.moniker = nodeText;
						break;
					}
				}
			}
		}
		
		@Override public String toString() {
			return this.displayName;
		}
		
	}
	
}
