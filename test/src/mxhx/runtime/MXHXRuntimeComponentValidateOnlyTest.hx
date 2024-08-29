package mxhx.runtime;

import mxhx.parser.MXHXParserProblem;
import mxhx.runtime.MXHXRuntimeOptions;
import mxhx.runtime.MXHXRuntimeComponent.MXHXRuntimeComponentException;
import utest.Assert;
import utest.Test;

class MXHXRuntimeComponentValidateOnlyTest extends Test {
	public function testValidateOnlyTrueWithInvalidDocument():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:fakeproperty>123.4</tests:fakeproperty>
			</tests:TestPropertiesClass>
		', options);
		Assert.isNull(result);
		Assert.equals(1, problems.length);
	}

	public function testValidateOnlyTrueWithValidDocument():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
			</tests:TestPropertiesClass>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}

	public function testValidateOnlyFalse():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: false,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:fakeproperty>123.4</tests:fakeproperty>
			</tests:TestPropertiesClass>
		', options);
		Assert.notNull(result);
		Assert.equals(1, problems.length);
	}

	public function testValidateOnlyNull():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: null,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<tests:TestPropertiesClass xmlns:mx="https://ns.mxhx.dev/2024/basic"
				xmlns:tests="https://ns.mxhx.dev/2024/tests">
				<tests:fakeproperty>123.4</tests:fakeproperty>
			</tests:TestPropertiesClass>
		', options);
		Assert.notNull(result);
		Assert.equals(1, problems.length);
	}
}
