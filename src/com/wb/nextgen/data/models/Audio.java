package com.wb.nextgen.data.models;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;

import org.w3c.dom.DOMException;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;

/*
	<xs:complexType name="DigitalAssetAudioData-type">
		<xs:sequence>
			<xs:element name="Description" type="xs:string" minOccurs="0"/>
			<xs:element name="Type" type="md:string-Audio-Type" minOccurs="0"/>
			<xs:element name="Encoding" type="md:DigitalAssetAudioEncoding-type" minOccurs="0"/>
			<xs:element name="Language" type="md:DigitalAssetAudioLanguage-type"/>
			<xs:element name="Channels" type="md:string-Audio-Channels" minOccurs="0"/>
			<xs:element name="TrackReference" type="md:string-TrackReference" minOccurs="0"/>
			<xs:element name="TrackIdentifier" type="md:ContentIdentifier-type" minOccurs="0" maxOccurs="unbounded"/>
			<xs:element name="Private" type="md:PrivateData-type" minOccurs="0"/>
		</xs:sequence>
	</xs:complexType>
*/

public class Audio {
	
	static final String NODE_ROOT = "manifest:Audio";
	
	private final String ATTRIBUTE_AUDIO_TRACK_ID = "AudioTrackID";
	
	private final String NODE_DESCRIPTION = "Description";
	private final String NODE_TYPE = "Type";
	private final String NODE_LANGUAGE = "Language";
	private final String NODE_CHANNELS = "Channels";
	private final String NODE_CONTAINER_REFERENCE = "manifest:ContainerReference";
	private final String NODE_CONTAINER_LOCATION = "manifest:ContainerLocation";
	
	public String audioTrackId;
	
	private String description;
	private String type;
	private Encoding encoding;
	private String language;
	private String channels;
	// TODO: TrackReference
	// TODO: TrackIdentifier
	private URL containerLocation;
	
	public Audio(Element xmlElement) {
		this.audioTrackId = xmlElement.getAttribute(ATTRIBUTE_AUDIO_TRACK_ID);
		
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
					
				case NODE_LANGUAGE:
					this.language = nodeText;
					break;
					
				case NODE_CHANNELS:
					this.channels = nodeText;
					break;
					
				case NODE_CONTAINER_REFERENCE:
					NodeList locationNodes = nodeElement.getElementsByTagName(NODE_CONTAINER_LOCATION);
					if (locationNodes.getLength() > 0) {
						try {
							this.containerLocation = new URL(locationNodes.item(0).getTextContent());
						} catch (MalformedURLException | DOMException e) {
							e.printStackTrace();
						}
					}
					break;
				}
			}
		}
	}
	
	@Override public String toString() {
		return "[" + this.audioTrackId + "] " + this.containerLocation;
	}
	
	/*
	 	<xs:complexType name="DigitalAssetAudioEncoding-type">
			<xs:sequence>
				<xs:element name="Codec" type="md:string-Audio-Enc-Codec"/>
				<xs:element name="CodecType" type="md:string-Audio-Enc-CodecType" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="BitrateMax" type="xs:integer" minOccurs="0"/>
				<xs:element name="BitrateAverage" type="xs:integer" minOccurs="0"/>
				<xs:element name="VBR" type="md:string-Audio-Enc-VBR" minOccurs="0"/>
				<xs:element name="SampleRate" type="xs:integer" minOccurs="0"/>
				<xs:element name="SampleBitDepth" type="xs:integer" minOccurs="0"/>
				<xs:element name="ChannelMapping" type="md:string-Audio-Enc-ChannelMapping" minOccurs="0"/>
				<xs:element name="Watermark" type="md:DigitalAssetWatermark-type" minOccurs="0" maxOccurs="unbounded"/>
				<xs:element name="ActualLength" type="xs:duration" minOccurs="0"/>
			</xs:sequence>
		</xs:complexType>
	 */
	private class Encoding {
		
		static final String NODE_ROOT = "Encoding";
		
		private final String NODE_CODEC = "Codec";
		private final String NODE_CODEC_TYPE = "CodecType";
		private final String NODE_BITRATE_MAX = "BitrateMax";
		private final String NODE_BITRATE_AVERAGE = "BirateAverage";
		private final String NODE_VBR = "VBR";
		private final String NODE_SAMPLE_RATE = "SampleRate";
		private final String NODE_SAMPLE_BIT_DEPTH = "SampleBitDepth";
		private final String NODE_ACTUAL_LENGTH = "ActualLength";
		
		private String codec;
		private String codecType;
		private int bitrateMax;
		private int bitrateAverage;
		private String vbr;
		private int sampleRate;
		private int sampleBitDepth;
		private String channelMapping;
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
						
					case NODE_BITRATE_MAX:
						this.bitrateMax = Integer.parseInt(nodeText);
						break;
						
					case NODE_BITRATE_AVERAGE:
						this.bitrateAverage = Integer.parseInt(nodeText);
						break;
						
					case NODE_VBR:
						this.vbr = nodeText;
						break;
						
					case NODE_SAMPLE_RATE:
						this.sampleRate = Integer.parseInt(nodeText);
						break;
						
					case NODE_SAMPLE_BIT_DEPTH:
						this.sampleBitDepth = Integer.parseInt(nodeText);
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

}
