package fixtures;

abstract TestAbstractFrom(Float) from Float to Float {
	@:from
	public static function fromString(str:String):TestAbstractFrom {
		return 123.4;
	}
}
