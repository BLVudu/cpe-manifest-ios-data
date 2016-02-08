//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.11 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.02.08 at 03:02:05 PM PST 
//


package com.wb.nextgen.manifest.schema.v1_4;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlValue;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * <p>Java class for InventoryTextObject-type complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="InventoryTextObject-type"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;choice&gt;
 *         &lt;element name="ContainerReference"&gt;
 *           &lt;complexType&gt;
 *             &lt;complexContent&gt;
 *               &lt;extension base="{http://www.movielabs.com/schema/manifest/v1.4/manifest}ContainerReference-type"&gt;
 *                 &lt;attribute name="type" type="{http://www.w3.org/2001/XMLSchema}string" /&gt;
 *               &lt;/extension&gt;
 *             &lt;/complexContent&gt;
 *           &lt;/complexType&gt;
 *         &lt;/element&gt;
 *         &lt;element name="SubtitleID" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}SubtitleTrackID-type"/&gt;
 *         &lt;element name="TextString" maxOccurs="unbounded"&gt;
 *           &lt;complexType&gt;
 *             &lt;simpleContent&gt;
 *               &lt;extension base="&lt;http://www.w3.org/2001/XMLSchema&gt;string"&gt;
 *                 &lt;attribute name="index" type="{http://www.w3.org/2001/XMLSchema}integer" /&gt;
 *               &lt;/extension&gt;
 *             &lt;/simpleContent&gt;
 *           &lt;/complexType&gt;
 *         &lt;/element&gt;
 *       &lt;/choice&gt;
 *       &lt;attribute name="TextObjectID" use="required" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}TextObjectID-type" /&gt;
 *       &lt;attribute name="language" type="{http://www.w3.org/2001/XMLSchema}language" /&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "InventoryTextObject-type", propOrder = {
    "containerReference",
    "subtitleID",
    "textString"
})
public class InventoryTextObjectType {

    @XmlElement(name = "ContainerReference")
    protected InventoryTextObjectType.ContainerReference containerReference;
    @XmlElement(name = "SubtitleID")
    @XmlSchemaType(name = "anyURI")
    protected String subtitleID;
    @XmlElement(name = "TextString")
    protected List<InventoryTextObjectType.TextString> textString;
    @XmlAttribute(name = "TextObjectID", required = true)
    protected String textObjectID;
    @XmlAttribute(name = "language")
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlSchemaType(name = "language")
    protected String language;

    /**
     * Gets the value of the containerReference property.
     * 
     * @return
     *     possible object is
     *     {@link InventoryTextObjectType.ContainerReference }
     *     
     */
    public InventoryTextObjectType.ContainerReference getContainerReference() {
        return containerReference;
    }

    /**
     * Sets the value of the containerReference property.
     * 
     * @param value
     *     allowed object is
     *     {@link InventoryTextObjectType.ContainerReference }
     *     
     */
    public void setContainerReference(InventoryTextObjectType.ContainerReference value) {
        this.containerReference = value;
    }

    /**
     * Gets the value of the subtitleID property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSubtitleID() {
        return subtitleID;
    }

    /**
     * Sets the value of the subtitleID property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSubtitleID(String value) {
        this.subtitleID = value;
    }

    /**
     * Gets the value of the textString property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the textString property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getTextString().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link InventoryTextObjectType.TextString }
     * 
     * 
     */
    public List<InventoryTextObjectType.TextString> getTextString() {
        if (textString == null) {
            textString = new ArrayList<InventoryTextObjectType.TextString>();
        }
        return this.textString;
    }

    /**
     * Gets the value of the textObjectID property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTextObjectID() {
        return textObjectID;
    }

    /**
     * Sets the value of the textObjectID property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTextObjectID(String value) {
        this.textObjectID = value;
    }

    /**
     * Gets the value of the language property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLanguage() {
        return language;
    }

    /**
     * Sets the value of the language property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLanguage(String value) {
        this.language = value;
    }


    /**
     * <p>Java class for anonymous complex type.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.
     * 
     * <pre>
     * &lt;complexType&gt;
     *   &lt;complexContent&gt;
     *     &lt;extension base="{http://www.movielabs.com/schema/manifest/v1.4/manifest}ContainerReference-type"&gt;
     *       &lt;attribute name="type" type="{http://www.w3.org/2001/XMLSchema}string" /&gt;
     *     &lt;/extension&gt;
     *   &lt;/complexContent&gt;
     * &lt;/complexType&gt;
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "")
    public static class ContainerReference
        extends ContainerReferenceType
    {

        @XmlAttribute(name = "type")
        protected String type;

        /**
         * Gets the value of the type property.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getType() {
            return type;
        }

        /**
         * Sets the value of the type property.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setType(String value) {
            this.type = value;
        }

    }


    /**
     * <p>Java class for anonymous complex type.
     * 
     * <p>The following schema fragment specifies the expected content contained within this class.
     * 
     * <pre>
     * &lt;complexType&gt;
     *   &lt;simpleContent&gt;
     *     &lt;extension base="&lt;http://www.w3.org/2001/XMLSchema&gt;string"&gt;
     *       &lt;attribute name="index" type="{http://www.w3.org/2001/XMLSchema}integer" /&gt;
     *     &lt;/extension&gt;
     *   &lt;/simpleContent&gt;
     * &lt;/complexType&gt;
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "value"
    })
    public static class TextString {

        @XmlValue
        protected String value;
        @XmlAttribute(name = "index")
        protected BigInteger index;

        /**
         * Gets the value of the value property.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getValue() {
            return value;
        }

        /**
         * Sets the value of the value property.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setValue(String value) {
            this.value = value;
        }

        /**
         * Gets the value of the index property.
         * 
         * @return
         *     possible object is
         *     {@link BigInteger }
         *     
         */
        public BigInteger getIndex() {
            return index;
        }

        /**
         * Sets the value of the index property.
         * 
         * @param value
         *     allowed object is
         *     {@link BigInteger }
         *     
         */
        public void setIndex(BigInteger value) {
            this.index = value;
        }

    }

}
