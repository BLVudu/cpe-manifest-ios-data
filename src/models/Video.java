package models;

import java.util.HashMap;
import java.util.Map;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import enums.ColorType;

import org.w3c.dom.Node;

/*
	<xs:complexType name="DigitalAssetVideoData-type">
		<xs:sequence>
			<xs:element name="Description" type="xs:string" minOccurs="0"/>
			<xs:element name="Type" type="md:string-Video-Type" minOccurs="0"/>
			<xs:element name="Encoding" type="md:DigitalAssetVideoEncoding-type" minOccurs="0"/>
			<xs:element name="Picture" type="md:DigitalAssetVideoPicture-type" minOccurs="0"/>
			<xs:element name="ColorType" type="md:ColorType-type" minOccurs="0">...</xs:element>
			<xs:element name="PictureFormat" type="md:string-Video-PictureFormat" minOccurs="0"/>
			<xs:element name="Language" type="md:language-redefine" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="SubtitleLanguage" type="md:DigitalAssetVideoSubtitleLanguage-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="SignedLanguage" type="md:language-redefine" minOccurs="0"/>
			<xs:element name="CardsetList" type="md:DigitalAssetCardsetList-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="TrackReference" type="md:string-TrackReference" minOccurs="0"/>
			<xs:element name="TrackIdentifier" type="md:ContentIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Private" type="md:PrivateData-type" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
*/

public class Video {
	
	static final String NODE_ROOT = "manifest:Video";
	
	private final String ATTRIBUTE_VIDEO_TRACK_ID = "VideoTrackID";
	
	private final String NODE_DESCRIPTION = "Description";
	private final String NODE_TYPE = "Type";
	private final String NODE_COLOR_TYPE = "ColorType";
	private final String NODE_PICTURE_FORMAT = "PictureFormat";
	private final String NODE_LANGUAGE = "Language";
	private final String NODE_SIGNED_LANGUAGE = "SignedLanguage";
	
	public String videoTrackId;
	
	private String description;
	private String type;
	private Encoding encoding;
	private Picture picture;
	private ColorType colorType;
	private String pictureFormat;
	private String language;
	private Map<String, SubtitleLanguage> subtitleLanguageMap = new HashMap<String, SubtitleLanguage>();
	private String signedLanguage;
	// TODO: CardsetList
	// TODO: TrackReference
	// TODO: TrackIdentifier
	// TODO: Private
	
	public Video(Element xmlElement) {
		this.videoTrackId = xmlElement.getAttribute(ATTRIBUTE_VIDEO_TRACK_ID);
		
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				String nodeText = nodeElement.getTextContent();
				
				switch (childNode.getNodeName()) {
				case NODE_DESCRIPTION:
					this.description = nodeText;
					break;
					
				case NODE_TYPE:
					this.type = nodeText;
					break;
					
				case Encoding.NODE_ROOT:
					this.encoding = new Encoding(nodeElement);
					break;
					
				case Picture.NODE_ROOT:
					this.picture = new Picture(nodeElement);
					break;
					
				case NODE_COLOR_TYPE:
					this.colorType = ColorType.valueOf(nodeText);
					break;
					
				case NODE_PICTURE_FORMAT:
					this.pictureFormat = nodeText;
					break;
					
				case NODE_LANGUAGE:
					this.language = nodeText;
					break;
					
				case SubtitleLanguage.NODE_ROOT:
					SubtitleLanguage subtitleLanguage = new SubtitleLanguage(nodeElement);
					this.subtitleLanguageMap.put(subtitleLanguage.language, subtitleLanguage);
					break;
					
				case NODE_SIGNED_LANGUAGE:
					this.signedLanguage = nodeText;
					break;
				}
			}
		}
	}
	
	@Override public String toString() {
		return "[" + this.videoTrackId + "]";
	}
	
	/*
		<xs:complexType name="DigitalAssetVideoEncoding-type">
			<xs:sequence>
				<xs:element name="Codec" type="md:string-Video-Enc-Codec"/>
				<xs:element name="CodecType" type="md:string-Video-Enc-CodecType" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="MPEGProfile" type="md:string-Video-Enc-MProfile" minOccurs="0"/>
				<xs:element name="MPEGLevel" type="md:string-Video-Enc-MLevel" minOccurs="0"/>
				<xs:element name="BitrateMax" type="xs:integer" minOccurs="0"/>
				<xs:element name="BitRateAverage" type="xs:integer" minOccurs="0"/>
				<xs:element name="VBR" type="md:string-Video-Enc-VBR" minOccurs="0"/>
				<xs:element name="Watermark" type="md:DigitalAssetWatermark-type" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="ActualLength" type="xs:duration" minOccurs="0"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class Encoding {
		
		static final String NODE_ROOT = "Encoding";
		
		private final String NODE_CODEC = "Codec";
		private final String NODE_CODEC_TYPE = "CodecType";
		private final String NODE_MPEG_PROFILE = "MPEGProfile";
		private final String NODE_MPEG_LEVEL = "MPEGLevel";
		private final String NODE_BITRATE_MAX = "BitrateMax";
		private final String NODE_BITRATE_AVERAGE = "BirateAverage";
		private final String NODE_VBR = "VBR";
		private final String NODE_ACTUAL_LENGTH = "ActualLength";
		
		private String codec;
		private String codecType;
		private String mpegProfile;
		private String mpegLevel;
		private int bitrateMax;
		private int bitrateAverage;
		private String vbr;
		// TODO: Watermark
		private int actualLengthInMinutes;
		
		public Encoding(Element xmlElement) {
			NodeList childNodes = xmlElement.getChildNodes();
			for (int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = childNodes.item(i);
				if (childNode.getNodeType() == Element.ELEMENT_NODE) {
					String nodeText = childNode.getTextContent();
					
					switch (childNode.getNodeName()) {
					case NODE_CODEC:
						this.codec = nodeText;
						break;
						
					case NODE_CODEC_TYPE:
						this.codecType = nodeText;
						break;
						
					case NODE_MPEG_PROFILE:
						this.mpegProfile = nodeText;
						break;
						
					case NODE_MPEG_LEVEL:
						this.mpegLevel = nodeText;
						break;
						
					case NODE_BITRATE_MAX:
						this.bitrateMax = Integer.parseInt(nodeText);
						break;
						
					case NODE_BITRATE_AVERAGE:
						this.bitrateAverage = Integer.parseInt(nodeText);
						break;
						
					case NODE_VBR:
						this.vbr = nodeText;
						break;
						
					case NODE_ACTUAL_LENGTH:
						try {
							this.actualLengthInMinutes = DatatypeFactory.newInstance().newDuration(nodeText).getMinutes();
						} catch (DatatypeConfigurationException e) {
							e.printStackTrace();
							this.actualLengthInMinutes = 0;
						}
						break;
					}
				}
			}
		}

	}
	
	/*
		<xs:complexType name="DigitalAssetVideoPicture-type">
			<xs:sequence>
				<xs:element name="AspectRatio" type="md:string-Video-Pic-AspectRatio" minOccurs="0"/>
				<xs:element name="PixelAspect" type="md:string-Video-Pic-PixelAspect" minOccurs="0"/>
				<xs:element name="WidthPixels" type="xs:int" minOccurs="0"/>
				<xs:element name="HeightPixels" type="xs:int" minOccurs="0"/>
				<xs:element name="ActiveWidthPixels" type="xs:int" minOccurs="0"/>
				<xs:element name="ActiveHeightPixels" type="xs:int" minOccurs="0"/>
				<xs:element name="FrameRate" type="md:DigitalAssetVideoPictureFrameRate-type" minOccurs="0"/>
				<xs:element name="Progressive" type="md:DigitalAssetVideoPictureProgressive-type" minOccurs="0"/>
				<xs:element name="ColorSubsampling" type="md:string-Video-Pic-ColorSampling" minOccurs="0"/>
				<xs:element name="Colorimetry" type="md:string-Video-Pic-Colorimetry" minOccurs="0"/>
				<xs:element name="Type3D" type="md:string-Video-Pic-Type3D" minOccurs="0"/>
				<xs:element name="MasteredColorVolume" type="md:DigitalAssetColorVolume-type" minOccurs="0"/>
				<xs:element name="ColorEncoding" type="md:DigitalAssetColorEncoding-type" minOccurs="0"/>
				<xs:element name="LightLevel" type="md:DigitalAssetVideoPictureLightLevel-type" minOccurs="0"/>
				<xs:element name="HDRPlaybackInfo" type="md:DigitalAssetVideoPictureHDRPlaybackInfo-type" minOccurs="0"/>
				<xs:any namespace="##other" minOccurs="0" maxOccurs="unbounded"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class Picture {
		
		static final String NODE_ROOT = "Picture";
		
		// TODO: All children
		
		public Picture(Element xmlElement) {
			
		}
		
	}
	
	/*
		<xs:complexType name="DigitalAssetVideoSubtitleLanguage-type">
			<xs:simpleContent>
				<xs:extension base="md:language-redefine">
					<xs:attribute name="closed" type="xs:boolean"/>
					<xs:attribute name="type" type="md:string-Video-SubLang-type"/>
				</xs:extension>
			</xs:simpleContent>
		</xs:complexType>
	 */
	private class SubtitleLanguage {
		
		static final String NODE_ROOT = "SubtitleLanguage";
		
		private final String ATTRIBUTE_CLOSED = "closed";
		private final String ATTRIBUTE_TYPE = "type";
		
		public String language = "en";
		private Boolean closed = false;
		private String type;
		
		public SubtitleLanguage(Element xmlElement) {
			this.closed = xmlElement.getAttribute(ATTRIBUTE_CLOSED).equals("true");
			this.type = xmlElement.getAttribute(ATTRIBUTE_TYPE);
			this.language = xmlElement.getTextContent();
		}
		
	}

}
