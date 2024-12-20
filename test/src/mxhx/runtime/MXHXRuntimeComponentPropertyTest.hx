package mxhx.runtime;

import fixtures.TestPropertiesClass;
import fixtures.TestAbstractFromModuleType.ModuleType;
import Xml.XmlType;
import fixtures.TestComplexEnum;
import fixtures.TestDefaultPropertyClass1;
import fixtures.TestDefaultPropertyClass2;
import fixtures.TestPropertiesClass;
import fixtures.TestPropertyAbstractEnum;
import fixtures.TestPropertyEnum;
import mxhx.runtime.MXHXRuntimeComponent.MXHXRuntimeComponentException;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentPropertyTest extends Test {
	public function testDynamicAttributeBool():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				dyn="true"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Bool);
		Assert.isTrue(dynValue);
	}

	public function testDynamicAttributeFloat():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				dyn="123.4"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Float);
		Assert.equals(123.4, dynValue);
	}

	public function testDynamicAttributeInt():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				dyn="567"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Int);
		Assert.equals(567, dynValue);
	}

	public function testDynamicAttributeString():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				dyn="hello"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, String);
		Assert.equals("hello", dynValue);
	}

	public function testDynamicChildElementBool():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>true</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Bool);
		Assert.isTrue(dynValue);
	}

	public function testDynamicChildElementRedundantBool():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Bool>true</mx:Bool>
				</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Bool);
		Assert.isTrue(dynValue);
	}

	public function testDynamicChildElementFloat():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>123.4</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Float);
		Assert.equals(123.4, dynValue);
	}

	public function testDynamicChildElementRedundantFloat():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Float>123.4</mx:Float>
				</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Float);
		Assert.equals(123.4, dynValue);
	}

	public function testDynamicChildElementInt():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>567</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Int);
		Assert.equals(567, dynValue);
	}

	public function testDynamicChildElementRedundantInt():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Int>567</mx:Int>
				</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, Int);
		Assert.equals(567, dynValue);
	}

	public function testDynamicChildElementString():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>hello</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, String);
		Assert.equals("hello", dynValue);
	}

	public function testDynamicChildElementRedundantString():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:String>hello</mx:String>
				</tests:dyn>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var dynValue = (result : TestPropertiesClass).dyn;
		Assert.isOfType(dynValue, String);
		Assert.equals("hello", dynValue);
	}

	public function testAnyAttributeBool():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				any="true"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Bool);
		Assert.isTrue(anyValue);
	}

	public function testAnyAttributeFloat():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				any="123.4"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Float);
		Assert.equals(123.4, anyValue);
	}

	public function testAnyAttributeInt():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				any="567"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Int);
		Assert.equals(567, anyValue);
	}

	public function testAnyAttributeString():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				any="hello"/>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, String);
		Assert.equals("hello", anyValue);
	}

	public function testAnyChildElementBool():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>true</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Bool);
		Assert.isTrue(anyValue);
	}

	public function testAnyChildElementRedundantBool():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>
					<mx:Bool>true</mx:Bool>
				</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Bool);
		Assert.isTrue(anyValue);
	}

	public function testAnyChildElementFloat():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>123.4</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Float);
		Assert.equals(123.4, anyValue);
	}

	public function testAnyChildElementRedundantFloat():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>
					<mx:Float>123.4</mx:Float>
				</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Float);
		Assert.equals(123.4, anyValue);
	}

	public function testAnyChildElementInt():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>567</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Int);
		Assert.equals(567, anyValue);
	}

	public function testAnyChildElementRedundantInt():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>
					<mx:Int>567</mx:Int>
				</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, Int);
		Assert.equals(567, anyValue);
	}

	public function testAnyChildElementString():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>hello</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, String);
		Assert.equals("hello", anyValue);
	}

	public function testAnyChildElementRedundantString():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:any>
					<mx:String>hello</mx:String>
				</tests:any>
			</tests:TestPropertiesClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		var anyValue = (result : TestPropertiesClass).any;
		Assert.isOfType(anyValue, String);
		Assert.equals("hello", anyValue);
	}

	public function testStructChildElementDuplicateAttributes():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Struct float="123.4" float="567.8"/>
				</tests:dyn>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStructChildElementDuplicateChildren():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Struct>
						<mx:float>123.4</mx:float>
						<mx:float>567.8</mx:float>
					</mx:Struct>
				</tests:dyn>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStructChildElementDuplicateAttributeAndChild():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Struct float="123.4">
						<mx:float>567.8</mx:float>
					</mx:Struct>
				</tests:dyn>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStructChildElementAttributes():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Struct float="123.4" float_hex="0xbeef" nan="NaN" boolean_true="true" boolean_false="false" string="hello"/>
				</tests:dyn>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("struct"));
		var struct = (result : TestPropertiesClass).dyn;
		Assert.equals(6, Reflect.fields(struct).length);
		Assert.isTrue(Reflect.hasField(struct, "float"));
		Assert.isTrue(Reflect.hasField(struct, "float_hex"));
		Assert.isTrue(Reflect.hasField(struct, "nan"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_true"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_false"));
		Assert.isTrue(Reflect.hasField(struct, "string"));
		Assert.equals(123.4, Reflect.field(struct, "float"));
		Assert.equals(0xbeef, Reflect.field(struct, "float_hex"));
		Assert.isTrue(Math.isNaN(Reflect.field(struct, "nan")));
		Assert.isTrue(Reflect.field(struct, "boolean_true"));
		Assert.isFalse(Reflect.field(struct, "boolean_false"));
		Assert.equals("hello", Reflect.field(struct, "string"));
	}

	public function testStructChildElementAttributesExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Struct float=" 123.4 " float_hex=" 0xbeef " nan=" NaN " boolean_true=" true " boolean_false=" false " string=" hello "/>
				</tests:dyn>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("struct"));
		var struct = (result : TestPropertiesClass).dyn;
		Assert.equals(6, Reflect.fields(struct).length);
		Assert.isTrue(Reflect.hasField(struct, "float"));
		Assert.isTrue(Reflect.hasField(struct, "float_hex"));
		Assert.isTrue(Reflect.hasField(struct, "nan"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_true"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_false"));
		Assert.isTrue(Reflect.hasField(struct, "string"));
		Assert.equals(123.4, Reflect.field(struct, "float"));
		Assert.equals(0xbeef, Reflect.field(struct, "float_hex"));
		Assert.isTrue(Math.isNaN(Reflect.field(struct, "nan")));
		Assert.isTrue(Reflect.field(struct, "boolean_true"));
		Assert.isFalse(Reflect.field(struct, "boolean_false"));
		Assert.equals(" hello ", Reflect.field(struct, "string"));
	}

	public function testStructChildElementChildren():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Struct>
						<mx:float>123.4</mx:float>
						<mx:float_hex>0xbeef</mx:float_hex>
						<mx:nan>NaN</mx:nan>
						<mx:boolean_true>true</mx:boolean_true>
						<mx:boolean_false>false</mx:boolean_false>
						<mx:string>hello</mx:string>
						<mx:object>
							<mx:Struct>
								<mx:integer>567</mx:integer>
							</mx:Struct>
						</mx:object>
					</mx:Struct>
				</tests:dyn>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("struct"));
		var struct = (result : TestPropertiesClass).dyn;
		Assert.equals(7, Reflect.fields(struct).length);
		Assert.isTrue(Reflect.hasField(struct, "float"));
		Assert.isTrue(Reflect.hasField(struct, "float_hex"));
		Assert.isTrue(Reflect.hasField(struct, "nan"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_true"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_false"));
		Assert.isTrue(Reflect.hasField(struct, "string"));
		Assert.isTrue(Reflect.hasField(struct, "object"));
		Assert.equals(123.4, Reflect.field(struct, "float"));
		Assert.equals(0xbeef, Reflect.field(struct, "float_hex"));
		Assert.isTrue(Math.isNaN(Reflect.field(struct, "nan")));
		Assert.isTrue(Reflect.field(struct, "boolean_true"));
		Assert.isFalse(Reflect.field(struct, "boolean_false"));
		Assert.equals("hello", Reflect.field(struct, "string"));
		Assert.notNull(Reflect.field(struct, "object"));
		Assert.equals(1, Reflect.fields(struct.object).length);
		Assert.equals(567, Reflect.field(Reflect.field(struct, "object"), "integer"));
	}

	public function testStructChildElementChildrenExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:dyn>
					<mx:Struct>
						<mx:float>
							123.4
						</mx:float>
						<mx:float_hex>
							0xbeef
						</mx:float_hex>
						<mx:nan>
							NaN
						</mx:nan>
						<mx:boolean_true>
							true
						</mx:boolean_true>
						<mx:boolean_false>
							false
						</mx:boolean_false>
						<mx:string> hello </mx:string>
						<mx:object>
							<mx:Struct>
								<mx:integer>
									567
								</mx:integer>
							</mx:Struct>
						</mx:object>
					</mx:Struct>
				</tests:dyn>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("struct"));
		var struct = (result : TestPropertiesClass).dyn;
		Assert.equals(7, Reflect.fields(struct).length);
		Assert.isTrue(Reflect.hasField(struct, "float"));
		Assert.isTrue(Reflect.hasField(struct, "float_hex"));
		Assert.isTrue(Reflect.hasField(struct, "nan"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_true"));
		Assert.isTrue(Reflect.hasField(struct, "boolean_false"));
		Assert.isTrue(Reflect.hasField(struct, "string"));
		Assert.isTrue(Reflect.hasField(struct, "object"));
		Assert.equals(123.4, Reflect.field(struct, "float"));
		Assert.equals(0xbeef, Reflect.field(struct, "float_hex"));
		Assert.isTrue(Math.isNaN(Reflect.field(struct, "nan")));
		Assert.isTrue(Reflect.field(struct, "boolean_true"));
		Assert.isFalse(Reflect.field(struct, "boolean_false"));
		Assert.equals(" hello ", Reflect.field(struct, "string"));
		Assert.notNull(Reflect.field(struct, "object"));
		Assert.equals(1, Reflect.fields(struct.object).length);
		Assert.equals(567, Reflect.field(Reflect.field(struct, "object"), "integer"));
	}

	public function testStrictChildElementDuplicateAttributes():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:strictlyTyped>
					<tests:TestPropertiesClass float="123.4" float="567.8"/>
				</tests:strictlyTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStrictChildElementDuplicateChildren():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:strictlyTyped>
					<tests:TestPropertiesClass>
						<mx:float>123.4</mx:float>
						<mx:float>567.8</mx:float>
					</tests:TestPropertiesClass>
				</tests:strictlyTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStrictChildElementDuplicateAttributeAndChild():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:strictlyTyped>
					<tests:TestPropertiesClass float="123.4">
						<mx:float>567.8</mx:float>
					</tests:TestPropertiesClass>
				</tests:strictlyTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStrictChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:strictlyTyped>
					<tests:TestPropertiesClass
						boolean="true"
						float="123.4"
						integer="567"
						string="hello"
						canBeNull="890.1">
						<tests:dyn>
							<mx:Struct float="123.4" boolean="true" string="hello">
								<mx:object>
									<mx:Struct>
										<mx:integer>567</mx:integer>
									</mx:Struct>
								</mx:object>
							</mx:Struct>
						</tests:dyn>
					</tests:TestPropertiesClass>
				</tests:strictlyTyped>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("strictlyTyped"));
		var strictlyTyped = (result : TestPropertiesClass).strictlyTyped;
		Assert.isTrue(strictlyTyped.boolean);
		Assert.equals(123.4, strictlyTyped.float);
		Assert.equals("hello", strictlyTyped.string);
		Assert.equals(567, strictlyTyped.integer);
		Assert.equals(890.1, strictlyTyped.canBeNull);
		Assert.notNull(strictlyTyped.dyn);
		Assert.equals(4, Reflect.fields(strictlyTyped.dyn).length);
		Assert.isTrue(Reflect.hasField(strictlyTyped.dyn, "float"));
		Assert.isTrue(Reflect.hasField(strictlyTyped.dyn, "boolean"));
		Assert.isTrue(Reflect.hasField(strictlyTyped.dyn, "string"));
		Assert.isTrue(Reflect.hasField(strictlyTyped.dyn, "object"));
		Assert.equals(123.4, Reflect.field(strictlyTyped.dyn, "float"));
		Assert.isTrue(Reflect.field(strictlyTyped.dyn, "boolean"));
		Assert.equals("hello", Reflect.field(strictlyTyped.dyn, "string"));
		Assert.notNull(Reflect.field(strictlyTyped.dyn, "object"));
		Assert.equals(567, Reflect.field(Reflect.field(strictlyTyped.dyn, "object"), "integer"));
	}

	public function testStrictChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:strictlyTyped>
					<tests:TestClass1/>
				</tests:strictlyTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testArrayChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:array>
					<mx:String>one</mx:String>
					<mx:String>two</mx:String>
					<mx:String>three</mx:String>
				</tests:array>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("array"));
		var array = (result : TestPropertiesClass).array;
		Assert.isOfType(array, Array);
		Assert.equals(3, array.length);
		Assert.equals("one", array[0]);
		Assert.equals("two", array[1]);
		Assert.equals("three", array[2]);
	}

	public function testArrayChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:array>
					<mx:Array>
						<mx:String>one</mx:String>
						<mx:String>two</mx:String>
						<mx:String>three</mx:String>
					</mx:Array>
				</tests:array>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("array"));
		var array = (result : TestPropertiesClass).array;
		Assert.isOfType(array, Array);
		Assert.equals(3, array.length);
		Assert.equals("one", array[0]);
		Assert.equals("two", array[1]);
		Assert.equals("three", array[2]);
	}

	public function testArrayChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:array>
					<mx:Array></mx:Array>
				</tests:array>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("array"));
		var array = (result : TestPropertiesClass).array;
		Assert.isOfType(array, Array);
		Assert.equals(0, array.length);
	}

	public function testArrayChildElementRedundantInvalidText():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:array>
					<mx:Array>invalid</mx:Array>
				</tests:array>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testArrayChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:array>
					<mx:Array>
					</mx:Array>
				</tests:array>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("array"));
		var array = (result : TestPropertiesClass).array;
		Assert.isOfType(array, Array);
		Assert.equals(0, array.length);
	}

	public function testBoolAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				boolean=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testBoolAttributeInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				boolean="invalid"/>
		'), MXHXRuntimeComponentException);
	}

	public function testBoolChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean></tests:boolean>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testBoolChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>invalid</tests:boolean>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testBoolTrueAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				boolean="true"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueAttributeExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				boolean=" true "/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>true</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueChildElementExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>
					true
				</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>true<!-- comment --></tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><!-- comment -->true</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>tr<!-- comment -->ue</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><![CDATA[true]]></tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolTrueChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><mx:Bool>true</mx:Bool></tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isTrue(boolean);
	}

	public function testBoolFalseAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				boolean="false"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseAttributeExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				boolean=" false "/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>false</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseChildElementExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>
					false
				</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>false<!-- comment --></tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><!-- comment -->false</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>fa<!-- comment -->lse</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><![CDATA[false]]></tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolFalseChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><mx:Bool>false</mx:Bool></tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><mx:Bool></mx:Bool></tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean>
					<mx:Bool>
					</mx:Bool>
				</tests:boolean>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("boolean"));
		var boolean = (result : TestPropertiesClass).boolean;
		Assert.isOfType(boolean, Bool);
		Assert.isFalse(boolean);
	}

	public function testBoolChildElementRedundantInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><mx:Bool>invalid</mx:Bool></tests:boolean>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testBoolChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><mx:String>hello</mx:String></tests:boolean>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testBoolChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><tests:TestPropertiesClass/></tests:boolean>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testBoolChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:boolean><mx:Struct/></tests:boolean>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testClassAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				type="fixtures.TestClass1"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isOfType(type, Class);
		Assert.equals(fixtures.TestClass1, type);
	}

	public function testClassAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				type=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testClassAttributeInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				type="fixtures.ThisClassDoesNotExist"/>
		'), MXHXRuntimeComponentException);
	}

	public function testClassChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type>fixtures.TestClass1</tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isOfType(type, Class);
		Assert.equals(fixtures.TestClass1, type);
	}

	public function testClassChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type></tests:type>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testClassChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type>fixtures.ThisClassDoesNotExist</tests:type>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testClassChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type>fixtures.TestClass1<!-- comment --></tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isOfType(type, Class);
		Assert.equals(fixtures.TestClass1, type);
	}

	public function testClassChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><!-- comment -->fixtures.TestClass1</tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isOfType(type, Class);
		Assert.equals(fixtures.TestClass1, type);
	}

	public function testClassChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type>fixtures.<!-- comment -->TestClass1</tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isOfType(type, Class);
		Assert.equals(fixtures.TestClass1, type);
	}

	public function testClassChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><![CDATA[fixtures.TestClass1]]></tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isOfType(type, Class);
		Assert.equals(fixtures.TestClass1, type);
	}

	public function testClassChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><mx:Class>fixtures.TestClass1</mx:Class></tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isOfType(type, Class);
		Assert.equals(fixtures.TestClass1, type);
	}

	public function testClassChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><mx:Class></mx:Class></tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isNull(type);
	}

	public function testClassChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type>
					<mx:Class>
					</mx:Class>
				</tests:type>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("type"));
		var type = (result : TestPropertiesClass).type;
		Assert.isNull(type);
	}

	public function testClassChildElementRedundantInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><mx:Class>fixtures.ThisClassDoesNotExist</mx:Class></tests:type>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testClassChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><mx:String>hello</mx:String></tests:type>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testClassChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><tests:TestPropertiesClass/></tests:type>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testClassChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:type><mx:Struct/></tests:type>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testAbstractEnumValueAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				abstractEnumValue="Value2"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractEnumValue"));
		var abstractEnumValue = (result : TestPropertiesClass).abstractEnumValue;
		Assert.equals(TestPropertyAbstractEnum.Value2, abstractEnumValue);
	}

	public function testAbstractEnumValueChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractEnumValue>Value2</tests:abstractEnumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractEnumValue"));
		var abstractEnumValue = (result : TestPropertiesClass).abstractEnumValue;
		Assert.equals(TestPropertyAbstractEnum.Value2, abstractEnumValue);
	}

	public function testAbstractEnumValueChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractEnumValue>Value2<!-- comment --></tests:abstractEnumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractEnumValue"));
		var abstractEnumValue = (result : TestPropertiesClass).abstractEnumValue;
		Assert.equals(TestPropertyAbstractEnum.Value2, abstractEnumValue);
	}

	public function testAbstractEnumValueChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractEnumValue><!-- comment -->Value2</tests:abstractEnumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractEnumValue"));
		var abstractEnumValue = (result : TestPropertiesClass).abstractEnumValue;
		Assert.equals(TestPropertyAbstractEnum.Value2, abstractEnumValue);
	}

	public function testAbstractEnumValueChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractEnumValue>Val<!-- comment -->ue2</tests:abstractEnumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractEnumValue"));
		var abstractEnumValue = (result : TestPropertiesClass).abstractEnumValue;
		Assert.equals(TestPropertyAbstractEnum.Value2, abstractEnumValue);
	}

	public function testAbstractEnumValueChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractEnumValue><![CDATA[Value2]]></tests:abstractEnumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractEnumValue"));
		var abstractEnumValue = (result : TestPropertiesClass).abstractEnumValue;
		Assert.equals(TestPropertyAbstractEnum.Value2, abstractEnumValue);
	}

	public function testAbstractEnumValueChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractEnumValue><tests:TestPropertyAbstractEnum>Value2</tests:TestPropertyAbstractEnum></tests:abstractEnumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var abstractEnumValue = (result : TestPropertiesClass).abstractEnumValue;
		Assert.equals(TestPropertyAbstractEnum.Value2, abstractEnumValue);
	}

	public function testEnumValueAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				enumValue="Value2"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var enumValue = (result : TestPropertiesClass).enumValue;
		Assert.equals(TestPropertyEnum.Value2, enumValue);
	}

	public function testEnumValueAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				enumValue=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testEnumValueAttributeInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				enumValue="NotARealEnumValue"/>
		'), MXHXRuntimeComponentException);
	}

	public function testEnumValueChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue>Value2</tests:enumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var enumValue = (result : TestPropertiesClass).enumValue;
		Assert.equals(TestPropertyEnum.Value2, enumValue);
	}

	public function testEnumValueChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue></tests:enumValue>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testEnumValueChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue>NotARealEnumValue</tests:enumValue>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testEnumValueChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue>Value2<!-- comment --></tests:enumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var enumValue = (result : TestPropertiesClass).enumValue;
		Assert.equals(TestPropertyEnum.Value2, enumValue);
	}

	public function testEnumValueChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue><!-- comment -->Value2</tests:enumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var enumValue = (result : TestPropertiesClass).enumValue;
		Assert.equals(TestPropertyEnum.Value2, enumValue);
	}

	public function testEnumValueChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue>Val<!-- comment -->ue2</tests:enumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var enumValue = (result : TestPropertiesClass).enumValue;
		Assert.equals(TestPropertyEnum.Value2, enumValue);
	}

	public function testEnumValueChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue><![CDATA[Value2]]></tests:enumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var enumValue = (result : TestPropertiesClass).enumValue;
		Assert.equals(TestPropertyEnum.Value2, enumValue);
	}

	public function testEnumValueChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:enumValue><tests:TestPropertyEnum>Value2</tests:TestPropertyEnum></tests:enumValue>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("enumValue"));
		var enumValue = (result : TestPropertiesClass).enumValue;
		Assert.equals(TestPropertyEnum.Value2, enumValue);
	}

	public function testComplexEnumValueChildElementWithoutParameters():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:complexEnum>
					<tests:TestComplexEnum.One/>
				</tests:complexEnum>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("complexEnum"));
		var complexEnum = (result : TestPropertiesClass).complexEnum;
		Assert.equals(TestComplexEnum.One, complexEnum);
	}

	public function testComplexEnumValueChildElementWithParameters():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:complexEnum>
					<tests:TestComplexEnum.Two a="hello" b="123.4"/>
				</tests:complexEnum>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("complexEnum"));
		var complexEnum = (result : TestPropertiesClass).complexEnum;
		switch (complexEnum) {
			case TestComplexEnum.Two("hello", 123.4):
				Assert.pass();
			default:
				Assert.fail("Wrong enum value: " + complexEnum);
		}
	}

	public function testComplexEnumValueChildElementWithoutParametersRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:complexEnum>
					<tests:TestComplexEnum>
						<tests:TestComplexEnum.One/>
					</tests:TestComplexEnum>
				</tests:complexEnum>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("complexEnum"));
		var complexEnum = (result : TestPropertiesClass).complexEnum;
		Assert.equals(TestComplexEnum.One, complexEnum);
	}

	public function testComplexEnumValueChildElementWithParametersRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:complexEnum>
					<tests:TestComplexEnum>
						<tests:TestComplexEnum.Two a="hello" b="123.4"/>
					</tests:TestComplexEnum>
				</tests:complexEnum>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("complexEnum"));
		var complexEnum = (result : TestPropertiesClass).complexEnum;
		switch (complexEnum) {
			case TestComplexEnum.Two("hello", 123.4):
				Assert.pass();
			default:
				Assert.fail("Wrong enum value: " + complexEnum);
		}
	}

	public function testERegAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				ereg="~/[a-z]+/g">
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~/[a-z]+/g", Std.string(ereg));
		#end
	}

	public function testERegAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				ereg="">
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testERegAttributeInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				ereg="invalid">
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testERegChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg>~/[a-z]+/g</tests:ereg>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~/[a-z]+/g", Std.string(ereg));
		#end
	}

	public function testERegChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg></tests:ereg>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testERegChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg>invalid</tests:ereg>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testERegChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg>~/[a-z]+/g<!-- comment --></tests:ereg>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~/[a-z]+/g", Std.string(ereg));
		#end
	}

	public function testERegChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg>~<!-- comment -->/[a-z]+/g</tests:ereg>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~/[a-z]+/g", Std.string(ereg));
		#end
	}

	public function testERegChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg><![CDATA[~/[a-z]+/g]]></tests:ereg>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~/[a-z]+/g", Std.string(ereg));
		#end
	}

	public function testERegChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg><mx:EReg>~/[a-z]+/g</mx:EReg></tests:ereg>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~/[a-z]+/g", Std.string(ereg));
		#end
	}

	public function testERegChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg><mx:EReg></mx:EReg></tests:ereg>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~//", Std.string(ereg));
		#end
	}

	public function testERegChildElementRedundantInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg><mx:EReg>invalid</mx:EReg></tests:ereg>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testERegChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg>
					<mx:EReg>
					</mx:EReg>
				</tests:ereg>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("ereg"));
		var ereg = (result : TestPropertiesClass).ereg;
		Assert.notNull(ereg);
		#if interp
		Assert.equals("~//", Std.string(ereg));
		#end
	}

	public function testERegChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg><mx:String>hello</mx:String></tests:ereg>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testERegChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg><tests:TestPropertiesClass/></tests:ereg>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testERegChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:ereg><mx:Struct/></tests:ereg>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				float="123.4"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				float=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatAttributeInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				float="invalid"/>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatAttributeExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				float=" 123.4 "/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>123.4</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float></tests:float>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>invalid</tests:float>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatChildElementExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>
					123.4
				</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>123.4<!-- comment --></tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><!-- comment -->123.4</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>12<!-- comment -->3.4</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><![CDATA[123.4]]></tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><mx:Float>123.4</mx:Float></tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(123.4, float);
	}

	public function testFloatChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><mx:Float></mx:Float></tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.isTrue(Math.isNaN(float));
	}

	public function testFloatChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>
					<mx:Float>
					</mx:Float>
				</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.isTrue(Math.isNaN(float));
	}

	public function testFloatChildElementRedundantInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><mx:Float>invalid</mx:Float></tests:float>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatChildElementNegative():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>-123.4</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(-123.4, float);
	}

	public function testFloatChildElementHex():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>0xbeef</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(0xbeef, float);
	}

	public function testFloatChildElementHexUpperCase():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>0xBEEF</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(0xbeef, float);
	}

	public function testFloatChildElementHexMixedCase():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>0xbEeF</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(0xbeef, float);
	}

	public function testFloatChildElementHexNegative():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float>-0xbeef</tests:float>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("float"));
		var float = (result : TestPropertiesClass).float;
		Assert.equals(-0xbeef, float);
	}

	public function testFloatChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><mx:String>hello</mx:String></tests:float>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><tests:TestPropertiesClass/></tests:float>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFloatChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:float><mx:Struct/></tests:float>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testIntAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="567"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testIntAttributeInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="invalid"/>
		'), MXHXRuntimeComponentException);
	}

	public function testIntAttributeExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="567"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntAttributeHexLowerCase():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="0xbeef"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(0xbeef, integer);
	}

	public function testIntAttributeHexLowerCaseNegative():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="-0xbeef"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(-0xbeef, integer);
	}

	public function testIntAttributeHexUpperCase():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="0xBEEF"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(0xbeef, integer);
	}

	public function testIntAttributeHexMixedCase():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="0xbEeF"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(0xbeef, integer);
	}

	public function testIntAttributeHexUpperCaseNegative():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer="-0xBEEF"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(-0xbeef, integer);
	}

	public function testIntAttributeHexLowerCaseExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				integer=" 0xbeef "/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(0xbeef, integer);
	}

	public function testIntChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer>567</tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer></tests:integer>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testIntChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer>invalid</tests:integer>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testIntChildElementExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer>
					567
				</tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer>567<!-- comment --></tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><!-- comment -->567</tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer>56<!-- comment -->7</tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><![CDATA[567]]></tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><mx:Int>567</mx:Int></tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(567, integer);
	}

	public function testIntChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><mx:Int></mx:Int></tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(0, integer);
	}

	public function testIntChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer>
					<mx:Int>
					</mx:Int>
				</tests:integer>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("integer"));
		var integer = (result : TestPropertiesClass).integer;
		Assert.equals(0, integer);
	}

	public function testIntChildElementRedundantInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><mx:Int>invalid</mx:Int></tests:integer>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testIntChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><mx:String>hello</mx:String></tests:integer>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testIntChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><tests:TestPropertiesClass/></tests:integer>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testIntChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:integer><mx:Struct/></tests:integer>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStringAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				string="hello"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("hello", string);
	}

	public function testStringAttributeEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				string=""/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("", string);
	}

	public function testStringAttributeExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				string=" hello "/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals(" hello ", string);
	}

	public function testStringChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string>hello</tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("hello", string);
	}

	public function testStringChildElementExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string> hello </tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals(" hello ", string);
	}

	public function testStringChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string>hello<!-- comment --></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("hello", string);
	}

	public function testStringChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><!-- comment -->hello</tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("hello", string);
	}

	public function testStringChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string>hello<!-- comment -->world</tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("helloworld", string);
	}

	public function testStringChildElementEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("", string);
	}

	public function testStringChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><![CDATA[MXHX & Haxe are <cool/>]]></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("MXHX & Haxe are <cool/>", string);
	}

	public function testStringChildElementCDataEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><![CDATA[]]></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("", string);
	}

	public function testStringChildElementCDataWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><![CDATA[ ]]></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals(" ", string);
	}

	public function testStringChildElementCDataWhitespace2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><![CDATA[   ]]></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("   ", string);
	}

	public function testStringChildElementCDataWhitespaceSurroundingWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string>
					<![CDATA[   ]]>
				</tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("   ", string);
	}

	public function testStringChildElementCDataWhitespaceSurroundingWhitespace2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string>
					<![CDATA[   ]]>
					<![CDATA[   ]]>
				</tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("      ", string);
	}

	public function testStringChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String>hello</mx:String></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("hello", string);
	}

	public function testStringChildElementRedundantEmpty1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String></mx:String></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		// child of field element: empty string, child of declarations: null
		Assert.equals("", string);
	}

	public function testStringChildElementRedundantEmpty2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String/></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		// child of field element: empty string, child of declarations: null
		Assert.equals("", string);
	}

	public function testStringChildElementRedundantWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string>
					<mx:String>
					</mx:String>
				</tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		// child of field element: empty string, child of declarations: null
		Assert.equals("", string);
	}

	public function testStringChildElementRedundantCDataEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String><![CDATA[]]></mx:String></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		// child of field element: empty string, child of declarations: null
		Assert.equals("", string);
	}

	public function testStringChildElementRedundantCDataWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String><![CDATA[ ]]></mx:String></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals(" ", string);
	}

	public function testStringChildElementRedundantCDataWhitespace2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String><![CDATA[   ]]></mx:String></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("   ", string);
	}

	public function testStringChildElementRedundantCDataWhitespace3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String>
					<![CDATA[   ]]>
				</mx:String></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("   ", string);
	}

	public function testStringChildElementRedundantCDataWhitespace4():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:String>
					<![CDATA[   ]]>
					<![CDATA[   ]]>
				</mx:String></tests:string>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("string"));
		var string = (result : TestPropertiesClass).string;
		Assert.equals("      ", string);
	}

	public function testStringChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:Float>123.4</mx:Float></tests:string>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStringChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><tests:TestPropertiesClass/></tests:string>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testStringChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:string><mx:Struct/></tests:string>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntAttribute():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				unsignedInteger="0xFFFFFFFF"/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				unsignedInteger=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntAttributeInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				unsignedInteger="invalid"/>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntAttributeExtraWhitespacee():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				unsignedInteger=" 0xFFFFFFFF "/>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger>0xFFFFFFFF</tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntChildElementInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger>invalid</tests:unsignedInteger>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntChildElementExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger>
					0xFFFFFFFF
				</tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger>0xFFFFFFFF<!-- comment --></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><!-- comment -->0xFFFFFFFF</tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger>0xFFFFF<!-- comment -->FFF</tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><![CDATA[0xFFFFFFFF]]></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><mx:UInt>0xFFFFFFFF</mx:UInt></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		#if js
		Assert.equals(Std.parseInt("0xFFFFFFFF"), unsignedInteger);
		Assert.isFalse((unsignedInteger : Float) < 0);
		#else
		Assert.equals(0xFFFFFFFF, unsignedInteger);
		#end
	}

	public function testUIntChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><mx:UInt></mx:UInt></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		Assert.equals(0, unsignedInteger);
	}

	public function testUIntChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger>
					<mx:UInt>
					</mx:UInt>
				</tests:unsignedInteger>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("unsignedInteger"));
		var unsignedInteger = (result : TestPropertiesClass).unsignedInteger;
		Assert.equals(0, unsignedInteger);
	}

	public function testUIntChildElementRedundantInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><mx:UInt>invalid</mx:UInt></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><mx:String>hello</mx:String></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><tests:TestPropertiesClass/></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testUIntChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:unsignedInteger><mx:Struct/></tests:unsignedInteger>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testDefaultPropertyClassWithSimpleValue():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestDefaultPropertyClass2
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				123.4
			</tests:TestDefaultPropertyClass2>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestDefaultPropertyClass2);
		var float = (result : TestDefaultPropertyClass2).float;
		Assert.equals(123.4, float);
	}

	public function testDefaultPropertyClassWithSimpleValueRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestDefaultPropertyClass2
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<mx:Float>123.4</mx:Float>
			</tests:TestDefaultPropertyClass2>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestDefaultPropertyClass2);
		var float = (result : TestDefaultPropertyClass2).float;
		Assert.equals(123.4, float);
	}

	public function testDefaultPropertyClassWithArrayValue():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestDefaultPropertyClass1
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<mx:String>one</mx:String>
				<mx:String>two</mx:String>
				<mx:String>three</mx:String>
			</tests:TestDefaultPropertyClass1>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestDefaultPropertyClass1);
		var mxhxContent = (result : TestDefaultPropertyClass1).mxhxContent;
		var array:Array<String> = Std.downcast(mxhxContent, Array);
		Assert.notNull(array);
		Assert.equals(3, array.length);
		Assert.equals("one", array[0]);
		Assert.equals("two", array[1]);
		Assert.equals("three", array[2]);
	}

	public function testDefaultPropertyClassWithArrayValueRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestDefaultPropertyClass1
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<mx:Array>
					<mx:String>one</mx:String>
					<mx:String>two</mx:String>
					<mx:String>three</mx:String>
				</mx:Array>
			</tests:TestDefaultPropertyClass1>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestDefaultPropertyClass1);
		var mxhxContent = (result : TestDefaultPropertyClass1).mxhxContent;
		var array:Array<String> = Std.downcast(mxhxContent, Array);
		Assert.notNull(array);
		Assert.equals(3, array.length);
		Assert.equals("one", array[0]);
		Assert.equals("two", array[1]);
		Assert.equals("three", array[2]);
	}

	public function testDefaultPropertyClassWithArrayValueAndOtherPropertyBefore():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestDefaultPropertyClass1
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:other>four</tests:other>
				<mx:String>one</mx:String>
				<mx:String>two</mx:String>
				<mx:String>three</mx:String>
			</tests:TestDefaultPropertyClass1>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestDefaultPropertyClass1);
		var mxhxContent = (result : TestDefaultPropertyClass1).mxhxContent;
		var array:Array<String> = Std.downcast(mxhxContent, Array);
		Assert.notNull(array);
		Assert.equals(3, array.length);
		Assert.equals("one", array[0]);
		Assert.equals("two", array[1]);
		Assert.equals("three", array[2]);
		var other = (result : TestDefaultPropertyClass1).other;
		Assert.equals("four", other);
	}

	public function testDefaultPropertyClassWithArrayValueAndOtherPropertyAfter():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestDefaultPropertyClass1
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<mx:String>one</mx:String>
				<mx:String>two</mx:String>
				<mx:String>three</mx:String>
				<tests:other>four</tests:other>
			</tests:TestDefaultPropertyClass1>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestDefaultPropertyClass1);
		var mxhxContent = (result : TestDefaultPropertyClass1).mxhxContent;
		var array:Array<String> = Std.downcast(mxhxContent, Array);
		Assert.notNull(array);
		Assert.equals(3, array.length);
		Assert.equals("one", array[0]);
		Assert.equals("two", array[1]);
		Assert.equals("three", array[2]);
		var other = (result : TestDefaultPropertyClass1).other;
		Assert.equals("four", other);
	}

	public function testDefaultPropertyClassWithArrayValueAndOtherPropertyBetween():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestDefaultPropertyClass1
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<mx:String>one</mx:String>
				<tests:other>four</tests:other>
				<mx:String>two</mx:String>
				<mx:String>three</mx:String>
			</tests:TestDefaultPropertyClass1>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestDefaultPropertyClass1);
		var mxhxContent = (result : TestDefaultPropertyClass1).mxhxContent;
		var array:Array<String> = Std.downcast(mxhxContent, Array);
		Assert.notNull(array);
		Assert.equals(3, array.length);
		Assert.equals("one", array[0]);
		Assert.equals("two", array[1]);
		Assert.equals("three", array[2]);
		var other = (result : TestDefaultPropertyClass1).other;
		Assert.equals("four", other);
	}

	public function testCanBeNullChildElement():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull>890.1</tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.equals(890.1, canBeNull);
	}

	public function testCanBeNullChildElementComment1():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull>890.1<!-- comment --></tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.equals(890.1, canBeNull);
	}

	public function testCanBeNullChildElementComment2():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull><!-- comment -->890.1</tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.equals(890.1, canBeNull);
	}

	public function testCanBeNullChildElementComment3():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull>89<!-- comment -->0.1</tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.equals(890.1, canBeNull);
	}

	public function testCanBeNullChildElementCData():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull><![CDATA[890.1]]></tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.equals(890.1, canBeNull);
	}

	public function testCanBeNullChildElementRedundant():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull><mx:Float>890.1</mx:Float></tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.equals(890.1, canBeNull);
	}

	public function testCanBeNullChildElementRedundantEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull><mx:Float></mx:Float></tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.isTrue(Math.isNaN(canBeNull));
	}

	public function testCanBeNullChildElementRedundantEmptyExtraWhitespace():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull>
					<mx:Float>
					</mx:Float>
				</tests:canBeNull>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("canBeNull"));
		var canBeNull = (result : TestPropertiesClass).canBeNull;
		Assert.isTrue(Math.isNaN(canBeNull));
	}

	public function testCanBeNullChildElementRedundantInvalid():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:canBeNull><mx:Float>invalid</mx:Float></tests:canBeNull>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testXmlChildElementEmpty():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:xml>
					<mx:Xml></mx:Xml>
				</tests:xml>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("xml"));
		var xml = (result : TestPropertiesClass).xml;
		Assert.equals(XmlType.Document, xml.nodeType);
		var firstChild:Xml = xml.firstChild();
		Assert.notNull(firstChild);
		Assert.equals(XmlType.PCData, firstChild.nodeType);
		Assert.equals("", firstChild.nodeValue);
		Assert.isNull(xml.firstElement());
	}

	public function testDateChildElementNoFields():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:date>
					<mx:Date/>
				</tests:date>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		var now = Date.now();
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("date"));
		var date = (result : TestPropertiesClass).date;
		var difference = now.getTime() - date.getTime();
		Assert.isTrue(difference < 1000.0);
	}

	public function testAbstractFrom():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractFrom>123.4</tests:abstractFrom>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractFrom"));
		var abstractFrom = (result : TestPropertiesClass).abstractFrom;
		Assert.equals(123.4, abstractFrom);
	}

	public function testAbstractFromModuleType():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:abstractFromModuleType>123.4</tests:abstractFromModuleType>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("abstractFromModuleType"));
		var abstractFromModuleType:ModuleType = (result : TestPropertiesClass).abstractFromModuleType;
		Assert.equals(123.4, abstractFromModuleType.value);
	}

	public function testClassFromModuleWithDifferentName():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:classFromModuleWithDifferentName>
					<tests:ThisClassHasADifferentNameThanItsModule prop="hello"/>
				</tests:classFromModuleWithDifferentName>
			</tests:TestPropertiesClass>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isOfType(result, TestPropertiesClass);
		Assert.isFalse(idMap.exists("classFromModuleWithDifferentName"));
		var classFromModuleWithDifferentName = (result : TestPropertiesClass).classFromModuleWithDifferentName;
		Assert.equals("hello", classFromModuleWithDifferentName.prop);
	}

	public function testFunctionAttribute():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				func="testMethod"/>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				func=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionChildElement():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:func>testMethod</tests:func>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:func></tests:func>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:func><mx:String>hello</mx:String></tests:func>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:func><tests:TestPropertiesClass/></tests:func>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:func><mx:Struct/></tests:func>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionTypedAttribute():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				funcTyped="testMethod"/>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionTypedAttributeEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests"
				funcTyped=""/>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionTypedChildElement():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:funcTyped>testMethod</tests:funcTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionTypedChildElementEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:funcTyped></tests:funcTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionTypedChildElementWithInvalidTypeAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:funcTyped><mx:String>hello</mx:String></tests:funcTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionTypedChildElementWithInvalidTypeNotAssignableByString():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:funcTyped><tests:TestPropertiesClass/></tests:funcTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}

	public function testFunctionTypedChildElementWithInvalidStruct():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:funcTyped><mx:Struct/></tests:funcTyped>
			</tests:TestPropertiesClass>
		'), MXHXRuntimeComponentException);
	}
}
