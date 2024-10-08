package mxhx.runtime;

import fixtures.TestCallbacksClass;
import haxe.Constraints.Function;
import mxhx.runtime.MXHXRuntimeComponent.MXHXRuntimeComponentException;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentMapToCallbackTest extends Test {
	public function testMapToCallbackEmpty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:MapToCallback/>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testMapToCallbackMissingProperty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:MapToCallback/>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testMapToCallbackDeclarations():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:MapToCallback id="callback" property="propName"/>
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

		var callbackValue = {propName: "propValue"};
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals("propValue", callbackResult);
	}

	public function testMapToCallbackPropertyValue():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
				</mx:Declarations>
				<mx:mapToCallbackProp>
					<mx:MapToCallback id="callback" property="propName"/>
				</mx:mapToCallbackProp>
			</mx:Object>
		', {
				idMap: idMap
			});
		Assert.notNull(result);
		var callback = Reflect.getProperty(result, "mapToCallbackProp");
		Assert.notNull(callback);
		Assert.isTrue(Reflect.isFunction(callback));

		var callbackValue = {propName: "propValue"};
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals("propValue", callbackResult);
	}

	public function testMapToCallbackWhitespaceChild():Void {
		var idMap:Map<String, Any> = [];
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:MapToCallback id="callback" property="propName">

					</mx:MapToCallback>
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

		var callbackValue = {propName: "propValue"};
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals("propValue", callbackResult);
	}

	public function testMapToCallbackInvalidProperty():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:MapToCallback id="callback" property="propName" invalid="hi"/>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testMapToCallbackInvalidTextChild():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:MapToCallback id="callback" property="propName">
						invalid child
					</mx:MapToCallback>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testMapToCallbackInvalidTagChild():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Declarations>
					<mx:SetCallback id="callback" property="propName">
						<mx:invalid>invalid</mx:invalid>
					</mx:SetCallback>
				</mx:Declarations>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testMapToCallbackAny():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestCallbacksClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:mapToAny>
					<mx:MapToCallback property="propName"/>
				</tests:mapToAny>
			</tests:TestCallbacksClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestCallbacksClass);
		var strictResult = cast(result, TestCallbacksClass);
		var callback = strictResult.mapToAny;
		Assert.notNull(callback);
		Assert.isTrue(Reflect.isFunction(callback));

		var callbackValue = {propName: 123.4};
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals(123.4, callbackResult);
	}

	public function testMapToCallbackString():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestCallbacksClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:mapToString>
					<mx:MapToCallback property="propName"/>
				</tests:mapToString>
			</tests:TestCallbacksClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestCallbacksClass);
		var strictResult = cast(result, TestCallbacksClass);
		var callback = strictResult.mapToString;
		Assert.notNull(callback);
		Assert.isTrue(Reflect.isFunction(callback));

		var callbackValue = {propName: 123.4};
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals("123.4", callbackResult);
	}

	public function testMapToCallbackSimpleFunction():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestCallbacksClass
				xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:simpleFunction>
					<mx:MapToCallback property="propName"/>
				</tests:simpleFunction>
			</tests:TestCallbacksClass>
		');
		Assert.notNull(result);
		Assert.isOfType(result, TestCallbacksClass);
		var strictResult = cast(result, TestCallbacksClass);
		var callback = strictResult.simpleFunction;
		Assert.notNull(callback);
		Assert.isTrue(Reflect.isFunction(callback));

		var callbackValue = {propName: 123.4};
		var callbackResult = Reflect.callMethod(null, callback, [callbackValue]);
		Assert.equals(123.4, callbackResult);
	}
}
