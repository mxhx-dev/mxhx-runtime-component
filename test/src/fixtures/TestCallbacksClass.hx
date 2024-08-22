package fixtures;

import haxe.Constraints.Function;

@:event("change")
class TestCallbacksClass {
	public var simpleFunction:Function;
	public var mapToString:(Any) -> String;
	public var mapToAny:(Any) -> Any;
	public var mapToDynamic:(Any) -> Any;

	public function new() {}
}
