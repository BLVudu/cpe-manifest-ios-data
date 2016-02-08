//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.02.08 at 03:02:05 PM PST 
//


package com.wb.nextgen.manifest.schema.v1_4;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;
import com.wb.nextgen.md.schema.v2_3.DigitalAssetVideoDataType;


/**
 * <p>Java class for InventoryVideo-type complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="InventoryVideo-type"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://www.movielabs.com/schema/md/v2.3/md}DigitalAssetVideoData-type"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="ContainerReference" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}ContainerReference-type" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *       &lt;attribute name="VideoTrackID" use="required" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}VideoTrackID-type" /&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "InventoryVideo-type", propOrder = {
    "containerReference"
})
public class InventoryVideoType
    extends DigitalAssetVideoDataType
{

    @XmlElement(name = "ContainerReference")
    protected ContainerReferenceType containerReference;
    @XmlAttribute(name = "VideoTrackID", required = true)
    protected String videoTrackID;

    /**
     * Gets the value of the containerReference property.
     * 
     * @return
     *     possible object is
     *     {@link ContainerReferenceType }
     *     
     */
    public ContainerReferenceType getContainerReference() {
        return containerReference;
    }

    /**
     * Sets the value of the containerReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link ContainerReferenceType }
     *     
     */
    public void setContainerReference(ContainerReferenceType value) {
        this.containerReference = value;
    }

    /**
     * Gets the value of the videoTrackID property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVideoTrackID() {
        return videoTrackID;
    }

    /**
     * Sets the value of the videoTrackID property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVideoTrackID(String value) {
        this.videoTrackID = value;
    }

}
