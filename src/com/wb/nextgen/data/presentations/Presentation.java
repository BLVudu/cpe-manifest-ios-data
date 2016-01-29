package com.wb.nextgen.data.presentations;

import java.util.HashMap;
import java.util.Map;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wb.nextgen.data.inventory.Ancillary;
import com.wb.nextgen.data.inventory.Audio;
import com.wb.nextgen.data.inventory.Subtitle;
import com.wb.nextgen.data.inventory.Video;
import com.wb.nextgen.data.managers.NextGenDataManager;

/*
	<xs:complexType name="Presentation-type">
		<xs:sequence>
			<xs:element name="TrackMetadata" maxOccurs="unbounded">
				<xs:complexType>
					<xs:complexContent>
						<xs:extension base="manifest:TrackMetadata-type"/>
					</xs:complexContent>
				</xs:complexType>
			</xs:element>
			<xs:element name="LanguagePair" type="manifest:PresentationLanguagePair-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Chapters" type="manifest:ChapterList-type" minOccurs="0"/>
		</xs:sequence>
		<xs:attribute name="PresentationID" type="manifest:PresentationID-type" use="required"/>
	</xs:complexType>
 */
public class Presentation {
	
	public static final String NODE_ROOT = "manifest:Presentation";
	
	private final String ATTRIBUTE_PRESENTATION_ID = "PresentationID";
	
	private final String NODE_CHAPTERS = "manifest:Chapters";
	
	public String presentationId;
	private TrackMetadata trackMetadata;
	private LanguagePair languagePair;
	private Map<Integer, Chapter> chaptersMap = new HashMap<Integer, Chapter>();
	
	public Presentation(Element xmlElement) {
		this.presentationId = xmlElement.getAttribute(ATTRIBUTE_PRESENTATION_ID);
		
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				NodeList subNodes;
				
				switch (childNode.getNodeName()) {
				case TrackMetadata.NODE_ROOT:
					this.trackMetadata = new TrackMetadata(nodeElement);
					break;
					
				case LanguagePair.NODE_ROOT:
					this.languagePair = new LanguagePair(nodeElement);
					break;
				
				case NODE_CHAPTERS:
					subNodes = nodeElement.getElementsByTagName(Chapter.NODE_ROOT);
					for (int j = 0; j < subNodes.getLength(); i++) {
						Node subNode = subNodes.item(i);
						if (subNode.getNodeType() == Element.ELEMENT_NODE) {
							Element subNodeElement = (Element) subNode;
							Chapter chapter = new Chapter(subNodeElement);
							this.chaptersMap.put(Integer.parseInt(subNodeElement.getAttribute(Chapter.ATTRIBUTE_INDEX)), chapter);
						}
					}
					break;
				}
			}
		}
	}
	
	/*
	 	<xs:complexType name="TrackMetadata-type">
			<xs:sequence>
				<xs:element name="TrackSelectionNumber" type="xs:nonNegativeInteger"/>
				<xs:element name="VideoTrackReference" type="manifest:VideoTrackReference-type" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="AudioTrackReference" type="manifest:AudioTrackReference-type" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="SubtitleTrackReference" type="manifest:SubtitleTrackReference-type" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="AncillaryTrackReference" type="manifest:AncillaryTrackReference-type" minOccurs="0" maxOccurs="unbounded"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class TrackMetadata {
		
		static final String NODE_ROOT = "manifest:TrackMetadata";
		
		private final String NODE_TRACK_SELECTION_NUMBER = "manifest:TrackSelectionNumber";
		private final String NODE_VIDEO_TRACK_REFERENCE = "manifest:VideoTrackReference";
		private final String NODE_VIDEO_TRACK_ID = "manifest:VideoTrackID";
		private final String NODE_AUDIO_TRACK_REFERENCE = "manifest:AudioTrackReference";
		private final String NODE_AUDIO_TRACK_ID = "manifest:AudioTrackID";
		private final String NODE_SUBTITLE_TRACK_REFERENCE = "manifest:SubtitleTrackReference";
		private final String NODE_SUBTITLE_TRACK_ID = "manifest:SubtitleTrackID";
		private final String NODE_ANCILLARY_TRACK_REFERENCE = "manifest:AncillaryTrackReference";
		private final String NODE_ANCILLARY_TRACK_ID = "manifest:AncillaryTrackID";
		
		// TODO: Arrays?
		private int trackSelectionNumber;
		private Video videoTrack;
		private Audio audioTrack;
		private Subtitle subtitleTrack;
		private Ancillary ancillaryTrack;
		
		public TrackMetadata(Element xmlElement) {
			NodeList childNodes = xmlElement.getChildNodes();
			for (int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = childNodes.item(i);
				if (childNode.getNodeType() == Element.ELEMENT_NODE) {
					Element nodeElement = (Element) childNode;
					String nodeText = nodeElement.getTextContent();
					NodeList subNodes;
					
					switch (childNode.getNodeName()) {
					case NODE_TRACK_SELECTION_NUMBER:
						this.trackSelectionNumber = Integer.parseInt(nodeText);
						break;
						
					case NODE_VIDEO_TRACK_REFERENCE:
						subNodes = nodeElement.getElementsByTagName(NODE_VIDEO_TRACK_ID);
						if (subNodes.getLength() > 0) {
							this.videoTrack = NextGenDataManager.getInstance().getInventory().getVideoByTrackId(subNodes.item(0).getTextContent());
						}
						break;
						
					case NODE_AUDIO_TRACK_REFERENCE:
						subNodes = nodeElement.getElementsByTagName(NODE_AUDIO_TRACK_ID);
						if (subNodes.getLength() > 0) {
							this.audioTrack = NextGenDataManager.getInstance().getInventory().getAudioByTrackId(subNodes.item(0).getTextContent());
						}
						break;
						
					case NODE_SUBTITLE_TRACK_REFERENCE:
						subNodes = nodeElement.getElementsByTagName(NODE_SUBTITLE_TRACK_ID);
						if (subNodes.getLength() > 0) {
							this.subtitleTrack = NextGenDataManager.getInstance().getInventory().getSubtitleByTrackId(subNodes.item(0).getTextContent());
						}
						break;
						
					case NODE_ANCILLARY_TRACK_REFERENCE:
						subNodes = nodeElement.getElementsByTagName(NODE_ANCILLARY_TRACK_ID);
						if (subNodes.getLength() > 0) {
							this.ancillaryTrack = NextGenDataManager.getInstance().getInventory().getAncillaryByTrackId(subNodes.item(0).getTextContent());
						}
						break;
					}
				}
			}
		}
		
	}
	
	/*
		<xs:complexType name="PresentationLanguagePair-type">
			<xs:sequence>
				<xs:element name="SystemLanguage" type="xs:language"/>
				<xs:element name="AudioLanguage" type="xs:language"/>
				<xs:element name="SubtitleLanguage" type="xs:language"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class LanguagePair {
		
		static final String NODE_ROOT = "manifest:LanguagePair";
		
		private final String NODE_SYSTEM_LANGUAGE = "manifest:SystemLanguage";
		private final String NODE_AUDIO_LANGUAGE = "manifest:AudioLanguage";
		private final String NODE_SUBTITLE_LANGUAGE = "manifest:SubtitleLanguage";
		
		private String systemLanguage;
		private String audioLanguage;
		private String subtitleLanguage;
		
		public LanguagePair(Element xmlElement) {
			NodeList childNodes = xmlElement.getChildNodes();
			for (int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = childNodes.item(i);
				if (childNode.getNodeType() == Element.ELEMENT_NODE) {
					String nodeText = childNode.getTextContent();
					
					switch (childNode.getNodeName()) {
					case NODE_SYSTEM_LANGUAGE:
						this.systemLanguage = nodeText;
						break;
						
					case NODE_AUDIO_LANGUAGE:
						this.audioLanguage = nodeText;
						break;
						
					case NODE_SUBTITLE_LANGUAGE:
						this.subtitleLanguage = nodeText;
						break;
					}
				}
			}
		}
		
	}
	
	/*
	 	<xs:complexType name="Chapter-type">
			<xs:sequence>
				<xs:element name="EntryTimecode" type="manifest:Timecode-type"/>
				<xs:element name="DisplayLabel" minOccurs="0" maxOccurs="unbounded">
					<xs:complexType>
						<xs:simpleContent>
							<xs:extension base="xs:string">
								<xs:attribute name="language" type="xs:language"/>
							</xs:extension>
						</xs:simpleContent>
					</xs:complexType>
				</xs:element>
				<xs:element name="ImageID" minOccurs="0" maxOccurs="unbounded">
					<xs:complexType>
						<xs:simpleContent>
							<xs:extension base="manifest:ImageID-type">
								<xs:attribute name="language" type="xs:language"/>
							</xs:extension>
						</xs:simpleContent>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
			<xs:attribute name="index" use="required"/>
		</xs:complexType>
	 */
	private class Chapter {
		
		static final String NODE_ROOT = "manifest:Chapter";
		
		static final String ATTRIBUTE_INDEX = "index";
		
		// TODO: All
		
		public Chapter(Element xmlElement) {
			
		}
	}

}
