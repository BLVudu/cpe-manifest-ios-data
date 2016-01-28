package com.wb.nextgen.data.models;

import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wb.nextgen.data.enums.WorkType;

/*
	<xs:complexType name="BasicMetadata-type">
		<xs:sequence>
			<xs:element name="UpdateNum" minOccurs="0">
				<xs:simpleType>
					<xs:restriction base="xs:int">
						<xs:minInclusive value="1"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:element>
			<xs:element name="LocalizedInfo" type="md:BasicMetadataInfo-type" maxOccurs="unbounded"/>
			<xs:element name="RunLength" type="xs:duration" minOccurs="0"/>
			<xs:element name="ReleaseYear" type="xs:gYear"/>
			<xs:element name="ReleaseDate" type="md:YearDateOrTime-type" minOccurs="0"/>
			<xs:element name="ReleaseHistory" type="md:ReleaseHistory-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="WorkType" type="md:string-WorkType"/>
			<xs:element name="WorkTypeDetail" type="md:string-WorkTypeDetail" minOccurs="0"/>
			<xs:element name="PictureColorType" type="md:ColorType-type" minOccurs="0"/>
			<xs:element name="PictureFormat" type="md:string-PictureFormat" minOccurs="0"/>
			<xs:element name="ThreeD" type="xs:boolean" minOccurs="0"/>
			<xs:element name="AspectRatio" type="md:string-AspectRatio" minOccurs="0"/>
			<xs:element name="AltIdentifier" type="md:ContentIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="RatingSet" type="md:ContentRating-type" minOccurs="0"/>
			<xs:element name="People" type="md:BasicMetadataPeople-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="CountryOfOrigin" type="md:Region-type" minOccurs="0"/>
			<xs:element name="PrimarySpokenLanguage" type="md:language-redefine" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="OriginalLanguage" type="md:language-redefine" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="VersionLanguage" type="md:language-redefine" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="AssociatedOrg" type="md:AssociatedOrg-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="SequenceInfo" type="md:ContentSequenceInfo-type" minOccurs="0"/>
			<xs:element name="Parent" type="md:BasicMetadataParent-type" minOccurs="0" maxOccurs="unbounded"/>
		</xs:sequence>
		<xs:attribute name="ContentID" type="md:ContentID-type" use="required"/>
	</xs:complexType>
 */
public class BasicMetadata {
	
	public static final String NODE_ROOT = "manifest:BasicMetadata";
	
	private static final String NODE_RUNTIME = "RunLength";
	private static final String NODE_RELEASE_YEAR = "ReleaseYear";
	private static final String NODE_RELEASE_DATE = "ReleaseDate";
	private static final String NODE_WORK_TYPE = "WorkType";
	private static final String NODE_IS_3D = "ThreeD";
	
	private Map<String, LocalizedInfo> localizedInfoMap = new HashMap<String, LocalizedInfo>();
	private String defaultLanguage = "en";
	private int runtimeInMinutes;
	private String releaseYear;
	private Date releaseDate;
	private WorkType workType;
	private Boolean is3D;
	private List<People> people = new ArrayList<People>();
	// TODO: Many Things
	
	public BasicMetadata(Element xmlElement) {
		NodeList nodeList = xmlElement.getChildNodes();
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			String nodeText = node.getTextContent();
			switch (node.getNodeName()) {
			case LocalizedInfo.NODE_ROOT:
				LocalizedInfo localizedInfo = new LocalizedInfo((Element) node);
				if (localizedInfo.isDefault) {
					this.defaultLanguage = localizedInfo.language;
				}
				
				this.localizedInfoMap.put(localizedInfo.language, localizedInfo);
				break;
				
			case NODE_RUNTIME:
				try {
					this.runtimeInMinutes = DatatypeFactory.newInstance().newDuration(nodeText).getMinutes();
				} catch (DatatypeConfigurationException e) {
					e.printStackTrace();
					this.runtimeInMinutes = 0;
				}
				break;
				
			case NODE_RELEASE_YEAR:
				this.releaseYear = nodeText;
				break;
				
			case NODE_RELEASE_DATE:
				try {
					this.releaseDate = new SimpleDateFormat("yyyy-MM-dd").parse(nodeText);
				} catch (ParseException e) {
					e.printStackTrace();
					this.releaseDate = null;
				}
				break;
				
			case NODE_WORK_TYPE:
				this.workType = WorkType.valueOf(nodeText);
				break;
				
			case NODE_IS_3D:
				this.is3D = nodeText.equals("true");
				break;
				
			case People.NODE_ROOT:
				this.people.add(new People((Element) node));
				break;
			}
		}
	}
	
	public LocalizedInfo getDefaultLocalizedInfo() {
		return this.localizedInfoMap.get(this.defaultLanguage);
	}
	
	@Override public String toString() {
		return this.getDefaultLocalizedInfo().getFullTitle();
	}
	
}
