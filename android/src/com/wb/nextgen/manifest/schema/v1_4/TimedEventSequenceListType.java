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
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for TimedEventSequenceList-type complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="TimedEventSequenceList-type"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="TimedEventSequence" type="{http://www.movielabs.com/schema/manifest/v1.4/manifest}TimedEventSequence-type" maxOccurs="unbounded"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TimedEventSequenceList-type", propOrder = {
    "timedEventSequence"
})
public class TimedEventSequenceListType {

    @XmlElement(name = "TimedEventSequence", required = true)
    protected List<TimedEventSequenceType> timedEventSequence;

    /**
     * Gets the value of the timedEventSequence property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the timedEventSequence property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getTimedEventSequence().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link TimedEventSequenceType }
     * 
     * 
     */
    public List<TimedEventSequenceType> getTimedEventSequence() {
        if (timedEventSequence == null) {
            timedEventSequence = new ArrayList<TimedEventSequenceType>();
        }
        return this.timedEventSequence;
    }

}
