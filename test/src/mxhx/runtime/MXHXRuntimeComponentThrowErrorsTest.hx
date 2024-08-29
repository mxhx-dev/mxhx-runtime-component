package mxhx.runtime;

import mxhx.parser.MXHXParserProblem;
import mxhx.runtime.MXHXRuntimeOptions;
import mxhx.runtime.MXHXRuntimeComponent.MXHXRuntimeComponentException;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentThrowErrorsTest extends Test {
	public function testDisableThrowErrors():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:fakeproperty>123.4</tests:fakeproperty>
			</tests:TestPropertiesClass>
		', options);
		// the object will still be created, but the property won't be set
		// because it doesn't exist
		Assert.notNull(result);
		Assert.equals(1, problems.length);
	}

	public function testEnableThrowErrors():Void {
		var options:MXHXRuntimeOptions = {
			throwErrors: true
		}
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:fakeproperty>123.4</tests:fakeproperty>
			</tests:TestPropertiesClass>
		', options), MXHXRuntimeComponentException);
	}

	public function testNullThrowErrors():Void {
		var options:MXHXRuntimeOptions = {
			throwErrors: null // defaults to true
		}
		Assert.raises(() -> MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:fakeproperty>123.4</tests:fakeproperty>
			</tests:TestPropertiesClass>
		', options), MXHXRuntimeComponentException);
	}
}
