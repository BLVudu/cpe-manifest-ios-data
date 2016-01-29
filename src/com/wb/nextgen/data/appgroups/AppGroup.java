package com.wb.nextgen.data.appgroups;

import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.wb.nextgen.data.inventory.Interactive;
import com.wb.nextgen.data.managers.NextGenDataManager;
import com.wb.nextgen.data.shared.InteractiveEncoding;

/*
	<xs:complexType name="AppGroup-type">
		<xs:sequence>
			<xs:element name="InteractiveTrackReference" type="manifest:InteractiveTrackReference-type" maxOccurs="unbounded"/>
		</xs:sequence>
		<xs:attribute name="AppGroupID" type="manifest:AppGroupID-type" use="required"/>
	</xs:complexType>
 */

public class AppGroup {
	
	public static final String NODE_ROOT = "manifest:AppGroup";
	
	private final String ATTRIBUTE_APP_GROUP_ID = "AppGroupID";
	
	public String appGroupId;
	private List<InteractiveTrackReference> interactiveTrackReferences = new ArrayList<InteractiveTrackReference>();
	
	public AppGroup(Element xmlElement) {
		this.appGroupId = xmlElement.getAttribute(ATTRIBUTE_APP_GROUP_ID);
		
		NodeList childNodes = xmlElement.getChildNodes();
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Element.ELEMENT_NODE && childNode.getNodeName().equals(InteractiveTrackReference.NODE_ROOT)) {
				this.interactiveTrackReferences.add(new InteractiveTrackReference((Element) childNode));
			}
		}
	}
	
	/*
		<xs:complexType name="InteractiveTrackReference-type">
			<xs:sequence>
				<xs:element name="InteractiveTrackID" type="manifest:InteractiveTrackID-type"/>
				<xs:element name="Compatibility" type="md:DigitalAssetInteractiveEncoding-type" maxOccurs="unbounded"/>
			</xs:sequence>
			<xs:attribute name="priority" type="xs:positiveInteger"/>
		</xs:complexType>
	 */
	private class InteractiveTrackReference {
		
		static final String NODE_ROOT = "manifest:InteractiveTrackReference";
		
		private final String ATTRIBUTE_PRIORITY = "priority";
		
		private final String NODE_INTERACTIVE_TRACK_ID = "manifest:InteractiveTrackID";
		private final String NODE_COMPATIBILITY = "manifest:Compatibility";
		
		private int priority;
		private Interactive interactive;
		private List<InteractiveEncoding> compatibilityList = new ArrayList<InteractiveEncoding>();
		
		public InteractiveTrackReference(Element xmlElement) {
			this.priority = Integer.parseInt(xmlElement.getAttribute(ATTRIBUTE_PRIORITY));
			
			NodeList childNodes = xmlElement.getChildNodes();
			for (int i = 0; i < childNodes.getLength(); i++) {
				Node childNode = childNodes.item(i);
				if (childNode.getNodeType() == Element.ELEMENT_NODE) {
					Element nodeElement = (Element) childNode;
					String nodeText = nodeElement.getTextContent();
					
					switch (childNode.getNodeName()) {
					case NODE_INTERACTIVE_TRACK_ID:
						this.interactive = NextGenDataManager.getInstance().getInventory().getInteractiveByTrackId(nodeText);
						break;
						
					case NODE_COMPATIBILITY:
						this.compatibilityList.add(new InteractiveEncoding(nodeElement));
						break;
					}
				}
			}
		}
		
	}

}
