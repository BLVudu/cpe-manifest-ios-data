package com.wb.nextgen.data.inventory;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/*
	<xs:complexType name="BasicMetadataInfo-type">
		<xs:sequence>
			<xs:element name="TitleDisplay19" type="xs:string" minOccurs="0"/>
			<xs:element name="TitleDisplay60" type="xs:string" minOccurs="0"/>
			<xs:element name="TitleDisplayUnlimited" type="xs:string" minOccurs="0"/>
			<xs:element name="TitleSort" type="xs:string"/>
			<xs:element name="ArtReference" minOccurs="0" maxOccurs="unbounded">
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:anyURI">
							<xs:attribute name="resolution" type="md:string-ArtReference_resolution"/>
						</xs:extension>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="Summary190">
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:string">
							<xs:attribute name="cast" type="xs:boolean"/>
						</xs:extension>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="Summary400" minOccurs="0">
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:string">
							<xs:attribute name="cast" type="xs:boolean"/>
						</xs:extension>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="Summary4000" minOccurs="0">
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:string">
							<xs:attribute name="cast" type="xs:boolean"/>
						</xs:extension>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="DisplayIndicators" type="md:string-DisplayIndicators" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Genre" minOccurs="0" maxOccurs="unbounded">
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:string">
							<xs:attribute name="source" type="xs:anyURI"/>
							<xs:attribute name="id" type="md:string-Genre_id"/>
							<xs:attribute name="level" type="xs:integer"/>
						</xs:extension>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="Keyword" type="md:string-Keyword" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="VersionNotes" type="xs:string" minOccurs="0"/>
			<xs:element name="Region" type="md:Region-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="OriginalTitle" type="xs:string" minOccurs="0"/>
			<xs:element name="CopyrightLine" type="xs:string" minOccurs="0"/>
			<xs:element name="PeopleLocal" type="md:BasicMetadataPeople-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="TitleAlternate" minOccurs="0" maxOccurs="unbounded">
				<xs:complexType>
					<xs:simpleContent>
						<xs:extension base="xs:string">
							<xs:attribute name="type" type="md:string-TitleAlternate_type"/>
							<xs:attribute name="language" type="md:language-redefine"/>
						</xs:extension>
					</xs:simpleContent>
				</xs:complexType>
			</xs:element>
		</xs:sequence>
		<xs:attribute name="language" type="md:language-redefine" use="required"/>
		<xs:attribute name="default" type="xs:boolean"/>
	</xs:complexType>
 */

public class LocalizedInfo {
	
	public static final String NODE_ROOT = "LocalizedInfo";
	
	private final String NODE_TITLE_DISPLAY_SMALL = "TitleDisplay19";
	private final String NODE_TITLE_DISPLAY_LARGE = "TitleDisplay60";
	private final String NODE_TITLE_DISPLAY_FULL = "TitleDisplayUnlimited";
	private final String NODE_TITLE_SORT = "TitleSort";
	private final String NODE_SUMMARY_SHORT = "Summary190";
	private final String NODE_SUMMARY_LONG = "Summary400";
	private final String NODE_SUMMARY_FULL = "Summary4000";
	private final String NODE_ORIGINAL_TITLE = "OriginalTitle";
	private final String NODE_COPYRIGHT_LINE = "CopyrightLine";
	private final String NODE_KEYWORD = "Keyword";
	
	private final String ATTRIBUTE_IS_DEFAULT = "default";
	private final String ATTRIBUTE_LANGUAGE = "language";
	
	public Boolean isDefault;
	public String language;
	
	private String titleDisplaySmall;
	private String titleDisplayLarge;
	private String titleDisplayFull;
	private String titleSort;
	private List<ArtReference> artReferences = new ArrayList<ArtReference>();
	private String summaryShort;
	private String summaryLong;
	private String summaryFull;
	private String originalTitle;
	private String copyrightLine;
	private List<String> keywords = new ArrayList<String>();
	//TODO: Many Things
	
	public LocalizedInfo(Element xmlElement) {
		this.isDefault = xmlElement.getAttribute(ATTRIBUTE_IS_DEFAULT).equals("true");
		this.language = xmlElement.getAttribute(ATTRIBUTE_LANGUAGE);
		
		NodeList nodeList = xmlElement.getChildNodes();
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			String nodeText = node.getTextContent();
			switch (node.getNodeName()) {
			case NODE_TITLE_DISPLAY_SMALL:
				this.titleDisplaySmall = nodeText;
				break;
				
			case NODE_TITLE_DISPLAY_LARGE:
				this.titleDisplayLarge = nodeText;
				break;
				
			case NODE_TITLE_DISPLAY_FULL:
				this.titleDisplayFull = nodeText;
				break;
				
			case NODE_TITLE_SORT:
				this.titleSort = nodeText;
				break;
				
			case ArtReference.NODE_ROOT:
				this.artReferences.add(new ArtReference((Element) node));
				break;
				
			case NODE_SUMMARY_SHORT:
				this.summaryShort = nodeText;
				break;
				
			case NODE_SUMMARY_LONG:
				this.summaryLong = nodeText;
				break;
				
			case NODE_SUMMARY_FULL:
				this.summaryFull = nodeText;
				break;
				
			case NODE_ORIGINAL_TITLE:
				this.originalTitle = nodeText;
				break;
			
			case NODE_COPYRIGHT_LINE:
				this.copyrightLine = nodeText;
				break;
				
			case NODE_KEYWORD:
				this.keywords.add(nodeText);
				break;
			}
		}
	}
	
	public String getFullTitle() {
		return this.titleDisplayFull;
	}
	
	/*
		<xs:element name="ArtReference" minOccurs="0" maxOccurs="unbounded">
			<xs:complexType>
				<xs:simpleContent>
					<xs:extension base="xs:anyURI">
						<xs:attribute name="resolution" type="md:string-ArtReference_resolution"/>
					</xs:extension>
				</xs:simpleContent>
			</xs:complexType>
		</xs:element>
	 */
	private class ArtReference {
		
		static final String NODE_ROOT = "ArtReference";
		
		private final String ATTRIBUTE_RESOLUTION = "resolution";
		
		private int width;
		private int height;
		private URL url;
		
		public ArtReference(Element xmlElement) {
			String resolution = xmlElement.getAttribute(ATTRIBUTE_RESOLUTION);
			if (resolution != null && !resolution.isEmpty()) {
				String[] resolutionParts = resolution.toLowerCase().split("x");
				if (resolutionParts.length >= 1) {
					this.width = Integer.parseInt(resolutionParts[0]);
					
					if (resolutionParts.length >= 2) {
						this.height = Integer.parseInt(resolutionParts[1]);
					}
				}
			}

			try {
				this.url = new URL(xmlElement.getTextContent());
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
		}

	}

}
