package mxhx.runtime;

import mxhx.runtime.MXHXRuntimeComponent.MXHXRuntimeComponentException;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentPrivateTest extends Test {
	public function testPrivateEmpty():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Private></mx:Private>
			</mx:Object>
		');
		Assert.notNull(result);
	}

	public function testPrivateXml():Void {
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Private>
					<abc>123.4</abc>
				</mx:Private>
			</mx:Object>
		');
		Assert.notNull(result);
	}

	public function testPrivateInvalidXml():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Private>
					<abc>123.4</def>
				</mx:Private>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testPrivateNotLast():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Private></mx:Private>
				<mx:value>123.4</mx:value>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}

	public function testPrivateWithAttribute():Void {
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<mx:Object xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:Private id="hello"></mx:Private>
			</mx:Object>
		'), MXHXRuntimeComponentException);
	}
}
