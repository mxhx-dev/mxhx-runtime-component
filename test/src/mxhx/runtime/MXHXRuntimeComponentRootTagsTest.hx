package mxhx.runtime;

import Xml.XmlType;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentRootTagsTest extends Test {
	public function testModelRoot():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Model xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<root>
					<child>123.4</child>
				</root>
			</mx:Model>
		');
		Assert.notNull(result);
		Assert.equals(1, Reflect.fields(result).length);
		var child = Reflect.field(result, "child");
		Assert.isOfType(child, Float);
		Assert.equals(123.4, child);
	}

	public function testXmlRoot():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Xml xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<root>
					<element attr="true">123.4</element>
				</root>
			</mx:Xml>
		');
		Assert.notNull(result);
		Assert.isOfType(result, Xml);
		var xml = cast(result, Xml);
		Assert.equals(XmlType.Document, xml.nodeType);

		var root:Xml = xml.firstElement();
		Assert.notNull(root);
		Assert.equals(XmlType.Element, root.nodeType);
		Assert.equals("root", root.nodeName);
		Assert.isFalse(root.attributes().hasNext());

		var elements = root.elements();

		Assert.isTrue(elements.hasNext());

		var element:Xml = elements.next();
		Assert.notNull(element);
		Assert.equals(XmlType.Element, element.nodeType);
		Assert.equals("element", element.nodeName);
		Assert.isFalse(element.elements().hasNext());

		var attributes = element.attributes();

		Assert.isTrue(attributes.hasNext());

		var attribute = attributes.next();
		Assert.equals("attr", attribute);
		Assert.equals("true", element.get(attribute));

		Assert.isFalse(attributes.hasNext());

		var text = element.firstChild();
		Assert.notNull(text);
		Assert.equals(XmlType.PCData, text.nodeType);
		Assert.equals("123.4", text.nodeValue);

		Assert.isFalse(elements.hasNext());
	}

	public function testDateRoot():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Date xmlns:mx="https://ns.mxhx.dev/2024/basic"
				fullYear="2024" hours="4" seconds="3">
				<mx:month>3</mx:month>
				<mx:date>10</mx:date>
				<mx:minutes>8</mx:minutes>
			</mx:Date>
		');
		Assert.notNull(result);
		Assert.isOfType(result, Date);
		var date = cast(result, Date);
		Assert.equals(2024, date.getFullYear());
		Assert.equals(3, date.getMonth());
		Assert.equals(10, date.getDate());
		Assert.equals(4, date.getHours());
		Assert.equals(8, date.getMinutes());
		Assert.equals(3, date.getSeconds());
	}

	public function testBoolRoot():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Bool xmlns:mx="https://ns.mxhx.dev/2024/basic">true</mx:Bool>
		');
		Assert.notNull(result);
		Assert.equals(true, result);
	}

	public function testFloatRoot():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Float xmlns:mx="https://ns.mxhx.dev/2024/basic">123.4</mx:Float>
		');
		Assert.notNull(result);
		Assert.equals(123.4, result);
	}

	public function testIntRoot():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Int xmlns:mx="https://ns.mxhx.dev/2024/basic">567</mx:Int>
		');
		Assert.notNull(result);
		Assert.equals(567, result);
	}

	public function testStringRoot():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:String xmlns:mx="https://ns.mxhx.dev/2024/basic">hello</mx:String>
		');
		Assert.equals("hello", result);
	}
}
