package mxhx.runtime;

import haxe.Constraints.Function;
import mxhx.runtime.MXHXRuntimeComponent.MXHXRuntimeComponentException;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentSetCallbackTest extends Test {
	public function testSetCallbackEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:SetCallback/>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testSetCallbackMissingProperty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:Struct id="theTarget"/>
					<mx:SetCallback target="theTarget"/>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testSetCallbackMissingTarget():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:SetCallback property="propName"/>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testSetCallbackDeclarations():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:Struct id="theTarget"/>
					<mx:SetCallback id="callback" target="theTarget" property="propName"/>
				</mx:Declarations>
			</mx:Object>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isTrue(idMap.exists("callback"));
		var callback = idMap.get("callback");
		Assert.notNull(callback);
		Assert.isTrue(Reflect.isFunction(callback));

		Assert.isTrue(idMap.exists("theTarget"));
		var theTarget = idMap.get("theTarget");
		Assert.notNull(theTarget);
		Assert.equals(null, Reflect.getProperty(theTarget, "propName"));
		Reflect.callMethod(null, callback, ["newValue"]);
		Assert.equals("newValue", Reflect.getProperty(theTarget, "propName"));
	}

	public function testSetCallbackPropertyValue():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:Struct id="theTarget"/>
				</mx:Declarations>
				<mx:setCallbackProp>
					<mx:SetCallback target="theTarget" property="propName"/>
				</mx:setCallbackProp>
			</mx:Object>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		var callback = Reflect.getProperty(result, "setCallbackProp");
		Assert.notNull(callback);
		Assert.isTrue(Reflect.isFunction(callback));

		Assert.isTrue(idMap.exists("theTarget"));
		var theTarget = idMap.get("theTarget");
		Assert.notNull(theTarget);
		Assert.isNull(Reflect.getProperty(theTarget, "propName"));

		var callbackValue = "newValue";
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals("newValue", callbackResult);
		Assert.equals("newValue", Reflect.getProperty(theTarget, "propName"));
	}

	public function testSetCallbackWhitespaceChild():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:Struct id="theTarget"/>
					<mx:SetCallback id="callback" target="theTarget" property="propName">
					
					</mx:SetCallback>
				</mx:Declarations>
			</mx:Object>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		Assert.isTrue(idMap.exists("callback"));
		var callback = idMap.get("callback");
		Assert.notNull(callback);
		Assert.isTrue(Reflect.isFunction(callback));

		Assert.isTrue(idMap.exists("theTarget"));
		var theTarget = idMap.get("theTarget");
		Assert.notNull(theTarget);
		Assert.isNull(Reflect.getProperty(theTarget, "propName"));

		var callbackValue = "newValue";
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals("newValue", callbackResult);
		Assert.equals("newValue", Reflect.getProperty(theTarget, "propName"));
	}

	public function testSetCallbackInvalidProperty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:Struct id="theTarget"/>
					<mx:SetCallback id="callback" target="theTarget" property="propName" invalid="hi"/>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testSetCallbackInvalidTextChild():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:Struct id="theTarget"/>
					<mx:SetCallback id="callback" target="theTarget" property="propName">
						invalid child
					</mx:SetCallback>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testSetCallbackInvalidTagChild():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:Struct id="theTarget"/>
					<mx:SetCallback id="callback" target="theTarget">
						<mx:property>propName</mx:property>
					</mx:SetCallback>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}
}
