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

	public function testValidateOnlyTrueXml():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Xml xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<abc>123.4</abc>
			</mx:Xml>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}

	public function testValidateOnlyTrueDate():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Date xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<mx:fullYear>2024</mx:fullYear>
			</mx:Date>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}

	public function testValidateOnlyTrueModel():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Model xmlns:mx="https://ns.mxhx.dev/2024/basic">
				<abc>123.4</abc>
			</mx:Model>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}

	public function testValidateOnlyTrueString():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:String xmlns:mx="https://ns.mxhx.dev/2024/basic">hello</mx:String>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}

	public function testValidateOnlyTrueFloat():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Float xmlns:mx="https://ns.mxhx.dev/2024/basic">123.4</mx:Float>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}

	public function testValidateOnlyTrueInt():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Int xmlns:mx="https://ns.mxhx.dev/2024/basic">567</mx:Int>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}

	public function testValidateOnlyTrueBool():Void {
		var problems:Array<MXHXParserProblem> = [];
		var options:MXHXRuntimeOptions = {
			throwErrors: false,
			validateOnly: true,
			problems: problems
		}
		var result = MXHXRuntimeComponent.withMarkup('
			<mx:Bool xmlns:mx="https://ns.mxhx.dev/2024/basic">true</mx:Bool>
		', options);
		Assert.isNull(result);
		Assert.equals(0, problems.length);
	}
}
