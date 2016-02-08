//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.02.08 at 03:02:05 PM PST 
//


package com.wb.nextgen.manifest.schema.v1_4;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for MediaManifestEditDelete-type complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="MediaManifestEditDelete-type"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="AudioTrackID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}AudioTrackID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="VideoTrackID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}VideoTrackID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="SubtitleTrackID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}SubtitleTrackID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="ImageID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}ImageID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="InteractiveTrackID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}InteractiveTrackID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="TextObjectID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}TextObjectID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="PlayableSequenceID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}PlayableSequenceID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="PresentationID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}PictureID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="PictureID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}PictureID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="GalleryID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}GalleryID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="AppGroupID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}AppGroupID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="TextGroupID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}TextGroupID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="TimedSequenceID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}TimedSequenceID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="ExperienceID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}ExperienceID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="ALIDExperienceMap" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}ALIDExperienceMap-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="ContentID" type="{http://www.movielabs.com/schema/md/v2.3/md}ContentID-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="LocalizedInfoRef" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}MediaManifestEditLocRef-type" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MediaManifestEditDelete-type", propOrder = {
    "audioTrackID",
    "videoTrackID",
    "subtitleTrackID",
    "imageID",
    "interactiveTrackID",
    "textObjectID",
    "playableSequenceID",
    "presentationID",
    "pictureID",
    "galleryID",
    "appGroupID",
    "textGroupID",
    "timedSequenceID",
    "experienceID",
    "alidExperienceMap",
    "contentID",
    "localizedInfoRef"
})
public class MediaManifestEditDeleteType {

    @XmlElement(name = "AudioTrackID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> audioTrackID;
    @XmlElement(name = "VideoTrackID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> videoTrackID;
    @XmlElement(name = "SubtitleTrackID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> subtitleTrackID;
    @XmlElement(name = "ImageID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> imageID;
    @XmlElement(name = "InteractiveTrackID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> interactiveTrackID;
    @XmlElement(name = "TextObjectID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> textObjectID;
    @XmlElement(name = "PlayableSequenceID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> playableSequenceID;
    @XmlElement(name = "PresentationID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> presentationID;
    @XmlElement(name = "PictureID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> pictureID;
    @XmlElement(name = "GalleryID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> galleryID;
    @XmlElement(name = "AppGroupID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> appGroupID;
    @XmlElement(name = "TextGroupID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> textGroupID;
    @XmlElement(name = "TimedSequenceID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> timedSequenceID;
    @XmlElement(name = "ExperienceID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> experienceID;
    @XmlElement(name = "ALIDExperienceMap")
    protected List<ALIDExperienceMapType> alidExperienceMap;
    @XmlElement(name = "ContentID")
    @XmlSchemaType(name = "anyURI")
    protected List<String> contentID;
    @XmlElement(name = "LocalizedInfoRef")
    protected List<MediaManifestEditLocRefType> localizedInfoRef;

    /**
     * Gets the value of the audioTrackID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the audioTrackID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getAudioTrackID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getAudioTrackID() {
        if (audioTrackID == null) {
            audioTrackID = new ArrayList<String>();
        }
        return this.audioTrackID;
    }

    /**
     * Gets the value of the videoTrackID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the videoTrackID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getVideoTrackID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getVideoTrackID() {
        if (videoTrackID == null) {
            videoTrackID = new ArrayList<String>();
        }
        return this.videoTrackID;
    }

    /**
     * Gets the value of the subtitleTrackID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the subtitleTrackID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getSubtitleTrackID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getSubtitleTrackID() {
        if (subtitleTrackID == null) {
            subtitleTrackID = new ArrayList<String>();
        }
        return this.subtitleTrackID;
    }

    /**
     * Gets the value of the imageID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the imageID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getImageID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getImageID() {
        if (imageID == null) {
            imageID = new ArrayList<String>();
        }
        return this.imageID;
    }

    /**
     * Gets the value of the interactiveTrackID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the interactiveTrackID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getInteractiveTrackID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getInteractiveTrackID() {
        if (interactiveTrackID == null) {
            interactiveTrackID = new ArrayList<String>();
        }
        return this.interactiveTrackID;
    }

    /**
     * Gets the value of the textObjectID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the textObjectID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getTextObjectID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getTextObjectID() {
        if (textObjectID == null) {
            textObjectID = new ArrayList<String>();
        }
        return this.textObjectID;
    }

    /**
     * Gets the value of the playableSequenceID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the playableSequenceID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getPlayableSequenceID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getPlayableSequenceID() {
        if (playableSequenceID == null) {
            playableSequenceID = new ArrayList<String>();
        }
        return this.playableSequenceID;
    }

    /**
     * Gets the value of the presentationID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the presentationID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getPresentationID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getPresentationID() {
        if (presentationID == null) {
            presentationID = new ArrayList<String>();
        }
        return this.presentationID;
    }

    /**
     * Gets the value of the pictureID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the pictureID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getPictureID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getPictureID() {
        if (pictureID == null) {
            pictureID = new ArrayList<String>();
        }
        return this.pictureID;
    }

    /**
     * Gets the value of the galleryID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the galleryID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getGalleryID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getGalleryID() {
        if (galleryID == null) {
            galleryID = new ArrayList<String>();
        }
        return this.galleryID;
    }

    /**
     * Gets the value of the appGroupID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the appGroupID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getAppGroupID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getAppGroupID() {
        if (appGroupID == null) {
            appGroupID = new ArrayList<String>();
        }
        return this.appGroupID;
    }

    /**
     * Gets the value of the textGroupID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the textGroupID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getTextGroupID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getTextGroupID() {
        if (textGroupID == null) {
            textGroupID = new ArrayList<String>();
        }
        return this.textGroupID;
    }

    /**
     * Gets the value of the timedSequenceID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the timedSequenceID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getTimedSequenceID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getTimedSequenceID() {
        if (timedSequenceID == null) {
            timedSequenceID = new ArrayList<String>();
        }
        return this.timedSequenceID;
    }

    /**
     * Gets the value of the experienceID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the experienceID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getExperienceID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getExperienceID() {
        if (experienceID == null) {
            experienceID = new ArrayList<String>();
        }
        return this.experienceID;
    }

    /**
     * Gets the value of the alidExperienceMap property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the alidExperienceMap property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getALIDExperienceMap().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ALIDExperienceMapType }
     * 
     * 
     */
    public List<ALIDExperienceMapType> getALIDExperienceMap() {
        if (alidExperienceMap == null) {
            alidExperienceMap = new ArrayList<ALIDExperienceMapType>();
        }
        return this.alidExperienceMap;
    }

    /**
     * Gets the value of the contentID property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the contentID property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getContentID().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getContentID() {
        if (contentID == null) {
            contentID = new ArrayList<String>();
        }
        return this.contentID;
    }

    /**
     * Gets the value of the localizedInfoRef property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the localizedInfoRef property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getLocalizedInfoRef().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MediaManifestEditLocRefType }
     * 
     * 
     */
    public List<MediaManifestEditLocRefType> getLocalizedInfoRef() {
        if (localizedInfoRef == null) {
            localizedInfoRef = new ArrayList<MediaManifestEditLocRefType>();
        }
        return this.localizedInfoRef;
    }

}
